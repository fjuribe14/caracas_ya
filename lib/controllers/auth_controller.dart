import 'dart:convert';

import 'package:caracas_ya_app/controllers/controller.dart';
import 'package:caracas_ya_app/database/dao/usuario_dao.dart';
import 'package:caracas_ya_app/database/models/models.dart';
import 'package:caracas_ya_app/models/login_request.dart';
import 'package:caracas_ya_app/routes/routes.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var usuario = <String, dynamic>{}.obs;

  var username = TextEditingController();
  var password = TextEditingController();

  @override
  void onInit() async {
    await init();
    super.onInit();
  }

  // Asynchronous function that initializes the user, retrieves user data from the database using UsuarioDao, and performs a login if the user data is not null. Catches and prints any errors that occur during the process.
  Future init() async {
    await setUsusario();
  }

  Future setUsusario() async {
    try {
      const storage = FlutterSecureStorage();
      final storageUsername = await storage.read(key: 'username');
      final storagePsswrd = await storage.read(key: 'psswrd');

      await UsuarioDao().get().then((value) {
        if (value != null) usuario.value = value.toJson();
      });

      if (storageUsername != null) {
        username.text = storageUsername;
      }

      if (storagePsswrd != null) {
        password.text = utf8.decode(base64.decode(storagePsswrd));
        await login();
      }

      debugPrint('init storageUsername: $storageUsername');
      debugPrint('init storagePsswrd: $storagePsswrd');
      debugPrint('init usuario: ${usuario.toJson()}');
    } catch (e) {
      debugPrint('No se encontro el usuario');
    }
  }

  Future login() async {
    try {
      const storage = FlutterSecureStorage();
      final encodedPassword = base64.encode(utf8.encode(password.text));
      final url = '${dotenv.get('URL_AUTH')}/api/v3/auth/login';
      final data = {
        "username": username.text,
        "password": encodedPassword,
        "grant_type": "password",
        "secret": dotenv.get('SECRET_AUTH'),
        "client_id": dotenv.get('CLIENT_AUTH'),
        "scope": "*",
      };

      final response = await HttpController()
          .fetchData(method: 'POST', url: url, data: data);

      final loginRequest = LoginRequest.fromJson(response);
      final decodedToken = JWT.decode(loginRequest.accessToken!);
      final user = Usuario.fromJson(decodedToken.payload['user']);

      await storage.write(key: 'username', value: user.username);
      await storage.write(key: 'psswrd', value: encodedPassword);
      await storage.write(key: 'token', value: loginRequest.accessToken);

      final createdUser = await UsuarioDao().create(user);

      usuario.value = Map.of(createdUser.toJson());

      Get.offAllNamed(Routes.home);
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future logout() async {
    const storage = FlutterSecureStorage();

    try {
      final url = '${dotenv.get('URL_AUTH')}/api/v3/auth/logout';
      await HttpController().fetchData(url: url);
    } catch (e) {
      debugPrint('$e');
    } finally {
      storage.delete(key: 'psswrd');
      storage.delete(key: 'token');
      Get.offAllNamed(Routes.login);
    }
  }
}

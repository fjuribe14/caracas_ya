import 'dart:convert';

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  String? tokenType;
  int? expiresIn;
  String? accessToken;
  String? refreshToken;
  String? roles;

  LoginRequest({
    this.tokenType,
    this.expiresIn,
    this.accessToken,
    this.refreshToken,
    this.roles,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
        roles: json["roles"],
      );

  Map<String, dynamic> toJson() => {
        "token_type": tokenType,
        "expires_in": expiresIn,
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "roles": roles,
      };
}

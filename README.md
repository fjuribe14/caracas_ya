# caracas_ya_app

Starter flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Native Splash

    dart run flutter_native_splash:create --path=flutter_native_splash.yaml

## Isar DB

    flutter pub add isar isar_flutter_libs

    flutter pub add -d isar_generator build_runner

    dart run build_runner build

## Biometric permissions

    flutter pub add local_auth app_settings flutter_secure_storage permission_handler

### # Config IOS Integration

ios\Runner\Info.plist

    <key>NSFaceIDUsageDescription</key>
    <string>Why is my app authenticating using face id?</string>

### # Config Android Integration

<strong>android\app\src\main\kotlin\com\example\app\MainActivity.kt</strong>

    import io.flutter.embedding.android.FlutterFragmentActivity;

    public class MainActivity extends FlutterFragmentActivity {
    // ...
    }

<strong>android\app\src\main\AndroidManifest.xml</strong>

    <manifest xmlns:android="http://schemas.android.com/apk/res/android">
        <uses-permission android:name="android.permission.USE_BIOMETRIC"/>
        // ...
    </manifest>

## FlutterFire

    npm install -g firebase-tools

    flutter pub add firebase_core

    # Install the CLI if not already done so
    dart pub global activate flutterfire_cli

    # Run the `configure` command, select a Firebase project and platforms
    flutterfire configure

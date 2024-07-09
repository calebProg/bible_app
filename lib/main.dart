import 'package:bible_app/pages/auth_page.dart';
import 'package:bible_app/pages/create_message.dart';
import 'package:bible_app/pages/home_page.dart';
import 'package:bible_app/pages/login_or_register_page.dart';
import 'package:bible_app/pages/profile_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const AuthPage(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        '/login_or_register_page': (context) => const LoginOrRegisterPage(),
        '/home_page': (context) => HomePage(),
        '/profile_page': (context) => ProfilePage(),
        '/create_message': (context) => CreateMessage(),
      },
    );
  }
}

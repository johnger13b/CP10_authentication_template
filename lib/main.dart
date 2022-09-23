import 'package:f_authentication/ui/app.dart';
import 'package:f_authentication/ui/controllers/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /* Inicializa Firebase */
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  /* TO DO: Inyecta el controlador de autentucacion */
  Get.put(AuthController());
  runApp(const AuthApp());
}

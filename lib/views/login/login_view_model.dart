import 'package:firebase_app/core/extensions/log_ext.dart';
import 'package:firebase_app/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends ContextProvider with ChangeNotifier {
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late AuthService service;

  @override
  void init() {
    emailController = TextEditingController(text: "mehmet@gmail.com");
    passwordController = TextEditingController(text: "12345678");
  }

  Future<void> register() async {
    try {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        "Email ve Şifre boş olamaz!".log(logName: "Email/şifre Hatası");
      }
      final user = await service.registerWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      user.log(logName: "Firebase User");
    } on FirebaseUserException catch (userException) {
      userException.message.log(logName: "Register Exception");
    }
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
    service = context.read<AuthService>();
  }
}

abstract class ContextProvider {
  BuildContext? context;
  void setContext(BuildContext context);
  void init();
}

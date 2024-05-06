import 'package:finder/feature/login/presentation/refactors/login_body.dart';
import 'package:flutter/material.dart';



class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBody(),
    );
  }
}

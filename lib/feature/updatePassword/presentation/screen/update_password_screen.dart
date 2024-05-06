import 'package:finder/feature/updatePassword/presentation/refactor/update_password_body.dart';
import 'package:flutter/material.dart';

class UpdatePasswordView extends StatelessWidget {
  const UpdatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const UpdatePasswordBody(),
    );
  }
}

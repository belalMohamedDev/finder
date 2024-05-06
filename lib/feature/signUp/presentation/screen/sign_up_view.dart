import 'package:finder/feature/signUp/presentation/refactors/register_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SignUpBody()),
    );
  }
}

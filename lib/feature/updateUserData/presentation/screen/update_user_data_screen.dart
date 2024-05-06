
import 'package:finder/feature/updateUserData/presentation/refactor/update_user_data_body.dart';
import 'package:flutter/material.dart';


class UpdateUserDataView extends StatelessWidget {
  const UpdateUserDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const UpdateUserDataBody(),
    );
  }
}


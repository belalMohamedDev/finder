
import 'package:finder/core/style/colors/colors_light.dart';
import 'package:finder/feature/aiScreen/presentation/manager/ai_body_view.dart';

import 'package:flutter/material.dart';



class AiView extends StatefulWidget {
  const AiView({super.key});

  @override
  State<AiView> createState() => _AiViewState();
}

class _AiViewState extends State<AiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsLight.lightBlack),
      ),
      body: const AiViewBody(),
    );
  }


}


import 'package:flutter/material.dart';

class MissingView extends StatefulWidget {
  const MissingView({ Key? key }) : super(key: key);

  @override
  State<MissingView> createState() => _MissingViewState();
}

class _MissingViewState extends State<MissingView> {
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
      body: Center(child: Text("missing")),
    );
  }
}
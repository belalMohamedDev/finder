import 'package:flutter/material.dart';

class FoundView extends StatefulWidget {
  const FoundView({ Key? key }) : super(key: key);

  @override
  State<FoundView> createState() => _FoundViewState();
}

class _FoundViewState extends State<FoundView> {
  @override
  Widget build(BuildContext context) {
  return const Scaffold(
      body: Center(child: Text("found")),
    );
  }
}
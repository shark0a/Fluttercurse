import 'package:flutter/material.dart';

class SeconedPage extends StatelessWidget {
  const SeconedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Text("Hello"),
    );
  }
}
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Text('Welcome ${widget.name}!'),
      ),
    );
  }
}

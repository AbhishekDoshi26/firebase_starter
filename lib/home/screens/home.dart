import 'package:firebase_test/authentication/services/database_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.email}) : super(key: key);
  final String email;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '';
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    name = (await DatabaseService().getUser(widget.email))!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Text('Welcome $name!'),
      ),
    );
  }
}

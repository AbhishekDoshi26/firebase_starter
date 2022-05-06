import 'package:firebase_test/authentication/bloc/authentication_bloc.dart';
import 'package:firebase_test/authentication/screens/create_account.dart';
import 'package:firebase_test/home/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is SuccessState) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Home(name: state.name),
            ),
          );
        }
        if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationBloc>().add(
                        LoginWithEmailAndPasswordEvent(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                },
                child: const Text('Login'),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CreateAccount(),
                    ),
                  );
                },
                child: const Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

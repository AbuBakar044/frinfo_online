import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frinfo_online/views/auth/register.dart';
import 'package:frinfo_online/views/friends/home_screen.dart';
import 'package:frinfo_online/utils/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const FlutterLogo(
                size: 100.0,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "*please add this field";
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "*please add this field";
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_loginFormKey.currentState!.validate()) {
                    loginWithFirebse();
                  }
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 8.0),
              TextButton(
                onPressed: () {
                  // Add your navigation logic here
                },
                child: const Text('Forgot Password?'),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      goNextScreen(context, SignupScreen());
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginWithFirebse() async {
    try {
      firebaseAuth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        emailController.clear();
        passwordController.clear();

        removeAndGoNextScreen(context, HomeScreen());
      });
    } on FirebaseAuthException catch (e) {}
  }
}

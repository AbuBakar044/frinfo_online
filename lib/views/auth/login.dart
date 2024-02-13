import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frinfo_online/controllers/login_controller.dart';
import 'package:frinfo_online/views/auth/register.dart';
import 'package:frinfo_online/views/friends/home_screen.dart';
import 'package:frinfo_online/utils/routes.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put<LoginController>(LoginController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: ctrl.loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const FlutterLogo(
                size: 100.0,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: ctrl.emailController,
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
                controller: ctrl.passwordController,
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
                  ctrl.validateFields();
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
                      Get.to(() => SignupScreen());
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
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frinfo_online/controllers/register_controller.dart';
import 'package:frinfo_online/views/friends/home_screen.dart';
import 'package:frinfo_online/utils/routes.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put<RegisterController>(RegisterController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: ctrl.regiserFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const FlutterLogo(
                  size: 100.0,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*please add this field";
                    }
                  },
                  controller: ctrl.nameCtrl,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*please add this field";
                    }
                  },
                  controller: ctrl.emailCtrl,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*please add this field";
                    }
                  },
                  controller: ctrl.passCtrl,
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
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        // Add your navigation logic here
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

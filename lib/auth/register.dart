import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frinfo_online/friends/home_screen.dart';
import 'package:frinfo_online/utils/routes.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _regiserFormKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    passCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _regiserFormKey,
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
                  controller: nameCtrl,
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
                  controller: emailCtrl,
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
                  controller: passCtrl,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_regiserFormKey.currentState!.validate()) {
                      registerWithFirebase();
                    }
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

  Future<void> registerWithFirebase() async {
    try {
      firebaseAuth
          .createUserWithEmailAndPassword(
              email: emailCtrl.text, password: passCtrl.text)
          .then((value) {
        nameCtrl.clear();
        emailCtrl.clear();
        passCtrl.clear();

        removeAndGoNextScreen(context, HomeScreen());
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }
}

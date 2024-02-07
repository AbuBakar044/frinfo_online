import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frinfo_online/auth/login.dart';
import 'package:frinfo_online/friends/home_screen.dart';
import 'package:frinfo_online/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color indicatorColor = Colors.black;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      //removeAndGoNextScreen(context, LoginScreen());
      checkUserLoginStatus();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.jpg',
                    height: 120.0,
                    width: 120.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Frinfo',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 0,
              right: 0,
              child: Center(
                child: CircularProgressIndicator(
                  color: indicatorColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> checkUserLoginStatus() async {
    if (firebaseAuth.currentUser != null) {
      removeAndGoNextScreen(context, HomeScreen());
    } else {
      removeAndGoNextScreen(context, LoginScreen());
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frinfo_online/controllers/splash_controller.dart';
import 'package:frinfo_online/views/auth/login.dart';
import 'package:frinfo_online/views/friends/home_screen.dart';
import 'package:frinfo_online/utils/routes.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color indicatorColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    Get.put<SplashController>(SplashController());
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
}

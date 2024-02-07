import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frinfo_online/auth/login.dart';
import 'package:frinfo_online/utils/routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              //logoutUser();
              showLogoutDialog(context);
            },
          )
        ],
      ),
    );
  }

  Future<void> logoutUser(BuildContext context) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Logout successfully!"),
        duration: Duration(
          seconds: 2,
        ),
      ));

      Future.delayed(const Duration(seconds: 3), () {
        removeAndGoNextScreen(context, LoginScreen());
      });
    });
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Logout"),
            content: const Text("Are you sure to logout?"),
            actions: [
              TextButton(
                onPressed: () {
                  removeRoute(context);
                },
                child: const Text(
                  'Cancel',
                ),
              ),
              TextButton(
                onPressed: () {
                  logoutUser(context);
                  removeRoute(context);
                },
                child: const Text(
                  "Logout",
                ),
              )
            ],
          );
        });
  }
}

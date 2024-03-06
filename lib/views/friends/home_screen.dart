import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:frinfo_online/controllers/home_controller.dart';
import 'package:frinfo_online/model/user_model.dart';
import 'package:frinfo_online/views/friends/add_friends_screen.dart';
import 'package:frinfo_online/utils/colors.dart';
import 'package:frinfo_online/model/friend_model.dart';
import 'package:frinfo_online/utils/routes.dart';
import 'package:frinfo_online/views/friends/view_friend_screen.dart';
import 'package:frinfo_online/widgets/custom_drawer.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //An empty friends list
  List<FriendModel> friendsList = [];

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.put<HomeController>(HomeController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: greenColor,
          title: const Text(
            'Home Screen',
            style: TextStyle(
              color: whiteColor,
            ),
          ),
          centerTitle: true,
        ),
        drawer: CustomDrawer(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: greenColor,
          onPressed: () {
            goNextScreen(context, const AddFriendsScreen());
          },
          child: const Icon(
            Icons.add,
            color: whiteColor,
          ),
        ),
        body: GetBuilder<HomeController>(builder: (ctrl) {
          return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  EasyLoading.show(status: 'Loading...');
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.transparent,
                      color: Colors.transparent,
                    ),
                  );
                }
                if (!snapshot.hasData) {
                  return Center(
                    child: Text('No Friends Found'),
                  );
                } else {
                  EasyLoading.dismiss();
                  var data = snapshot.data;
                  UserModel userModel = UserModel.fromDocumentsSnapshot(data!);
                  friendsList = userModel.userFriends!
                      .map((data) => FriendModel.fromJson(data))
                      .toList();

                 
                  return ListView.builder(
                    itemCount: friendsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          tileColor: Colors.green,
                          onTap: () {
                            // goNextScreen(
                            //     context,
                            //     ViewFriendScreen(
                            //         friendName: friendList[index].name!,
                            //         friendNumber: friendList[index].number!,
                            //         friendDesc: friendList[index].desc!,
                            //         friendImage: friendList[index].image!));
                          },
                          // onLongPress: () {
                          //   callMyFriend(friendList[index].number!);
                          // },
                          leading: CircleAvatar(
                            backgroundImage: friendsList[index].image == null ||
                                    friendsList[index].image!.isEmpty
                                ? const AssetImage('assets/images/logo.jpg')
                                : NetworkImage(friendsList[index].image!)
                                    as ImageProvider,
                          ),
                          title: Text(
                            friendsList[index].name!,
                            style: const TextStyle(
                              color: whiteColor,
                            ),
                          ),
                          subtitle: Text(
                            friendsList[index].number!,
                            style: const TextStyle(
                              color: whiteColor,
                            ),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                // deleteFriend(index);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: whiteColor,
                              )),
                        ),
                      );
                    },
                  );
                }
              });
        }));
  }

  // //Function to get friends from Hive Database
  // Future<void> getFriendsFromDatabase() async {
  //   //Accessed the box of Friends

  //   //Converted all the box values to list and assigned them to our list
  //   friendList = friendsBox!.values.toList().cast<FriendModel>();

  //   //Change Screen state to show data
  //   setState(() {});
  // }

  // Future<void> deleteFriend(int index) async {
  //   friendList.removeAt(index);
  //   //await friendsBox!.deleteAt(index);
  //   setState(() {});
  // }

  // Future<void> callMyFriend(String number) async {
  //   if (!await launchUrl(Uri.parse('tel:$number'))) {
  //     throw Exception('Could not launch');
  //   }
  // }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frinfo_online/controllers/add_friend_controller.dart';
import 'package:frinfo_online/utils/colors.dart';
import 'package:frinfo_online/model/friend_model.dart';
import 'package:frinfo_online/utils/routes.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

class AddFriendsScreen extends StatefulWidget {
  const AddFriendsScreen({super.key});

  @override
  State<AddFriendsScreen> createState() => _AddFriendsScreenState();
}

class _AddFriendsScreenState extends State<AddFriendsScreen> {
  final addFrndCtrl = Get.put<AddFriendController>(AddFriendController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            removeRoute(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: whiteColor,
          ),
        ),
        title: const Text(
          'Add Friends',
          style: TextStyle(
            color: whiteColor,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<AddFriendController>(builder: (ctrl) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: addFrndCtrl.formKey,
              child: ListView(
                children: [
                  InkWell(
                    onTap: () {
                      showSheet();
                    },
                    child: CircleAvatar(
                      radius: 65.0,
                      backgroundColor: Colors.amber,
                      backgroundImage: addFrndCtrl.friendImage == null
                          ? const AssetImage('assets/images/logo.jpg')
                          : MemoryImage(addFrndCtrl.friendImage!)
                              as ImageProvider,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: addFrndCtrl.nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '*please fill this field';
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      hintText: 'Add Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: addFrndCtrl.numberController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty ||
                          value.length < 11 ||
                          value.length > 11 ||
                          !value.startsWith('03')) {
                        return '*please correctly fill this field';
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Add Number'),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    maxLines: 10,
                    controller: addFrndCtrl.descController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '*please fill this field';
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Add Description'),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      addFrndCtrl.validateFields();
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: whiteColor),
                    ),
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        greenColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  showSheet() {
    return showModalBottomSheet(
        context: context,
        backgroundColor: greenColor,
        builder: (context) {
          return Container(
            height: MediaQuery.sizeOf(context).height / 4,
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Text(
                    'Choose Picture From',
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                addFrndCtrl.pickImage(ImageSource.camera);
                              },
                              icon: const Icon(
                                Icons.camera,
                                size: 34,
                                color: whiteColor,
                              ),
                            ),
                            const Text(
                              'Camera',
                              style: TextStyle(
                                color: whiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30.0,
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                addFrndCtrl.pickImage(ImageSource.gallery);
                              },
                              icon: const Icon(
                                Icons.album,
                                size: 34,
                                color: whiteColor,
                              ),
                            ),
                            const Text(
                              'Gallery',
                              style: TextStyle(
                                color: whiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

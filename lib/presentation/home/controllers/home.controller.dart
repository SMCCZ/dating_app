import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/models/user.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../home.screen.dart';
import '../match_making.screen.dart';
import '../profile.screen.dart';

class HomeController extends GetxController {
  var userId = FirebaseAuth.instance.currentUser?.uid;
  var user = UserModel().obs;
  final allUsers = <UserModel>[].obs;
  final screens = [
    const MatchMakingScreen(),
    const LikedScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ].obs;

  var isUsersLoading = false.obs;
  @override
  void onInit() {
    getUser();
    getUsers();
    super.onInit();
  }

  final selectedScreenIndex = 0.obs;

  Future<Uint8List?> onUploadImage(BuildContext context) async {
    var result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      var bytes = result.files.first.bytes;
      var path = userId;
      var uploadTask = await FirebaseStorage.instance
          .ref('$path/${result.files.first.name}')
          .putData(bytes!);
      var url = await uploadTask.ref.getDownloadURL();
      user.value.id = userId;
      user.value.posts = user.value.posts ?? [];
      user.value.posts!.add(
        Post(
          imgUrl: url,
          createdAt: DateTime.now().toUtc(),
        ),
      );

      updateUser();
      Get.back();
      return bytes;
    } else {
      Get.back();
      return null;
    }
  }

  Future<UserModel?> getUser() async {
    var snap =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (snap.exists) {
      var temp = UserModel.fromJson(snap.data()!);
      user.value = temp;
      return temp;
    } else {
      return null;
    }
  }

  getUsers() async {
    isUsersLoading.value = true;
    var snap = await FirebaseFirestore.instance.collection('users').get();
    var temp = snap.docs.map((e) {
      var temp = UserModel.fromJson(e.data());
      temp.id = e.id;
      return temp;
    });
    allUsers.clear();
    allUsers.addAll(temp);
    allUsers.addAll(temp);
    allUsers.addAll(temp);
     isUsersLoading.value = false;
  }

  Future<UserModel?> updateUser() async {
    var toUpdate = user.value;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .set(toUpdate.toJson());
    return toUpdate;
  }

  void onSwipeLeft(int previousIndex, int currentIndex) {}

  void onSwipeRight(int previousIndex, int currentIndex) {}
}

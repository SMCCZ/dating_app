import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: controller.screens[controller.selectedScreenIndex.value],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.blue,
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: controller.selectedScreenIndex.value == 0
                      ? Colors.white
                      : Colors.blue,
                ),
                child: IconButton(
                  onPressed: () {
                    controller.selectedScreenIndex.value = 0;
                  },
                  icon: const Icon(
                    Icons.home,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: controller.selectedScreenIndex.value == 1
                      ? Colors.white
                      : Colors.blue,
                ),
                child: IconButton(
                  onPressed: () {
                    controller.selectedScreenIndex.value = 1;
                  },
                  icon: const Icon(
                    Icons.favorite,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: controller.selectedScreenIndex.value == 2
                      ? Colors.white
                      : Colors.blue,
                ),
                child: IconButton(
                  onPressed: () {
                    controller.selectedScreenIndex.value = 2;
                  },
                  icon: const Icon(
                    Icons.chat,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: controller.selectedScreenIndex.value == 3
                      ? Colors.white
                      : Colors.blue,
                ),
                child: IconButton(
                  onPressed: () {
                    controller.selectedScreenIndex.value = 3;
                  },
                  icon: const Icon(
                    Icons.person,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class LikedScreen extends GetView<HomeController> {
  const LikedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          "assets/noResult.png",
        ),
        Center(
          child: Text(
            "Comming Soon !!",
            style: GoogleFonts.acme(
              fontSize: 16,
              letterSpacing: 2.0,
            ),
          ),
        )
      ],
    );
  }
}

class ChatScreen extends GetView<HomeController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          "assets/noResult.png",
        ),
        Center(
          child: Text(
            "Comming Soon !!",
            style: GoogleFonts.acme(
              fontSize: 16,
              letterSpacing: 2.0,
            ),
          ),
        )
      ],
    );
  }
}

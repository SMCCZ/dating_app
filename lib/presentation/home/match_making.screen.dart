import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/home.controller.dart';
import 'profile.screen.dart';

class MatchMakingScreen extends GetView<HomeController> {
  const MatchMakingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Obx(() {
          return Expanded(
            child: ListView(
              children: [
                if (controller.allUsers.length > 1)
                  SizedBox(
                    width: width,
                    height: height * 0.9,
                    child: CardSwiper(
                      cardsCount: controller.allUsers.length,
                      onSwipe: (previousIndex, currentIndex, direction) async {
                        try {
                          print(
                              "[M] currentIndex $currentIndex oldIndex $previousIndex");
                          controller.allUsers.removeAt(0);
                          if (direction == CardSwiperDirection.left) {
                            controller.onSwipeLeft(
                                previousIndex, previousIndex);
                          }
                          if (direction == CardSwiperDirection.right) {
                            controller.onSwipeRight(
                                previousIndex, previousIndex);
                          }
                          return true;
                        } catch (e) {
                          return false;
                        }
                      },
                      cardBuilder: (context, index, percentThresholdX,
                          percentThresholdY) {
                        return Container(
                          // margin: const EdgeInsets.all(16),
                          width: width,
                          height: height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                spreadRadius: 2.0,
                                blurRadius: 3.0,
                              ),
                            ],
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              // Image.asset("assets/trademark.png"),
                              if (controller.allUsers[index].posts != null &&
                                  controller
                                      .allUsers[index].posts!.isNotEmpty &&
                                  controller.allUsers[index].posts?.first
                                          .imgUrl !=
                                      null)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    controller
                                        .allUsers[index].posts!.first.imgUrl!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      bottom: 32.0, right: 40),
                                  margin: const EdgeInsets.only(
                                      bottom: 8, left: 8, right: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.blue.shade400),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.close,
                                          size: 64,
                                          color: Colors.white,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.star,
                                          size: 64,
                                          color: Colors.white,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.favorite,
                                          size: 64,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                else
                  Container(
                    margin: const EdgeInsets.all(16),
                    width: width,
                    height: height * 0.85,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          spreadRadius: 2.0,
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/noResult.png",
                        ),
                        Text(
                          "No matching found!!",
                          style: GoogleFonts.acme(
                            fontSize: 24,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (controller.isUsersLoading.value)
                  const LoadingIndicator(color: Colors.red),
              ],
            ),
          );
        }),
      ],
    );
  }
}

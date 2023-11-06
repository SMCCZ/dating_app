import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/home.controller.dart';

class ProfileScreen extends GetView<HomeController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final auth = FirebaseAuth.instance.currentUser;
    var cardWidth = 140.66; //width / 3 - (3 * 7);
    var cardHeight = 180.66;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() {
          return Expanded(
            child: ListView(
              children: [
                const SizedBox(
                  height: 16,
                ),
                if (auth?.photoURL != null)
                  CircleAvatar(
                    radius: 64.0,
                    child: Image.network(
                      auth!.photoURL!,
                      fit: BoxFit.cover,
                      width: 64,
                      height: 64,
                    ),
                  ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(
                    auth?.displayName ?? "",
                    style: GoogleFonts.acme(
                      fontSize: 16,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    auth?.email ?? "",
                    style: GoogleFonts.acme(
                      fontSize: 16,
                    ),
                  ),
                ),
                const Divider(),
                Center(
                  child: Wrap(
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FutureBuilder<Uint8List?>(
                                      future: controller.onUploadImage(context),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Column(
                                            children: const [
                                              CircularProgressIndicator(
                                                color: Colors.blue,
                                                strokeWidth: 2.0,
                                              ),
                                            ],
                                          );
                                        }
                                        if (snapshot.hasData) {
                                          return Image.memory(
                                            snapshot.data!,
                                            width: cardWidth,
                                            height: cardHeight,
                                          );
                                        }
                                        return Container();
                                      },
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.blue,
                          ),
                          width: cardWidth,
                          height: cardHeight,
                          child: const Icon(
                            Icons.add,
                          ),
                        ),
                      ),
                      ...List.generate(
                        controller.user.value.posts?.length ?? 0,
                        (index) {
                          print(cardWidth);
                          return Container(
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Colors.blue,
                            ),
                            width: cardWidth,
                            height: cardHeight,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(32),
                              child: Image.network(
                                controller.user.value.posts![index].imgUrl!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  final Color color;
  const LoadingIndicator({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
      strokeWidth: 2.0,
    );
  }
}

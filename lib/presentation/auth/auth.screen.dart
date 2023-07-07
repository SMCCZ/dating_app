import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/auth.controller.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const _AuthCarousel(),
          const _AuthHeadingText(
            heading: "Algorithm",
          ),
          const _AuthDescriptionText(),
          _CreateAccountButton(
            onPressed: () {
              //Get.toNamed(Routes.SIGNUP);
            },
          )
        ],
      ),
    );
  }
}

class _AuthHeadingText extends StatelessWidget {
  final String? heading;
  const _AuthHeadingText({
    Key? key,
    this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      heading ?? "",
      style: GoogleFonts.roboto(
        fontSize: 14,
      ),
    );
  }
}

class _AuthDescriptionText extends StatelessWidget {
  final String? description;
  const _AuthDescriptionText({
    Key? key,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description ??
          "Users going through a vetting process to ensure you never match with bots.",
      style: GoogleFonts.roboto(
        fontSize: 14,
      ),
    );
  }
}

class _AuthCarousel extends StatelessWidget {
  const _AuthCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 320,
      decoration: BoxDecoration(),
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  final void Function()? onPressed;
  const _CreateAccountButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        height: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: onPressed,
        child: const Text(
          "Create an Account",
        ),
      ),
    );
  }
}

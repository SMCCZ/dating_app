import 'dart:ui';

import 'package:dating_app/presentation/home/profile.screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controllers/auth.controller.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Obx(() {
        return ListView(
          children: [
            Image.asset(
              "assets/auth.png",
              height: height / 2,
            ),
            _ContinueWithPhoneButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    margin: const EdgeInsets.all(16),
                    // backgroundColor: Colors.black.withOpacity(0.1),
                    showCloseIcon: true,
                    elevation: 0.0,
                    content: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: double.infinity, sigmaY: 10.0),
                      child: Text(
                        "Comming Soon !!",
                        style: GoogleFonts.acme(
                          fontSize: 16,
                          color: Colors.white,
                          letterSpacing: 2.0,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
            if (!controller.isGoogleAuthenticating.value)
              _ContinueWithGoogleButton(
                onPressed: () {
                  controller.continueWithGoogle(context);
                },
              ),
            if (controller.isGoogleAuthenticating.value)
              Column(
                children: const [
                  LoadingIndicator(color: Colors.red),
                ],
              ),
            const PrivacyPolicyAcceptaceWidget(
              isAccepted: true,
            )
          ],
        );
      }),
    );
  }
}

class _ContinueWithGoogleButton extends StatelessWidget {
  final void Function()? onPressed;
  const _ContinueWithGoogleButton({
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
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/google.png",
              width: 32,
              height: 32,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              "Continue with Google",
              style: GoogleFonts.acme(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContinueWithPhoneButton extends StatelessWidget {
  final void Function()? onPressed;
  const _ContinueWithPhoneButton({
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
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/phone.png",
              width: 32,
              height: 32,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              "Continue with Phone",
              style: GoogleFonts.acme(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacyPolicyAcceptaceWidget extends StatelessWidget {
  final bool isAccepted;
  final void Function()? onTap;
  const PrivacyPolicyAcceptaceWidget({
    super.key,
    this.onTap,
    required this.isAccepted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(
            isAccepted ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.blue,
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'I agree to the ',
                  style: GoogleFonts.acme(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: 'Terms and Conditions',
                  style: GoogleFonts.acme(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
                TextSpan(
                  text: ' and ',
                  style: GoogleFonts.acme(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: GoogleFonts.acme(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

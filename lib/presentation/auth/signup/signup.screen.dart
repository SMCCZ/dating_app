import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/signup.controller.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignupScreen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset(
            "assets/trademark.png",
          ),
          Text(
            "Sign up to continue",
            style: GoogleFonts.roboto(
              fontSize: 14,
            ),
          ),
          _SignUpButton(),
          Text(
            "Use phone number",
            style: GoogleFonts.roboto(
              fontSize: 14,
            ),
          ),
          _SignUpDivider(),
          _SocialSignUpButtons(),
          _TermsAndPrivacyPolicyLinks()
        ],
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _SocialSignUpButtons extends StatelessWidget {
  const _SocialSignUpButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}

class _SignUpDivider extends StatelessWidget {
  const _SignUpDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: SizedBox(
            width: width / 4,
            child: const Divider(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "or sign up with",
            style: GoogleFonts.roboto(
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: width / 4,
            child: const Divider(),
          ),
        ),
      ],
    );
  }
}

class _TermsAndPrivacyPolicyLinks extends StatelessWidget {
  const _TermsAndPrivacyPolicyLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Terms of use",
          style: GoogleFonts.roboto(
            fontSize: 14,
          ),
        ),
        const SizedBox(
          width: 32,
        ),
        Text(
          "Privacy Policy",
          style: GoogleFonts.roboto(
            fontSize: 14,
          ),
        )
      ],
    );
  }
}

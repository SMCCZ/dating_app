import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/signupscreen.controller.dart';

class SignupscreenScreen extends GetView<SignupscreenController> {
  const SignupscreenScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignupscreenScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SignupscreenScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

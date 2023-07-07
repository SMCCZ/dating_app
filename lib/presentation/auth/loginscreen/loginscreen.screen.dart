import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/loginscreen.controller.dart';

class LoginscreenScreen extends GetView<LoginscreenController> {
  const LoginscreenScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginscreenScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LoginscreenScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

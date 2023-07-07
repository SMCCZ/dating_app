import 'package:get/get.dart';

import '../../../../presentation/auth/signupscreen/controllers/signupscreen.controller.dart';

class SignupscreenControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupscreenController>(
      () => SignupscreenController(),
    );
  }
}

import 'package:get/get.dart';

import '../../../../presentation/auth/loginscreen/controllers/loginscreen.controller.dart';

class LoginscreenControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginscreenController>(
      () => LoginscreenController(),
    );
  }
}

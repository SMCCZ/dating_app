import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'initilizer.dart';

void main() async {
  await Initializer.init();
  var initialRoute = await Routes.initialRoute;
  runApp(MyApp(initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      getPages: Nav.routes,
      theme: ThemeData.dark(),
    );
  }
}

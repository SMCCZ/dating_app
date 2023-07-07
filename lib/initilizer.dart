
import 'package:flutter/widgets.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      // await _initStorage();
      // _initGetConnect();
      // _initGlobalLoading();
      // _initScreenPreference();
    } catch (err) {
      rethrow;
    }
  }

  // static Future<void> _initGetConnect() async {
  //   final connect = GetConnect();
  //   final url = ConfigEnvironments.getEnvironments()['url'];
  //   connect.baseUrl = url;
  //   connect.timeout = const Duration(seconds: 20);
  //   connect.httpClient.maxAuthRetries = 0;

  //   connect.httpClient.addRequestModifier<dynamic>(
  //     (request) {
  //       final storage = Get.find<GetStorage>();
  //       final token = storage.read(StorageConstants.tokenAuthorization);
  //       if (token != null) {
  //         request.headers['Authorization'] = 'Bearer $token';
  //       }
  //       return request;
  //     },
  //   );

  //   connect.httpClient.addResponseModifier(
  //     (request, response) async {
  //       if (response.statusCode == 401) {
  //         final authDomainBinding = AuthRepositoryBinding();
  //         await authDomainBinding.repository.logoutUser();
  //         Get.offAllNamed(Routes.login);
  //         SnackbarUtil.showWarning(
  //           message: 'Faça login novamente para continuar utilizando o sistema',
  //         );
  //       }
  //     },
  //   );

  //   Logger().i('Conectado em: $url');
  //   Get.put(connect);
  // }

  // static void _initGlobalLoading() {
  //   final loading = LoadingController();
  //   Get.put(loading);
  // }

  // static Future<void> _initStorage() async {
  //   await GetStorage.init();
  //   Get.put(GetStorage());
  // }

  // static void _initScreenPreference() {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);
  // }
}

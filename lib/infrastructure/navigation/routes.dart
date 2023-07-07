import 'package:dating_app/infrastructure/dal/services/auth_service.dart';

// ignore_for_file: constant_identifier_names

class Routes {
  static Future<String> get initialRoute async {
    var authService = AuthService();
    if (await authService.isAuthenticated) {
      return HOME;
    }
    return AUTH;
  }

  static const AUTH = '/auth';
  static const HOME = '/home';
  static const LOGINSCREEN = '/loginscreen';
  static const SIGNUPSCREEN = '/signupscreen';
}

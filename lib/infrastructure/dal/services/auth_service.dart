import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final _auth = FirebaseAuth.instance;
  Future<bool> get isAuthenticated async {
    return _auth.currentUser != null;
  }
}

import 'package:firebase_auth/firebase_auth.dart';

/// repository 개념
abstract class AuthenticationDatasource {
  //-- 1
  Future<void> register(String email, String password, String passwordConfirm);

  //-- 2
  Future<void> login(String email, String password);
}

/// repoImpl
class AuthenticationRemote extends AuthenticationDatasource {
  @override
  Future<void> login(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
  }

  @override
  Future<void> register(String email, String password, String passwordConfirm) async {
    if (password == passwordConfirm) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
    } else {
      return null;
    }
  }
  //
}

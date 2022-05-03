import 'package:padac/services/auth/iauth_service.dart';

class AuthPageAdapter {
  final Function moveToLoginScreen;
  final Function moveToRegisterScreen;
  final Function moveToHomeScreen;

  AuthPageAdapter(
      this.moveToLoginScreen, this.moveToRegisterScreen, this.moveToHomeScreen);
}

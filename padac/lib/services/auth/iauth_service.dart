import 'package:padac/models/token.dart';
import 'package:async/async.dart';

abstract class IAuthAPI {
  Future<Result<Token>> login(String email, String password);
  Future<Result<Token>> register(String email, String password);
  Future<void> logout();
}

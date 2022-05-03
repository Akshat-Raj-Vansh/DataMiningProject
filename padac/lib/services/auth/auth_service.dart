import 'package:padac/cache/ilocal_store.dart';
import 'package:padac/services/auth/iauth_service.dart';

import '../../models/token.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;

class AuthAPI implements IAuthAPI {
  final ILocalStore localStore;
  final http.Client _client;
  final String baseUrl;
  var header = {
    "Content-Type": "application/json",
  };

  AuthAPI(this.localStore, this._client, this.baseUrl);

  @override
  Future<Result<Token>> login(String email, String password) async {
    return Future.value(Result.value(Token(value: 'value')));
  }

  @override
  Future<Result<Token>> register(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }
}

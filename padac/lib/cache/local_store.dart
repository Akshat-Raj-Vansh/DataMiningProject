import 'dart:convert';

import 'package:padac/models/credentials.dart';
import 'package:padac/models/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ilocal_store.dart';

const String token_key = "CACHED__TOKEN_AND_DATA";
const String info_key = "CACHED__INFO";

class LocalStore implements ILocalStore {
  final SharedPreferences sharedPreferences;
  LocalStore(this.sharedPreferences);

  @override
  Future<Token> getToken() {
    String? data = sharedPreferences.getString(token_key);
    if (data != null) {
      Credential cred = Credential.fromMap(jsonDecode(data));
      return Future.value(cred.token);
    }
    return Future.value(Token(value: 'value'));
  }

  @override
  delete() {
    sharedPreferences.remove(token_key);
  }

  @override
  void save(Credential credential) {
    sharedPreferences.setString(token_key, jsonEncode(credential.toMap()));
  }
}

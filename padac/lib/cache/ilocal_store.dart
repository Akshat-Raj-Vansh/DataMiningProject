import 'package:padac/models/credentials.dart';
import 'package:padac/models/token.dart';

abstract class ILocalStore {
  Future<Token> getToken();
  delete();
  save(Credential credential);
}

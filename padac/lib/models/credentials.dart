import 'dart:convert';

import 'package:padac/models/token.dart';

class Credential {
  String email;
  Token token;
  Credential({
    required this.email,
    required this.token,
  });

  Credential copyWith({
    String? email,
    Token? token,
  }) {
    return Credential(
      email: email ?? this.email,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'token': token.toMap(),
    };
  }

  factory Credential.fromMap(Map<String, dynamic> map) {
    return Credential(
      email: map['email'] ?? '',
      token: Token.fromMap(map['token']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Credential.fromJson(String source) =>
      Credential.fromMap(json.decode(source));

  @override
  String toString() => 'Credential(email: $email, token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Credential && other.email == email && other.token == token;
  }

  @override
  int get hashCode => email.hashCode ^ token.hashCode;
}

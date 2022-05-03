import 'dart:convert';

class Token {
  final String value;
  Token({
    required this.value,
  });

  Token copyWith({
    String? value,
  }) {
    return Token(
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      value: map['value'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) => Token.fromMap(json.decode(source));

  @override
  String toString() => 'Token(value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Token && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

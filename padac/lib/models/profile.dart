import 'dart:convert';

import 'package:padac/models/credentials.dart';

class Profile {
  final Credential credential;
  final String district;
  final String city;
  final String state;
  Profile({
    required this.credential,
    required this.district,
    required this.city,
    required this.state,
  });

  Profile copyWith({
    Credential? credential,
    String? district,
    String? city,
    String? state,
  }) {
    return Profile(
      credential: credential ?? this.credential,
      district: district ?? this.district,
      city: city ?? this.city,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'credential': credential.toMap(),
      'district': district,
      'city': city,
      'state': state,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      credential: Credential.fromMap(map['credential']),
      district: map['district'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Profile(credential: $credential, district: $district, city: $city, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Profile &&
        other.credential == credential &&
        other.district == district &&
        other.city == city &&
        other.state == state;
  }

  @override
  int get hashCode {
    return credential.hashCode ^
        district.hashCode ^
        city.hashCode ^
        state.hashCode;
  }
}

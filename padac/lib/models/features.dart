import 'dart:convert';

class Features {
  final double pvalue;
  final double nvalue;
  final double kvalue;
  final double ph;
  final double temp;
  final double humidity;
  final double rainfall;
  Features({
    required this.pvalue,
    required this.nvalue,
    required this.kvalue,
    required this.ph,
    required this.temp,
    required this.humidity,
    required this.rainfall,
  });

  Features copyWith({
    double? pvalue,
    double? nvalue,
    double? kvalue,
    double? ph,
    double? temp,
    double? humidity,
    double? rainfall,
  }) {
    return Features(
      pvalue: pvalue ?? this.pvalue,
      nvalue: nvalue ?? this.nvalue,
      kvalue: kvalue ?? this.kvalue,
      ph: ph ?? this.ph,
      temp: temp ?? this.temp,
      humidity: humidity ?? this.humidity,
      rainfall: rainfall ?? this.rainfall,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pvalue': pvalue,
      'nvalue': nvalue,
      'kvalue': kvalue,
      'ph': ph,
      'temp': temp,
      'humidity': humidity,
      'rainfall': rainfall,
    };
  }

  factory Features.fromMap(Map<String, dynamic> map) {
    return Features(
      pvalue: map['pvalue']?.toDouble() ?? 0.0,
      nvalue: map['nvalue']?.toDouble() ?? 0.0,
      kvalue: map['kvalue']?.toDouble() ?? 0.0,
      ph: map['ph']?.toDouble() ?? 0.0,
      temp: map['temp']?.toDouble() ?? 0.0,
      humidity: map['humidity']?.toDouble() ?? 0.0,
      rainfall: map['rainfall']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Features.fromJson(String source) =>
      Features.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Features(pvalue: $pvalue, nvalue: $nvalue, kvalue: $kvalue, ph: $ph, temp: $temp, humidity: $humidity, rainfall: $rainfall)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Features &&
        other.pvalue == pvalue &&
        other.nvalue == nvalue &&
        other.kvalue == kvalue &&
        other.ph == ph &&
        other.temp == temp &&
        other.humidity == humidity &&
        other.rainfall == rainfall;
  }

  @override
  int get hashCode {
    return pvalue.hashCode ^
        nvalue.hashCode ^
        kvalue.hashCode ^
        ph.hashCode ^
        temp.hashCode ^
        humidity.hashCode ^
        rainfall.hashCode;
  }
}

import 'dart:convert';

class Result {
  int? error;
  String? msj;

  Result({this.error, this.msj});
  factory Result.fromMap(String source) => Result.fromJson(json.decode(source));
  Result.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msj = json['msj'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['error'] = error;
    data['msj'] = msj;
    return data;
  }
}

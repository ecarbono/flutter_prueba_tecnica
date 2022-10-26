// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_prueba_tecnica/model/model_result.dart';
import 'package:flutter_prueba_tecnica/provider/variables.dart';
import 'package:http/http.dart' as http;

class Usuario {
  String? docuemnto;
  String? nombre;
  String? apellido;
  String? fechanacimiento;
  String? direccion_1;
  String? direccion_2;
  String? direccion_3;

  Usuario(
      {this.docuemnto,
      this.nombre,
      this.apellido,
      this.fechanacimiento,
      this.direccion_1,
      this.direccion_2,
      this.direccion_3});

  Usuario.fromJson(Map<String, dynamic> json) {
    docuemnto = json['user_id'];
    nombre = json['nombre'];
    apellido = json['apellido'];
    fechanacimiento = json['fecha_nacimiento'];
    direccion_1 = (json['direccion_1'] != "") ? json['direccion_1'] : "N/A";
    direccion_2 = (json['direccion_2'] != "") ? json['direccion_2'] : "N/A";
    direccion_3 = (json['direccion_3'] != "") ? json['direccion_3'] : "N/A";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['user_id'] = docuemnto;
    data['nombre'] = nombre;
    data['apellido'] = apellido;
    data['fecha_nacimiento'] = fechanacimiento;
    data['direccion_1'] = (direccion_1 != "") ? direccion_1 : "N/A";
    data['direccion_2'] = (direccion_2 != "") ? direccion_2 : "N/A";
    data['direccion_3'] = (direccion_3 != "") ? direccion_3 : "N/A";
    return data;
  }

  Future<List<Usuario>> getUsuarios() async {
    Usuario usuario = Usuario();
    List<Usuario> usuarios = [];
    final uri = Uri.parse('$url/usuarios');

    List valor;

    try {
      final response = await http.get(
        uri,
        headers: {"Content-Type": "application/json"},
      ).timeout(
        const Duration(seconds: 15),
      );
      if (response.statusCode == 200 && response.body != "") {
        valor = json.decode(response.body);
        if (valor.isNotEmpty) {
          for (var element in valor) {
            usuario = Usuario.fromJson(element);
            usuarios.add(usuario);
          }
        }
      }
    } on TimeoutException catch (_) {
      debugPrint("TimeoutException: ${_.message}");
    } on SocketException catch (_) {
      debugPrint("SocketException: ${_.message}");
    }
    return usuarios;
  }

  Future<Result> postRegustrarUsuario({required Usuario usuario}) async {
    Result result = Result();
    final uri = Uri.parse('$url/agregar');

    var valor;
    var jsonEncoder = jsonEncode(
      {
        "user_id": usuario.docuemnto,
        "nombre": usuario.nombre,
        "apellido": usuario.apellido,
        "fecha_nacimiento": usuario.fechanacimiento,
        "direccion_1": usuario.direccion_1,
        "direccion_2": usuario.direccion_2,
        "direccion_3": usuario.direccion_3
      },
    );
    try {
      final response = await http
          .post(uri,
              headers: {"Content-Type": "application/json"}, body: jsonEncoder)
          .timeout(
            const Duration(seconds: 15),
          );
      if (response.statusCode == 200 && response.body != "") {
        valor = json.decode(response.body)["data"];
        result = Result.fromJson(valor);
      }
    } on TimeoutException catch (_) {
      debugPrint("TimeoutException: ${_.message}");
    } on SocketException catch (_) {
      debugPrint("SocketException: ${_.message}");
    }
    return result;
  }
}

import 'dart:convert';

import 'package:colegio_app/api/api_constant.dart';
import 'package:colegio_app/domain/repositories/alumno.repository.dart';
import 'package:colegio_app/model/alumnos.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AlumnoWebRepository implements AlumnoRepository {
  @override
  Future<List<Alumno>> getAlumnos() async {
    try {
      print('GETTING ALUMNOS');
      var url = Uri.parse('${Apiconstant.url}/alumnos');
      return await http.get(url).then((res) {
        var body = json.decode(res.body);
        List<Alumno> alumnosList = [];
        for (var i = 0; i < body.length; i++) {
          alumnosList.add(Alumno.fromJson(body[i]));
        }
        return alumnosList;
      });
    } catch (e) {
      throw Exception('ERROR: $e');
    }
  }

  @override
  Future<String> addAlumno(Alumno alumno) async {
    try {
      print('${alumno.toJson()}');
      var url = Uri.parse('${Apiconstant.url}/alumnos');
      // var result = '';
      var response = await http.post(url, body: alumno.toJson());
      print('estado: ${response.statusCode}');
      print('body: ${response.body}');
      return 'true';
    } catch (e) {
      print('error: $e');
      throw Exception('method POST failed');
    }
  }

  @override
  Future<String> deleteAlumno(String id) async {
    try {
      var url = Uri.parse('${Apiconstant.url}/alumnos/${id}');
      var result = 'false';
      var response = await http.delete(url).then((value) {
        print('STATUS: ${value.statusCode}');
        print('delete BODY: ${value.body}');
        return result = 'true';
      });
      print('response: $response');
      return result;
    } catch (e) {
      print(e);
      return 'false';
    }
  }

  @override
  Future<String> updateAlumno(Alumno alumno) async {
    try {
      var url = Uri.parse('${Apiconstant.url}/alumnos/${alumno.id}');
      print('URL PUT: ${url}');
      var response = await http.put(
        url,
        body: alumno.toJson(),
      );
      print('STATUS PUT: ${response.statusCode}');
      print('BODY PUT: ${response.body}');
      return 'true';
    } catch (e) {
      throw Exception('method PUT failded');
    }
  }

// @override
// Future<String> updateAlumno(Alumno alumno) async{
//   try{
//     var url = Uri.parse('$dataUrlSchool/alumnos/${alumno.id}');
//     String resData = '';
//     await http.put(
//       url,
//       body: {
//         'nombres':(alumno.nombres).toString(),
//       },
//       headers: {'Authorization':'your_token'},
//     ).then((response) {
//       Map<String,dynamic> result = json.decode(response.body);
//       print('actualizando: ${result}');
//       return resData = result['nombres'];
//     });
//     return resData;
//   }catch(e){
//     throw Exception('method PUT failded');
//   }
// }

}

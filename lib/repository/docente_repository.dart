import 'dart:convert';
import 'dart:math';

import 'package:colegio_app/domain/repositories/docente.repository.dart';
import 'package:colegio_app/model/docente.dart';
import 'package:http/http.dart' as http;

class DocenteWebRepository implements DocenteRepository{
  String dataUrlSchool = 'https://us-central1-sistema-colegio-4a695.cloudfunctions.net/app';

  @override
  Future<String> addDocente(Docente docente) {
    // TODO: implement addSalon
    throw UnimplementedError();
  }

  @override
  Future<String> deleteDocente(String id) {
    // TODO: implement deleteSalon
    throw UnimplementedError();
  }

  @override
  Future<List<Docente>> getDocentes() async{
    try{

      var url = Uri.parse('$dataUrlSchool/docentes');
      return await http.get(url).then((value) {
        print('data: ${value.body}');
        var body = json.decode(value.body);
        List<Docente> docentesList = [];
        for(var i =0;i< body.length;i++){
          docentesList.add(Docente.fromJson(body[i]));
        }
        return docentesList;
      });
    }catch(e){
      throw Exception('Error: $e');
    }
  }

  @override
  Future<String> updateDocente(Docente docente) {
    // TODO: implement updateSalon
    throw UnimplementedError();
  }


}
import 'dart:convert';

import 'package:colegio_app/domain/repositories/salon.repository.dart';
import 'package:colegio_app/model/salon.dart';
import 'package:http/http.dart' as http;

class SalonWebRepository implements SalonRepository{

  String dataUrlSchool = 'https://us-central1-sistema-colegio-4a695.cloudfunctions.net/app';

  @override
  Future<String> addSalon(Salon salon) {
    // TODO: implement addSalon
    throw UnimplementedError();
  }

  @override
  Future<String> deleteSalon(String id) {
    // TODO: implement deleteSalon
    throw UnimplementedError();
  }

  @override
  Future<List<Salon>> getSalones() async{
    List<Salon> salonesList = [];
    try{
      var url = Uri.parse('$dataUrlSchool/salones');
      var response = await http.get(url);
      var body = json.decode(response.body);

      print(response.body);
      for(var i = 0;i< body.length; i++){
        salonesList.add(Salon.fromJson(body[i]));
      }
      return salonesList;
    }
    catch(error){
      print(error);
      throw Exception('method GET failded');
    }
  }

  @override
  Future<String> updateSalon(Salon salon) {
    // TODO: implement updateSalon
    throw UnimplementedError();
  }

}
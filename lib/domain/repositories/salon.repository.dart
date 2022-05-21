import 'package:colegio_app/model/salon.dart';

abstract class SalonRepository{
  Future<List<Salon>> getSalones();

  Future<String> addSalon(Salon salon);

  Future<String> updateSalon(Salon salon);

  Future<String> deleteSalon(String id);
}
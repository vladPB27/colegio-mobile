import 'package:colegio_app/model/docente.dart';

abstract class DocenteRepository{
  Future<List<Docente>> getDocentes();

  Future addDocente(Docente docente);

  Future updateDocente(Docente docente);

  Future deleteDocente(String id);
}
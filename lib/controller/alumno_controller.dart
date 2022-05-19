import 'package:colegio_app/domain/repositories/alumno.repository.dart';
import 'package:colegio_app/model/alumnos.dart';

class AlumnoController{
  final AlumnoRepository _repository;

  AlumnoController(this._repository);

  Future<List<Alumno>> fetchAlumnoList() async {
    return _repository.getAlumnos();
  }

  Future<String> updateAlumnoCompleted(Alumno alumno) async {
    return _repository.updateAlumno(alumno);
  }
}
import 'package:colegio_app/model/alumnos.dart';

abstract class AlumnoRepository{
  Future<List<Alumno>> getAlumnos();

  Future<String> addAlumno(Alumno alumno);

  Future<String> updateAlumno(Alumno alumno);

  Future<String> deleteAlumno(String id);
}
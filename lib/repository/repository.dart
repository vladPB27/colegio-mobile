import 'package:colegio_app/model/todo.dart';
import 'package:colegio_app/model/alumnos.dart';

abstract class Repository{
  //get
  Future<List<Todo>> getTodoList();
//  patch
  Future<String> patchComplete(Todo todo);
  //put
  Future<String> putComplete(Todo todo);
  //delete
  Future<String> deleteTodo(Todo todo);
  //post
  Future<String> postTodo(Todo todo);

  // Alumnos

}

import 'dart:convert';
import 'package:colegio_app/model/alumnos.dart';
import 'package:colegio_app/model/todo.dart';
import 'package:colegio_app/repository/repository.dart';
import 'package:http/http.dart' as http;

class TodoRepository implements Repository{

  //use http
  String dataUrl = 'https://jsonplaceholder.typicode.com';


  @override
  Future<String> deleteTodo(Todo todo) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getTodoList() async{
    List<Todo> todoList = [];
    var url = Uri.parse('$dataUrl/todos');
    var response = await http.get(url);
    print('URL: ${url}');
    print('status code: ${response.statusCode}');
    var body = json.decode(response.body);
    // print('BODY code: $body');

    for(var i = 0;i< body.length; i++){
      todoList.add(Todo.fromJson(body[i]));
    }
    print('LIST: $todoList');
    return todoList;
  }

  @override
  Future<String> patchComplete(Todo todo) {
    // TODO: implement patchComplete
    throw UnimplementedError();
  }

  @override
  Future<String> postTodo(Todo todo) {
    // TODO: implement postTodo
    throw UnimplementedError();
  }

  @override
  Future<String> putComplete(Todo todo) {
    // TODO: implement putComplete
    throw UnimplementedError();
  }

  @override//TODO ojo ver si este metodo queda aqui o se debe crear  un alumno_repository.dart
  Future<List<Alumno>> getAlumnos() {
    // TODO: implement getAlumnos
    throw UnimplementedError();
  }

}
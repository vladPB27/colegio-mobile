import 'package:colegio_app/repository/repository.dart';
import 'package:colegio_app/model/todo.dart';

class TodoController{
  final Repository _repository;

  TodoController(this._repository);

  //get
  Future<List<Todo>> fetchTodoList() async {
    return _repository.getTodoList();
  }
}
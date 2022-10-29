import 'package:restsimple/models/todo.dart';
import 'package:restsimple/repository/repository.dart';

class TodoController {
  final Repository _repository;

  TodoController(this._repository);

  Future<List<Todo>> fetchTodoList() async {
    return _repository.getTodoList();
  }
  Future<String> updatePathCompleted(Todo todo) async {
    return _repository.patchCompleted(todo);
  }
  Future<String> updatePutCompleted(Todo todo) async {
    return _repository.putCompleted(todo);
  }
    Future<String> deleteCompleted(Todo todo) async {
    return _repository.deleteCompleted(todo);
  }
  Future<String> postTodo(Todo todo) async {
    return _repository.patchCompleted(todo);
  }

}
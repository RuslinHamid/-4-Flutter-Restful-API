import 'package:restsimple/models/todo.dart';
import 'package:restsimple/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TodoRepository implements Repository{
  String dataURL = "https://jsonplaceholder.typicode.com";



  @override
  Future<List<Todo>> getTodoList() async {
    // TODO: implement getTodoList

    List<Todo> todoList = [];
    var url = Uri.parse('$dataURL/todos');
    var response = await http.get(url);
    print('status code : ${response.statusCode}');
    var body = json.decode(response.body);

    for (var i = 0; i< body.length; i++) {
      todoList.add(Todo.fromJson(body[i]));
    }
    return todoList;
    //throw UnimplementedError();
  }

  @override
  Future<String> patchCompleted(Todo todo) async {
    // TODO: implement patchCompleted

    var url = Uri.parse('$dataURL/todos/${todo.id}');
    String resData = '';
    await http.patch(
      url,
      body: {
        'completed': (!todo.completed!).toString(),
      },
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      print(result);
      return resData = result['completed'];
    });

    return resData;
    
    //throw UnimplementedError();
  }

  @override
  Future<String> postComleted(Todo todo) async {

    print('${todo.toJson()}');
    var url = Uri.parse('$dataURL/todos/');
    String result = '';
    var response = await http.post(url, body: todo.toJson());
    print(response.statusCode);
    print(response.body);
    
    return 'true';
    //throw UnimplementedError();
  }

  @override
  Future<String> putCompleted(Todo todo) async {
    // TODO: implement putCompleted
    var url = Uri.parse('$dataURL/todos/${todo.id}');
    String resData = '';
    await http.put(
      url,
      body: {
        'completed': (!todo.completed!).toString(),
      },
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      print(result);
      return resData = result['completed'];
    });

    return resData;
    throw UnimplementedError();
  }
  @override
  Future<String> deleteCompleted (Todo todo) async {
    var url = Uri.parse('$dataURL/todos/${todo.id}');
    var result = 'false';

    await http.delete(url).then((value) {
      print(value.body);
      return result = 'true';
    });

    return result;
  }
}
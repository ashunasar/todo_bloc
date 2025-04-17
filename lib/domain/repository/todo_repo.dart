import 'package:todo_bloc/domain/models/todo.dart';

abstract class TodoRepo {
  // get list of todos
  Future<List<Todo>> getTodos();

  Future<void> addTodo(Todo newTodo);

  Future<void> updateTodo(Todo newTodo);

  Future<void> deleteTodo(Todo newTodo);
}

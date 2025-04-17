import 'package:isar/isar.dart';
import 'package:todo_bloc/data/models/isar_todo.dart';
import 'package:todo_bloc/domain/models/todo.dart';
import 'package:todo_bloc/domain/repository/todo_repo.dart';

class IsarTodoRepo implements TodoRepo {
  final Isar db;

  IsarTodoRepo(this.db);

  @override
  Future<void> addTodo(Todo newTodo) async {
    final todoIsar = TodoIsar.fromDomain(newTodo);

    await db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  @override
  Future<void> deleteTodo(Todo newTodo) async {
    await db.writeTxn(() async {
      return await db.todoIsars.delete(newTodo.id);
    });
  }

  @override
  Future<List<Todo>> getTodos() async {
    var todos = await db.todoIsars.where().findAll();
    return todos.map((t) => t.toDomain()).toList();
  }

  @override
  Future<void> updateTodo(Todo newTodo) async {
    final todoIsar = TodoIsar.fromDomain(newTodo);

    await db.writeTxn(() => db.todoIsars.put(todoIsar));
  }
}

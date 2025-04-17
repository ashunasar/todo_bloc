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
    db.writeTxnSync(() => db.todoIsars.putSync(todoIsar));
  }

  @override
  Future<void> deleteTodo(Todo newTodo) async {
    db.writeTxnSync(() => db.todoIsars.deleteSync(newTodo.id));
  }

  @override
  Future<List<Todo>> getTodos() async {
    final todos = await db.todoIsars.where().findAll();

    return todos.map((t) => t.toDomain()).toList();
  }

  @override
  Future<void> updateTodo(Todo newTodo) async {
    await addTodo(newTodo);
  }
}

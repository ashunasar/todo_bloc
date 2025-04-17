import 'package:isar/isar.dart';
import 'package:todo_bloc/domain/models/todo.dart';

part 'isar_todo.g.dart';

@collection
class TodoIsar {
  Id id = Isar.autoIncrement;
  final String text;
  final bool isCompleted;

  TodoIsar({required this.id, required this.text, required this.isCompleted});

  Todo toDomain() {
    return Todo(id: id, text: text, isCompleted: isCompleted);
  }

  factory TodoIsar.fromDomain(Todo t) {
    return TodoIsar(id: t.id, text: t.text, isCompleted: t.isCompleted);
  }
}

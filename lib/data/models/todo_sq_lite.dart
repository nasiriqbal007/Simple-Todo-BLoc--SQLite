import 'package:todo_bloc/domain/models/todo_model.dart';

class SQLiteTodo {
  final int? id; // Nullable ID
  final String text;
  final bool isCompleted;

  SQLiteTodo({
    this.id,
    required this.text,
    required this.isCompleted,
  });

  // Convert SQLiteTodo to a Map (for SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  // Create SQLiteTodo from a Map
  factory SQLiteTodo.fromMap(Map<String, dynamic> map) {
    return SQLiteTodo(
      id: map['id'],
      text: map['text'],
      isCompleted: map['isCompleted'] == 1,
    );
  }

  // Convert to domain Todo
  Todo toDomain() {
    return Todo(id: id!, text: text, isCompleted: isCompleted);
  }

  // Convert from domain Todo to SQLiteTodo
  static SQLiteTodo fromDomain(Todo todo) {
    return SQLiteTodo(id: todo.id, text: todo.text, isCompleted: todo.isCompleted);
  }
}

import 'package:todo_bloc/domain/models/todo_model.dart';

abstract class TodoRepository{
Future<List<Todo>>getTodos();
Future<void>addTodo(Todo newTodo);
Future<void>updateTodo(Todo todo);
Future<void>deleteTodo(Todo todo);
}
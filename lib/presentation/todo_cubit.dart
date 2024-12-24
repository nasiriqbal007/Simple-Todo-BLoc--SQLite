
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/domain/models/todo_model.dart';
import 'package:todo_bloc/domain/repository/todo_repository.dart';

class TodoCubit extends Cubit<List<Todo>>{
  final TodoRepository todoRepository;
TodoCubit(this.todoRepository) : super([]){
 loadTodos(); }
Future<void>loadTodos()async{
final todoList=await todoRepository.getTodos();
emit(todoList);

}
Future<void>addTodo( String text)async{
    final newTodo=Todo(id:DateTime.now().microsecond, text: text);
    await todoRepository.addTodo(newTodo);
    loadTodos();
}
Future<void>deleteTodo(Todo todo)async{
await todoRepository.deleteTodo(todo);
loadTodos();
}
void toggleTodoCompletion(Todo todo) async {
    final updatedTodo = todo.toggleCompletion(); // Create a new instance with toggled completion
    await todoRepository.updateTodo(updatedTodo);
    loadTodos(); // Refresh the list of todos
  }
}
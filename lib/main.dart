import 'package:flutter/material.dart';
import 'package:todo_bloc/data/sq_lite_repository.dart';
import 'package:todo_bloc/presentation/todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize your SQLite repository
    final SQLiteTodoRepository todoRepository = SQLiteTodoRepository();
 
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TodoPage(todoRepository: todoRepository), // Pass the repository directly
    );
  }
}

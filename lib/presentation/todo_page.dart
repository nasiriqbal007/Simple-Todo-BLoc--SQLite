import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/domain/repository/todo_repository.dart';
import 'package:todo_bloc/presentation/todo_cubit.dart';
import 'package:todo_bloc/presentation/todo_view.dart';

class TodoPage extends StatelessWidget {
  final TodoRepository todoRepository;
  const TodoPage({super.key, required this.todoRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (create)=>TodoCubit(todoRepository)
   , child: const TodoView(),
    );
  }
}
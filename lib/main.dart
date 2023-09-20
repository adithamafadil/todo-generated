import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_generated/di/inject.dart';
import 'package:flutter_generated/presentation/blocs/todo/todo_cubit.dart';
import 'package:flutter_generated/presentation/screen/home/home_screen.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<TodoCubit>(
        create: (context) => inject<TodoCubit>()..getTodos(),
        child: const MaterialApp(home: HomeSreen()),
      );
}

part of 'todo_cubit.dart';

class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoSuccess extends TodoState {
  List<TodoEntity> todoList;

  TodoSuccess({required this.todoList});
}

class TodoError extends TodoState {
  String? error;

  TodoError({this.error});
}

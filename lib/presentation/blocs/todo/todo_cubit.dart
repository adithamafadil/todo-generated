import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_generated/domain/entities/todo/todo_entity.dart';
import 'package:flutter_generated/domain/usecases/todo/get_todos_usecase.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final GetTodosUsecase getTodosUsecase;
  TodoCubit({required this.getTodosUsecase}) : super(TodoInitial());

  void getTodos() async {
    emit(TodoLoading());

    final result = await getTodosUsecase.call();

    emit(TodoSuccess(todoList: result));
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_generated/domain/entities/todo/todo_entity.dart';
import 'package:flutter_generated/domain/usecases/todo/get_todos_usecase.dart';
import 'package:flutter_generated/state/view_state/view_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'todo_state.dart';
part 'todo_cubit.freezed.dart';

@injectable
class TodoCubit extends Cubit<TodoState> {
  final GetTodosUsecase getTodosUsecase;

  TodoCubit(this.getTodosUsecase) : super(TodoState.initial());

  void getTodos() async {
    emit(state.copyWith(todoListState: const ViewState.loading()));

    final result = await getTodosUsecase.call();

    emit(state.copyWith(todoListState: ViewState.success(data: result)));
  }
}

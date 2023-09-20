part of 'todo_cubit.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState({
    required ViewState<List<TodoEntity>> todoListState,
  }) = _TodoState;

  factory TodoState.initial() => const TodoState(
        todoListState: ViewState.initial(),
      );
}

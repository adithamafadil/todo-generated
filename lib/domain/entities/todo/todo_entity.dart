import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';

@freezed
class TodoEntity with _$TodoEntity {
  const factory TodoEntity({
    required String todo,
    required String id,
    required List<String> todoDetails,
  }) = _TodoEntity;
}

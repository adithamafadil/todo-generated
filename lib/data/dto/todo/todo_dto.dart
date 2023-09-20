import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_dto.g.dart';
part 'todo_dto.freezed.dart';

@freezed
class TodoDTO with _$TodoDTO {
  const factory TodoDTO({
    String? id,
    String? todo,
    @JsonKey(name: 'todo_details') List<String>? todoDetails,
  }) = _TodoDTO;

  factory TodoDTO.fromJson(Map<String, dynamic> json) =>
      _$TodoDTOFromJson(json);
}

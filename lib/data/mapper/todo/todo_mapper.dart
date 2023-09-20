import 'package:flutter_generated/data/dto/todo/todo_dto.dart';
import 'package:flutter_generated/domain/entities/todo/todo_entity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TodoMapper {
  TodoDTO toDto(TodoEntity entity) => TodoDTO(
        todo: entity.todo,
        id: entity.id,
        todoDetails: entity.todoDetails,
      );
  TodoEntity toEntity(TodoDTO dto) => TodoEntity(
        todo: dto.todo ?? '',
        id: dto.id ?? '',
        todoDetails: dto.todoDetails ?? [],
      );
}

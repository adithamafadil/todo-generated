import 'package:flutter_generated/domain/entities/todo/todo_entity.dart';

abstract class TodoRepository {
  const TodoRepository();

  Future<List<TodoEntity>> getTodos();
}

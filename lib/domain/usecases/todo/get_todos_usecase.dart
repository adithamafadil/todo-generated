import 'package:flutter_generated/domain/entities/todo/todo_entity.dart';
import 'package:flutter_generated/domain/repositories/todo/todo_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTodosUsecase {
  final TodoRepository repository;

  const GetTodosUsecase(this.repository);

  Future<List<TodoEntity>> call() async => await repository.getTodos();
}

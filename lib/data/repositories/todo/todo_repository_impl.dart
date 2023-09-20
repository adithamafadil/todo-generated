import 'package:flutter_generated/data/datasources/todo/todo_remote_datasource.dart';
import 'package:flutter_generated/data/mapper/todo/todo_mapper.dart';
import 'package:flutter_generated/domain/entities/todo/todo_entity.dart';
import 'package:flutter_generated/domain/repositories/todo/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoMapper mapper;
  final TodoRemoteDatasource remoteDatasource;

  const TodoRepositoryImpl({
    required this.mapper,
    required this.remoteDatasource,
  });

  @override
  Future<List<TodoEntity>> getTodos() async {
    final result = await remoteDatasource.getTodos();
    final todoEntity = result.map((e) => mapper.toEntity(e)).toList();

    return todoEntity;
  }
}

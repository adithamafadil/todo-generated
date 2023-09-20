import 'dart:convert';

import 'package:flutter_generated/data/dto/todo/todo_dto.dart';
import 'package:injectable/injectable.dart';

const todoExampleData =
    '[{"id": "1", "todo": "Todo 1", "todo_details":["Todo 1 Detail 1", "Todo 1 Detail 2"]},'
    '{"id": "2", "todo": "Todo 2", "todo_details":["Todo 2 Detail 1", "Todo 2 Detail 2"]},'
    '{"id": "3", "todo": "Todo 3", "todo_details":["Todo 3 Detail 1", "Todo 3 Detail 2"]},'
    '{"id": "4", "todo": "Todo 4", "todo_details":["Todo 4 Detail 1", "Todo 4 Detail 2"]},'
    '{"id": "5", "todo": "Todo 5", "todo_details":["Todo 5 Detail 1", "Todo 5 Detail 2"]},'
    '{"id": "6", "todo": "Todo 6", "todo_details":["Todo 6 Detail 1", "Todo 6 Detail 2"]},'
    '{"id": "7", "todo": "Todo 7", "todo_details":["Todo 7 Detail 1", "Todo 7 Detail 2"]}]';

@lazySingleton
class TodoRemoteDatasource {
  Future<List<TodoDTO>> getTodos() async {
    try {
      final decoded = json.decode(todoExampleData);

      return await Future.delayed(const Duration(seconds: 3)).then(
          (_) => List.from(decoded).map((e) => TodoDTO.fromJson(e)).toList());
    } catch (e) {
      rethrow;
    }
  }
}



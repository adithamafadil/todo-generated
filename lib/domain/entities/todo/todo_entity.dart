class TodoEntity {
  final String todo;
  final String id;
  final List<String> todoDetails;

  const TodoEntity({
    required this.todo,
    required this.todoDetails,
    required this.id,
  });
}

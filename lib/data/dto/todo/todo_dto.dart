class TodoDTO {
  final String? id;
  final String? todo;
  final List<String>? todoDetails;

  const TodoDTO({
    this.todo,
    this.id,
    this.todoDetails,
  });

  factory TodoDTO.fromJson(Map<String, dynamic> json) => TodoDTO(
        id: json['id'],
        todo: json['todo'],
        todoDetails:
            List<String>.from(json['todo_details']).map((e) => e).toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'todo': todo,
        'todo_details':
            List<String>.from(todoDetails ?? []).map((e) => e).toList()
      };
}

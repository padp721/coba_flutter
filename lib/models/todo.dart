class Todo {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  const Todo({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'userId': int userId,
        'title': String title,
        'completed': bool completed
      } => Todo(
        id: id,
        userId: userId,
        title: title,
        completed: completed
      ),
      _ => throw const FormatException("Failed to load todos!"),
    };
  }
}
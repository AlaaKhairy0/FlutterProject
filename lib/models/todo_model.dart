class Welcome {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  Welcome({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );
  
}

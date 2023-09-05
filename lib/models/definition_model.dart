class Definition {
  final String definition;
  final String example;

  Definition({
    required this.definition,
    required this.example,
  });

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      definition: json["definition"] as String? ?? "",
      example: json["example"] as String? ?? "",
    );
  }
}

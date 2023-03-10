class Child {
  String fullName;
  String gender;
  String schooling;
  String age;

  Child({
    required this.fullName,
    required this.gender,
    required this.schooling,
    required this.age,
  });

  Map<String, String> toJson() {
    return {
      "fullName": fullName,
      "gender": gender,
      "schooling": schooling,
      "age": age,
    };
  }
}

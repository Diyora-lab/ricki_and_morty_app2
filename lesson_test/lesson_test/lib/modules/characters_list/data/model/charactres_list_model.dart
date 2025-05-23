class CharactresListModel {
  final String name;
  final String age;

  CharactresListModel({
    required this.name,
    required this.age,
  });

  CharactresListModel addToCart({
    final String? name,
    final String? age,
  }) {
    return CharactresListModel(name: name ?? this.name, age: age ?? this.age);
  }
}

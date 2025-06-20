class LevelModel {
  final int id;
  final String name;
  final String? description;
  final int vocabularyCount;
  final int unlockRequirement;
  final DateTime createdAt;

  const LevelModel({
    required this.id,
    required this.name,
    this.description,
    this.vocabularyCount = 10,
    this.unlockRequirement = 8,
    required this.createdAt,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) {
    return LevelModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      vocabularyCount: json['vocabulary_count'] ?? 10,
      unlockRequirement: json['unlock_requirement'] ?? 8,
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
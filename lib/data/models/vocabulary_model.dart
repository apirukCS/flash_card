class VocabularyModel {
  final int id;
  final int levelId;
  final String frontText;
  final String backText;
  final String? pronunciation;
  final String? exampleSentence;
  final int difficulty;
  final DateTime createdAt;

  const VocabularyModel({
    required this.id,
    required this.levelId,
    required this.frontText,
    required this.backText,
    this.pronunciation,
    this.exampleSentence,
    this.difficulty = 1,
    required this.createdAt,
  });

  factory VocabularyModel.fromJson(Map<String, dynamic> json) {
    return VocabularyModel(
      id: json['id'],
      levelId: json['level_id'],
      frontText: json['front_text'],
      backText: json['back_text'],
      pronunciation: json['pronunciation'],
      exampleSentence: json['example_sentence'],
      difficulty: json['difficulty'] ?? 1,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'level_id': levelId,
      'front_text': frontText,
      'back_text': backText,
      'pronunciation': pronunciation,
      'example_sentence': exampleSentence,
      'difficulty': difficulty,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
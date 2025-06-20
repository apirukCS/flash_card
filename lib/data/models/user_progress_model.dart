class UserProgressModel {
  final int id;
  final int vocabularyId;
  final String userId;
  final bool isMemorized;
  final int reviewCount;
  final DateTime? lastReviewed;
  final DateTime? nextReview;
  final int difficultyLevel;
  final int streakCount;

  const UserProgressModel({
    required this.id,
    required this.vocabularyId,
    required this.userId,
    this.isMemorized = false,
    this.reviewCount = 0,
    this.lastReviewed,
    this.nextReview,
    this.difficultyLevel = 1,
    this.streakCount = 0,
  });
}
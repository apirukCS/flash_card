enum LevelVocabEnum { beginner, basic, medium, expert }

extension ParseToString on LevelVocabEnum {
  int id() {
    String type = toString().split('.').last;
    switch (type) {
      case "beginner":
        return 1;
      case "basic":
        return 2;
      case "medium":
        return 3;
      case "expert":
        return 4;
      default:
        return LevelVocabEnum.beginner.id();
    }
  }
}

  LevelVocabEnum levelVocabIdToEnum(int id) {
    switch (id) {
      case 1:
        return LevelVocabEnum.beginner;
      case 2:
        return LevelVocabEnum.basic;
      case 3:
        return LevelVocabEnum.medium;
      case 4:
        return LevelVocabEnum.expert;
      default:
        return LevelVocabEnum.beginner;
    }
  }

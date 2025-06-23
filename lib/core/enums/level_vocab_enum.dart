enum LevelVocabEnum { beginner, basic, medium, expert }

extension ParseToString on LevelVocabEnum {
  int name() {
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
        return LevelVocabEnum.beginner.name();
    }
  }
}

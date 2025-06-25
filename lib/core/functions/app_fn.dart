class AppFn {
  getNameLevel(int levelId) {
    if (levelId == 1) {
      return "ระดับเริ่มต้น";
    } else if (levelId == 2) {
      return "ระดับพื้นฐาน";
    } else if (levelId == 3) {
      return "ระดับกลาง";
    } else if (levelId == 4) {
      return "ระดับสูง";
    }
  }
}

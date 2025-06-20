// To parse this JSON data, do
//
//     final quizQuestionModel = quizQuestionModelFromJson(jsonString);

import 'dart:convert';

QuizQuestionModel quizQuestionModelFromJson(String str) =>
    QuizQuestionModel.fromJson(json.decode(str));

String quizQuestionModelToJson(QuizQuestionModel data) =>
    json.encode(data.toJson());

class QuizQuestionModel {
  final String? vocabulary;
  final String? questionType;
  final int? levelId;
  final List<String>? distractors;

  QuizQuestionModel({
    this.vocabulary,
    this.questionType,
    this.distractors,
    this.levelId,
  });

  factory QuizQuestionModel.fromJson(Map<String, dynamic> json) =>
      QuizQuestionModel(
        vocabulary: json["vocabulary"],
        questionType: json["questionType"],
        levelId: json["levelId"],
        distractors:
            json["distractors"] == null
                ? []
                : List<String>.from(json["distractors"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "vocabulary": vocabulary,
    "questionType": questionType,
    "levelId": levelId,
    "distractors":
        distractors == null
            ? []
            : List<dynamic>.from(distractors!.map((x) => x)),
  };
}

// To parse this JSON data, do
//
//     final quizAnswerModel = quizAnswerModelFromJson(jsonString);

import 'dart:convert';

QuizAnswerModel quizAnswerModelFromJson(String str) => QuizAnswerModel.fromJson(json.decode(str));

String quizAnswerModelToJson(QuizAnswerModel data) => json.encode(data.toJson());

class QuizAnswerModel {
    final int? id;
    final int? vocabularyId;
    final int? choiceId;

    QuizAnswerModel({
        this.id,
        this.vocabularyId,
        this.choiceId,
    });

    factory QuizAnswerModel.fromJson(Map<String, dynamic> json) => QuizAnswerModel(
        id: json["id"],
        vocabularyId: json["vocabulary_id"],
        choiceId: json["choice_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vocabulary_id": vocabularyId,
        "choice_id": choiceId,
    };
}

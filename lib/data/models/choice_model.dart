// To parse this JSON data, do
//
//     final choiceModel = choiceModelFromJson(jsonString);

import 'dart:convert';

ChoiceModel choiceModelFromJson(String str) => ChoiceModel.fromJson(json.decode(str));

String choiceModelToJson(ChoiceModel data) => json.encode(data.toJson());

class ChoiceModel {
    final int? id;
    final String? text;
    final int? vocabularyId;

    ChoiceModel({
        this.id,
        this.text,
        this.vocabularyId,
    });

    factory ChoiceModel.fromJson(Map<String, dynamic> json) => ChoiceModel(
        id: json["id"],
        text: json["text"],
        vocabularyId: json["vocabulary_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "vocabulary_id": vocabularyId,
    };
}

part of '../movie_details_model.dart';

 class SpokenLanguageModel extends SpokenLanguageEntity {

  const SpokenLanguageModel({super.englishName, super.iso6391, super.name});

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) {
    return SpokenLanguageModel(
      englishName: json['english_name'] as String?,
      iso6391: json['iso_639_1'] as String?,
      name: json['name'] as String?,
    );
  }
}

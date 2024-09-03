part of '../movie_details_entity.dart';

class SpokenLanguageEntity extends Equatable {
  final String? englishName;
  final String? iso6391;
  final String? name;

  const SpokenLanguageEntity({this.englishName, this.iso6391, this.name});

  factory SpokenLanguageEntity.fromJson(Map<String, dynamic> json) {
    return SpokenLanguageEntity(
      englishName: json['english_name'],
      iso6391: json['iso_639_1'],
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [englishName, iso6391, name];
}

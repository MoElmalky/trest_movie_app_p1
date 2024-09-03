part of '../movie_details_model.dart';

class GenreModel extends GenreEntity{

  const GenreModel({super.id,super.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(id: json['id'] as int?, name: json['name'] as String?);
  }
}

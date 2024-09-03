part of '../movie_details_model.dart';

class BelongsToCollectionModel extends BelongsToCollectionEntity {

  const BelongsToCollectionModel(
      {super.id, super.name, super.posterPath, super.backdropPath});

  factory BelongsToCollectionModel.fromJson(Map<String, dynamic> json) {
    return BelongsToCollectionModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      posterPath: json['posterPath'] as String?,
      backdropPath: json['backdropPath'] as String?,
    );
  }
}

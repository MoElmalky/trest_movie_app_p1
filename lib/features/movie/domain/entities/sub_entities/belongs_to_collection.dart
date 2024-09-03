part of '../movie_details_entity.dart';

class BelongsToCollectionEntity extends Equatable {
  final int? id;
  final String? name;
  final String? posterPath;
  final String? backdropPath;

  const BelongsToCollectionEntity(
      {this.id, this.name, this.posterPath, this.backdropPath});

  factory BelongsToCollectionEntity.fromJson(Map<String, dynamic> json) {
    return BelongsToCollectionEntity(
      id: json['id'],
      name: json['name'],
      posterPath: json['posterPath'],
      backdropPath: json['backdropPath'],
    );
  }

  @override
  List<Object?> get props => [id, name, posterPath, backdropPath];
}

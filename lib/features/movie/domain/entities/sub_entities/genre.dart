part of '../movie_details_entity.dart';

class GenreEntity extends Equatable{
  final int? id;
  final String? name;

  const GenreEntity({this.id, this.name});

  factory GenreEntity.fromJson(Map<String, dynamic> json) {
    return GenreEntity(id: json['id'], name: json['name']);
  }
  
  @override
  List<Object?> get props => [
    id,
    name
  ];
}

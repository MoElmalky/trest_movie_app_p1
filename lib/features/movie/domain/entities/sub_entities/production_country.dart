part of '../movie_details_entity.dart';

class ProductionCountryEntity extends Equatable{
  final String? iso31661;
  final String? name;

  const ProductionCountryEntity({this.iso31661, this.name});

  factory ProductionCountryEntity.fromJson(Map<String, dynamic> json) {

    return ProductionCountryEntity(iso31661: json['iso_3166_1'], name: json['name']);
  }
  
  @override
  List<Object?> get props => [
    iso31661,
    name
  ];
}
part of '../movie_details_entity.dart';

class ProductionCompanyEntity extends Equatable {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  const ProductionCompanyEntity(
      {this.id, this.logoPath, this.name, this.originCountry});

  factory ProductionCompanyEntity.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyEntity(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }

  @override
  List<Object?> get props => [id, logoPath, name, originCountry];
}

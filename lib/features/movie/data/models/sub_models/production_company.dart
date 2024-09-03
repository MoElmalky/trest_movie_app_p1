part of '../movie_details_model.dart';

class ProductionCompanyModel extends ProductionCompanyEntity {

  const ProductionCompanyModel(
      {super.id, super.logoPath, super.name, super.originCountry});

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyModel(
      id: json['id'] as int?,
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String?,
      originCountry: json['origin_country'] as String?,
    );
  }
}

part of '../movie_details_model.dart';

class ProductionCountryModel extends ProductionCountryEntity{

  const ProductionCountryModel({super.iso31661, super.name});

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) {

    return ProductionCountryModel(iso31661: json['iso_3166_1'] as String?, name: json['name'] as String?);
  }
}
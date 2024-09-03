import '../../domain/entities/tmdb_user_entity.dart';

class TMDBUserModel extends TMDBUserEntity {
  const TMDBUserModel(
      {super.hash,
      super.avatarPath,
      super.id,
      super.language,
      super.country,
      super.name,
      super.includeAdult,
      super.userName});

  factory TMDBUserModel.fromJson(Map<String, dynamic> json) {
    return TMDBUserModel(
        hash: json['avatar']['gravatar']['hash'],
        avatarPath: json['avatar']['gravatar']['avatar_path'],
        id: json['id'],
        language: json['iso_639_1'],
        country: json['iso_3166_1'],
        name: json['name'],
        includeAdult: json['include_adult'],
        userName: json['username']);
  }
}

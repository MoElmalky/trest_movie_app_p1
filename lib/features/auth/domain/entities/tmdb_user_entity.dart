import 'package:equatable/equatable.dart';

class TMDBUserEntity extends Equatable {
  final String? hash;
  final String? avatarPath;
  final int? id;
  final String? language;
  final String? country;
  final String? name;
  final bool? includeAdult;
  final String? userName;

  const TMDBUserEntity(
      {this.hash,
      this.avatarPath,
      this.id,
      this.language,
      this.country,
      this.name,
      this.includeAdult,
      this.userName});

  @override
  List<Object?> get props =>
      [hash, avatarPath, id, language, country, name, includeAdult, userName];
}

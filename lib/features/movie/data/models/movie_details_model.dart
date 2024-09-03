import '../../domain/entities/movie_details_entity.dart';

part 'sub_models/belongs_to_collection.dart';
part 'sub_models/genre.dart';
part 'sub_models/production_company.dart';
part 'sub_models/production_country.dart';
part 'sub_models/spoken_language.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel(
      {super.adult,
      super.backdropPath,
      BelongsToCollectionModel? belongsToCollection,
      super.budget,
      List<GenreModel>? genres,
      super.homepage,
      super.id,
      super.imdbId,
      super.originCountry,
      super.originalLanguage,
      super.originalTitle,
      super.overview,
      super.popularity,
      super.posterPath,
      List<ProductionCompanyModel>? productionCompanies,
      List<ProductionCountryModel>? productionCountries,
      super.releaseDate,
      super.revenue,
      super.runtime,
      List<SpokenLanguageModel>? spokenLanguages,
      super.status,
      super.tagline,
      super.title,
      super.video,
      super.voteAverage,
      super.voteCount})
      : super(
          belongsToCollection: belongsToCollection,
          genres: genres,
          productionCompanies: productionCompanies,
          productionCountries: productionCountries,
          spokenLanguages: spokenLanguages,
        );

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
        adult: json['adult'] as bool?,
        backdropPath: json['backdrop_path'] as String?,
        belongsToCollection: json['belongs_to_collection'] != null
            ? BelongsToCollectionModel.fromJson(json['belongs_to_collection'])
            : null,
        budget: json['budget'] as int?,
        genres: json['genres'] != null
            ? List<GenreModel>.from(
                json['genres'].map((item) => GenreModel.fromJson(item)))
            : null,
        homepage: json['homepage'] as String?,
        id: json['id'] as int?,
        imdbId: json['imdb_id'] as String?,
        originCountry: json['origin_country'].cast<String>() as List<String>?,
        originalLanguage: json['original_language'] as String?,
        originalTitle: json['original_title'] as String?,
        overview: json['overview'] as String?,
        popularity: json['popularity'] as double?,
        posterPath: json['poster_path'] as String?,
        productionCompanies: json['production_companies'] != null
            ? List<ProductionCompanyModel>.from(json['production_companies']
                .map((item) => ProductionCompanyModel.fromJson(item)))
            : null,
        productionCountries: json['production_countries'] != null
            ? List<ProductionCountryModel>.from(json['production_countries']
                .map((item) => ProductionCountryModel.fromJson(item)))
            : null,
        releaseDate: json['release_date'] as String?,
        revenue: json['revenue'] as int?,
        runtime: json['runtime'] as int?,
        spokenLanguages: json['spoken_languages'] != null
            ? List<SpokenLanguageModel>.from(json['spoken_languages']
                .map((item) => SpokenLanguageModel.fromJson(item)))
            : null,
        status: json['status'] as String?,
        tagline: json['tagline'] as String?,
        title: json['title'] as String?,
        video: json['video'] as bool?,
        voteAverage: json['vote_average'] as double?,
        voteCount: json['vote_count'] as int?);
  }
}

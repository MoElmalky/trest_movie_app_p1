class MovieListParams{
  final String path;
  final String? language;
  final int? page;
  final String? sortBy;

  const MovieListParams({required this.path, this.language, this.page, this.sortBy});
}
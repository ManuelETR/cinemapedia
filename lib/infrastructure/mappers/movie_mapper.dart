//El mapper tiene como mision el leer un modelo y transformarlo en un modelo de dominio (Entidad)

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {

  static Movie movieDBToEntity(MovieMovieDB movie) => Movie(
    id: movie.id,
    title: movie.title,
    overview: movie.overview,
    releaseDate: movie.releaseDate,
    posterPath: (movie.posterPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}' 
      : 'no-poster',
    backdropPath: (movie.backdropPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}' 
      : 'http://www.publicdomainpictures.net/pictures/50000/velka/keep-calm-and-carry-on-13684625170vT.jpg',
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount,
    adult: movie.adult,
    originalLanguage: movie.originalLanguage,
    originalTitle: movie.originalTitle,
    popularity: movie.popularity,
    video: movie.video,
    genreIds: movie.genreIds.map((id) => id.toString()).toList(),
  );
}
// Implementacion de la interfaz de MoviesDatasource

import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';


class TheMovieDbDataSource extends MoviesDatasource {
  
  //peticion http a nivel de la clase
    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }
      ));


  //implementacion del metodo de la interfaz de MoviesDatasource
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    
    final response = await dio.get('/movie/now_playing');

    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
    .where((movie) => movie.posterPath != 'no-poster')
    .map(
      (movie) => MovieMapper.movieDBToEntity(movie)
    ).toList();

    return movies;
  }

}
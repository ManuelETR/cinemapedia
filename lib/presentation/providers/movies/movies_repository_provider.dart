

import 'package:cinemapedia/infrastructure/datasources/themoviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//Este repositorio es inmutable
final movieReopsitoryProvider = Provider((ref) {

  return MovieRepositoryImpl( TheMovieDbDataSource() );
});
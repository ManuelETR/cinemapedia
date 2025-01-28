//definimos como queremos que sean nuestros origenes de datos

import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {

 Future<List<Movie>> getNowPlaying({ int page = 1});

}
//repositorios que llama al datasource
//Un repositorio es un objeto que se encarga de obtener los datos 
//de una fuente de datos y entregarlos a la capa de dominio. 
//En este caso, el repositorio MoviesRepository se encarga de obtener 
//los datos de la fuente de datos MoviesDatasource y entregarlos a la capa de dominio. 
//Para ello, el repositorio MoviesRepository define un método getNowPlaying que llama al método 
//getNowPlaying del datasource MoviesDatasource. De esta forma, el repositorio MoviesRepository 
//actúa como intermediario entre la capa de dominio y la fuente de datos MoviesDatasource.


import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesRepository {

 Future<List<Movie>> getNowPlaying({ int page = 1});

 Future<List<Movie>> getPopular({ int page = 1});

 Future<List<Movie>> getUpcoming({ int page = 1});

  Future<List<Movie>> getTopRated({ int page = 1});

}
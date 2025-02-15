import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/movie.dart';


final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRespotiory = ref.watch(movieReopsitoryProvider);
    return MovieMapNotifier(getMovie: movieRespotiory.getMovieById);
});


typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>>{

  final GetMovieCallback getMovie;

    MovieMapNotifier({
      required this.getMovie
      }) : super({});

  Future<void> loadMovie(String movieId) async{
    if(state[movieId] != null) return;
    
    print('Realizando petición http');

    final movie = await getMovie(movieId); 

    state = {
      ...state,
      movieId: movie
    };
  }
}
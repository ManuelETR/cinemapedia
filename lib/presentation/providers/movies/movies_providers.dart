import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final movieRepository = ref.watch(movieReopsitoryProvider);
  return MoviesNotifier(
    fetchMoreMovies: ({int page = 1}) => movieRepository.getNowPlaying(page: page),
  );
});

final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final movieRepository = ref.watch(movieReopsitoryProvider);
  return MoviesNotifier(
    fetchMoreMovies: ({int page = 1}) => movieRepository.getPopular(page: page),
  );
});

final topRatedMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final movieRepository = ref.watch(movieReopsitoryProvider);
  return MoviesNotifier(
    fetchMoreMovies: ({int page = 1}) => movieRepository.getTopRated(page: page),
  );
});

final upcomingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final movieRepository = ref.watch(movieReopsitoryProvider);
  return MoviesNotifier(
    fetchMoreMovies: ({int page = 1}) => movieRepository.getUpcoming(page: page),
  );
});



typedef MovieCallback = Future<List<Movie>> Function({int page});


class MoviesNotifier extends StateNotifier<List<Movie>> {

  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fetchMoreMovies;

  
  MoviesNotifier({
    required this.fetchMoreMovies,
  }):super([]);


  Future<void> loadNextPage() async {
    if(isLoading) return;

    isLoading = true;
    currentPage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);

    state = [...state, ...movies];
    await Future.delayed(const Duration(microseconds: 300));
    isLoading = false;
  }

}
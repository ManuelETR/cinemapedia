import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();
    
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    

    //vista de la pantalla principal
    return CustomScrollView(
      slivers: [
        //AppBar sliver
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background:  Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomAppBar(), //Appbar personalizado,, 
              ),
          ),
        ),

        //Contenido de la pantalla

      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
        return Column(children: [
          //Slideshow de peliculas
          MoviesSlideshow(movies: slideShowMovies),

          //Lista de peliculas
          MovieHorizontalListview(
              movies: nowPlayingMovies,
              title: 'En cines',
              subTitle: 'Lunes 03 de febrero',
              loadNextPage: () =>
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage()),

          //Lista de peliculas
          MovieHorizontalListview(
              movies: upcomingMovies,
              title: 'Próximamente',
              subTitle: 'Este mes',
              loadNextPage: () =>
                  ref.read(upcomingMoviesProvider.notifier).loadNextPage()),

          //Lista de peliculas
          MovieHorizontalListview(
              movies: popularMovies,
              title: 'Populares',
              //subTitle: 'Lunes 03 de febrero',
              loadNextPage: () =>
                  ref.read(popularMoviesProvider.notifier).loadNextPage()),

          //Lista de peliculas
          MovieHorizontalListview(
              movies: topRatedMovies,
              title: 'Mejor calificadas',
              subTitle: 'Todos los tiempos',
              loadNextPage: () =>
                  ref.read(topRatedMoviesProvider.notifier).loadNextPage()),

          const SizedBox(height: 20.0)
        ]);
      }, childCount: 1)),
    ]);
  }
}

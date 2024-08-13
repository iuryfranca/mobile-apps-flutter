import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/Movie.dart';
import 'package:travel_app/MovieDetail.dart';
import 'package:dio/dio.dart';
import 'package:travel_app/main.dart';
import 'package:provider/provider.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  Future<List<Movie>> getMoviesWithDio() async {
    const String url =
        'https://api.themoviedb.org/3/movie/popular?api_key=2b714e82ab5108ff8b963154afd167ea&language=pt-BR';

    final dio = Dio();
    try {
      // Make the call
      var request = await dio.get(url);
      if (request.statusCode == HttpStatus.ok) {
        return createMovieList(request.toString());
      } else {
        if (kDebugMode) {
          print("Failed http call.");
        }
      }
    } catch (exception) {
      if (kDebugMode) {
        print(exception.toString());
      }
    }
    return [];
  }

  /// Method to parse information from the retrieved data
  List<Movie> createMovieList(String resultString) {
    List results = getResultsList(resultString);

    List<Movie> list = [];
    for (int i = 0; i < results.length; i++) {
      list.add(createMovieObject(results[i]));
    }
    return list;
  }

  /// Method to create a movie object.
  Movie createMovieObject(objectItem) {
    String title = objectItem["title"];
    String posterPath = objectItem["poster_path"];
    String backdropImage = objectItem["backdrop_path"];
    String originalTitle = objectItem["original_title"];
    double voteAverage = objectItem["vote_average"];
    String overview = objectItem["overview"];
    String releaseDate = objectItem["release_date"];

    return Movie(title, posterPath, backdropImage, originalTitle, voteAverage,
        overview, releaseDate);
  }

  List getResultsList(String resultString) {
    // Decode the json response
    var data = json.decode(resultString);
    // Get the result list
    return data["results"];
  }

  List<Widget> createMovieCardItem(List<Movie>? movies, BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    // Children list for the list.
    List<Widget> listElementWidgetList = [];
    if (movies != null) {
      var lengthOfList = movies.length;
      for (int i = 0; i < lengthOfList; i++) {
        Movie movie = movies[i];
        // Image URL
        var imageURL = "https://image.tmdb.org/t/p/w500${movie.posterPath}";

        var listItem = Hero(
          tag: Image.network(imageURL),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              image: DecorationImage(
                image: Image.network(imageURL).image,
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    movie.title,
                    style: textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
        );

        listElementWidgetList.add(listItem);
      }
    }
    return listElementWidgetList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getMoviesWithDio(),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          List<Movie>? movies = snapshot.data;
          if (snapshot.hasData == false) {
            // Shows progress indicator until the data is load.
            return const MaterialApp(
                home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ));
          }
          // Shows the real data with the data retrieved.
          return Scaffold(
            appBar: AppBar(
              title: const Text('Listagem de Filme'),
              scrolledUnderElevation: 4.0,
              shadowColor: Theme.of(context).shadowColor,
              leading: const Center(
                child: CircleAvatar(
                  radius: 16,
                  child: Icon(Icons.person),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(64.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.only(left: 16, bottom: 10, right: 16),
                  child: const TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Procurar filme...',
                      filled: true,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search_rounded),
                    ),
                  ),
                ),
              ),
              actions: [
                const ButtonChangeDarkMode(),
                PopupMenuButton<AppMenu>(
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<AppMenu>>[
                    const PopupMenuItem<AppMenu>(
                      value: AppMenu.about,
                      child: Text('About us'),
                    ),
                    const PopupMenuItem<AppMenu>(
                      value: AppMenu.privacy,
                      child: Text('Privacy Policy'),
                    ),
                    const PopupMenuItem<AppMenu>(
                      value: AppMenu.settings,
                      child: Text('Settings'),
                    ),
                  ],
                )
              ],
            ),
            body: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: movies?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 12 / 22,
              ),
              itemBuilder: (context, index) {
                final List listMovies = createMovieCardItem(movies, context);

                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MovieDetail(movies![index])));
                    },
                    child: listMovies[index],
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async => _shoppingCartDialog(context),
              child: const Icon(Icons.sort_rounded),
            ),
          );
        });
  }

  Future<void> _shoppingCartDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filtros'),
          icon: const Icon(Icons.sort_rounded),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Text('1 x Lorem Ipsum'),
                  Text('\$9.99'),
                  Text('1 x Lorem Ipsum'),
                  Text('\$9.99'),
                  Text('1 x Lorem Ipsum'),
                  Text('\$9.99'),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Limpar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Filtrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class ButtonChangeDarkMode extends StatefulWidget {
  const ButtonChangeDarkMode({super.key});

  @override
  _ButtonChangeDarkMode createState() => _ButtonChangeDarkMode();
}

class _ButtonChangeDarkMode extends State<ButtonChangeDarkMode> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    ButtonStyle enabledFilledButtonStyle(bool selected, ColorScheme colors) {
      return IconButton.styleFrom(
        foregroundColor: selected ? colors.onPrimary : colors.primary,
        // backgroundColor: selected ? colors.primary : colors.surfaceVariant,
        disabledForegroundColor: colors.onSurface.withOpacity(0.38),
        disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
        hoverColor: selected
            ? colors.onPrimary.withOpacity(0.08)
            : colors.primary.withOpacity(0.08),
        focusColor: selected
            ? colors.onPrimary.withOpacity(0.12)
            : colors.primary.withOpacity(0.12),
        highlightColor: selected
            ? colors.onPrimary.withOpacity(0.12)
            : colors.primary.withOpacity(0.12),
      );
    }

    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return IconButton(
      onPressed: () {
        setState(() {
          _isDarkMode = !_isDarkMode;

          _isDarkMode // call the functions
              ? themeProvider.setDarkmode()
              : themeProvider.setLightMode();
        });
      },
      style: enabledFilledButtonStyle(false, Theme.of(context).colorScheme),
      icon: Icon(_isDarkMode ? Icons.dark_mode : Icons.light_mode),
    );
  }
}

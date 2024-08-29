import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_flutter_app/Movie.dart';
import 'package:my_flutter_app/MovieDetail.dart';
import 'package:dio/dio.dart';
import 'package:my_flutter_app/main.dart';
import 'package:provider/provider.dart';

const List<String> list = <String>['Populares', 'Mais Recentes', 'Mais Vistos'];

var dropdownValue = list.first;

var inputSearch = '';

Timer? _debounce;

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);
  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  bool isloading = false;
  bool isError = false;

  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    isloading = true;
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        inputSearch = query!;
        isloading = true;
      });
      getMoviesWithDio();
    });
  }

  Future<List<Movie>> getMoviesWithDio() async {
    inputSearch = inputSearch.split(' ').join('+');

    var querySearch = inputSearch.isEmpty ? '' : 'query=$inputSearch';

    final String url = inputSearch.isEmpty
        ? 'https://api.themoviedb.org/3/movie/popular?api_key=2b714e82ab5108ff8b963154afd167ea&language=pt-BR'
        : 'https://api.themoviedb.org/3/search/movie?api_key=2b714e82ab5108ff8b963154afd167ea&language=pt-BR&$querySearch';

    final dio = Dio();
    try {
      var request = await dio.get(url);
      if (request.statusCode == HttpStatus.ok) {
        createMovieList(request.toString());
      } else {
        setState(() {
          isloading = false;
          isError = true;
        });
        print("Failed http call.");
      }
    } catch (exception) {
      setState(() {
        isloading = false;
        isError = true;
      });
      print(exception.toString());
    }
    return [];
  }

  /// Method to parse information from the retrieved data
  createMovieList(String resultString) {
    var data = json.decode(resultString);
    // Get the result list

    List results = data["results"];

    List<Movie> list = [];
    for (int i = 0; i < results.length; i++) {
      list.add(createMovieObject(results[i]));
    }

    movies = list;

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isloading = false;
      });
    });
  }

  /// Method to create a movie object.
  Movie createMovieObject(objectItem) {
    String title = objectItem["title"] ?? '';
    String posterPath = objectItem["poster_path"] ?? '';
    String backdropImage = objectItem["backdrop_path"] ?? '';
    String originalTitle = objectItem["original_title"] ?? '';
    double voteAverage = objectItem["vote_average"] ?? 0;
    String overview = objectItem["overview"] ?? '';
    String releaseDate = objectItem["release_date"] ?? '';

    return Movie(title, posterPath, backdropImage, originalTitle, voteAverage,
        overview, releaseDate);
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
          if (isError) {
            return const Center(child: Text('Erro ao carregar os filmes'));
          }

          // Shows the real data with the data retrieved.
          return Scaffold(
            appBar: AppBar(
              title: const Text('Listagem de Filmes'),
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
                  child: TextField(
                    decoration: const InputDecoration(
                      isDense: true,
                      hintText: 'Procurar filme...',
                      filled: true,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search_rounded),
                    ),
                    onChanged: _onSearchChanged,
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
                      child: Text('Sobre nós'),
                    ),
                    const PopupMenuItem<AppMenu>(
                      value: AppMenu.settings,
                      child: Text('Configurações'),
                    ),
                  ],
                )
              ],
            ),
            // ignore: prefer_is_empty
            body: isloading
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    itemCount: movies?.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 12 / 22,
                    ),
                    itemBuilder: (context, index) {
                      final List listMovies =
                          createMovieCardItem(movies, context);

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
              onPressed: () async => _filterDialog(context),
              child: const Icon(Icons.sort_rounded),
            ),
          );
        });
  }

  Future<void> _filterDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Filtros'),
                Icon(Icons.sort_rounded),
              ]),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: const DropdownButtonExample(),
                ),
                const Row(
                  children: [
                    CheckboxExample(),
                    Text("Apenas filmes com +7.0"),
                  ],
                ),
                const Row(
                  children: [
                    CheckboxExample(),
                    Text("Apenas filmes com +9.0"),
                  ],
                ),
              ],
            ),
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
          print('Dark mode: $_isDarkMode');

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

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward, size: 20),
      elevation: 26,
      underline: Container(
        height: 2,
        color: Colors.green[700],
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color? getColor() {
      if (isChecked) {
        return Colors.green[700];
      }
      return Colors.grey;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: WidgetStateProperty.all(getColor()),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

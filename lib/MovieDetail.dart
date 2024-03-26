// ignore: file_names
import 'package:flutter/material.dart';
import 'package:my_flutter_app/Movie.dart';

// ignore: must_be_immutable
class MovieDetail extends StatelessWidget {
  Movie movie;
  MovieDetail(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
          SliverAppBar.medium(
            title: Text(movie.title),
          ),
          SliverFillRemaining(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Image.network(
                    "https://image.tmdb.org/t/p/w500${movie.backdropPath}"),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  child: Row(
                    children: [
                      // First child in the Row for the name and the
                      // Release date information.
                      Expanded(
                        // Name and Release date are in the same column
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Code to create the view for name.
                            Container(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "Nome Original: ${movie.originalTitle}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // Code to create the view for release date.
                            Text(
                              "Dara de Lançamento: ${movie.releaseDate}",
                              style: TextStyle(
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Icon to indicate the rating.
                      Icon(
                        Icons.star,
                        color: Colors.red[500],
                      ),
                      Text('${movie.voteAverage}'),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(32.0),
                    child: Text(
                      movie.overview,
                    )),
              ]))
        ]),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton.extended(
              heroTag: 'avaliacao',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Padding(
                        padding: EdgeInsets.only(
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom + 20),
                        child: SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                ListTile(
                                  title: const Text('Recomendaria o filme?'),
                                  trailing: Switch(
                                    onChanged: (value) {},
                                    value: true,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(16.0),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Deixe seu comentário',
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('Enviar avaliação'),
                                )
                              ],
                            ),
                          ),
                        ));
                  },
                );
              },
              label: const Text('Avaliar filme'),
              icon: const Icon(Icons.rate_review_outlined),
            ),
            SizedBox(width: 20),
            const FloatingActionButtonFavorite(),
          ],
        ));
  }
}

class FloatingActionButtonFavorite extends StatefulWidget {
  const FloatingActionButtonFavorite({super.key});

  @override
  _FloatingActionButtonFavorite createState() =>
      _FloatingActionButtonFavorite();
}

class _FloatingActionButtonFavorite
    extends State<FloatingActionButtonFavorite> {
  bool _isFavorite = false;

  void _favoriteItem() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'favoritar',
      onPressed: () {
        _favoriteItem();
      },
      child: _isFavorite
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_border),
    );
  }
}

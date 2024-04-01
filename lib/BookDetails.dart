// ignore: file_names
import 'package:flutter/material.dart';
import 'package:my_flutter_app/main.dart';

// ignore: must_be_immutable
class BookDetails extends StatelessWidget {
  Book book;
  BookDetails(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(book.title)),
        body: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Image.network(book.cover),
              Container(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Text(book.author),
                    Text(book.description),
                  ],
                ),
              )
            ])));
  }
}

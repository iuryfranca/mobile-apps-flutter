import 'package:flutter/material.dart';
import 'package:my_flutter_app/BookDetails.dart';

enum AppMenu {
  about,
  privacy,
  settings,
}

void main() => runApp(const MovieApp());

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: BookList(),
    );
  }
}

class BookList extends StatelessWidget {
  List<Widget> createBook(List<Book>? books, BuildContext context) {
    List<Widget> listElementWidgetList = [];
    if (books != null) {
      var lengthOfList = books.length;
      for (int i = 0; i < lengthOfList; i++) {
        Book bookItem = books[i];
        // Image URL
        var imageURL = bookItem.cover;

        var listItem = GridTile(
            footer: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              BookDetails(bookItem)));
                },
                child: GridTileBar(
                  backgroundColor: Colors.black45,
                  title: Text(bookItem.title),
                )),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            BookDetails(bookItem)));
              },
              child: Image.network(imageURL, fit: BoxFit.cover),
            ));

        listElementWidgetList.add(listItem);
      }
    }
    return listElementWidgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Livros')),
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          itemCount: books?.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 12 / 22,
          ),
          itemBuilder: (context, index) {
            final List listBooks = createBook(books, context);

            return Card(
              child: InkWell(
                child: listBooks[index],
              ),
            );
          },
        ));
  }
}

class Book {
  String title;
  String author;
  String cover;
  String description;

  Book(this.title, this.author, this.cover, this.description);
}

//Create list mock books
List<Book> books = [
  Book(
      "O Senhor dos Anéis",
      "J. R. R. Tolkien",
      "https://m.media-amazon.com/images/I/41RBd2DvmgL._SY445_SX342_.jpg",
      "O Senhor dos Anéis é um livro de alta fantasia escrito pelo autor sul-africano J. R. R. Tolkien. A história começa como sequência de um livro anterior de Tolkien, O Hobbit, e logo se desenvolve em uma história muito maior. Foi escrito em fases entre 1937 e 1949, com muito do trabalho feito durante a Segunda Guerra Mundial. Embora Tolkien tenha planejado realizar O Senhor dos Anéis em volume único, foi originalmente publicado em três volumes entre 1954 e 1955, e foi assim, em três volumes, que se tornou popular. Desde então foi reimpresso várias vezes e traduzido para muitas línguas, tornando-se um dos trabalhos mais populares e influentes na literatura do século XX."),
  Book(
      "Harry Potter e a Pedra Filosofal",
      "J. K. Rowling",
      "https://m.media-amazon.com/images/I/518mqZ7A31L._SY445_SX342_.jpg",
      "Harry Potter e a Pedra Filosofal é o primeiro livro dos sete volumes da série de fantasia Harry Potter, tanto em termos cronológicos como em ordem de publicação, da autora inglesa J. K. Rowling. Foi primeiramente publicado no Reino Unido pela editora londrina Bloomsbury em 26 de junho de 1997 e nos Estados Unidos, em 1 de setembro do mesmo ano pela editora Scholastic Corporation. A história segue as aventuras de um jovem bruxo, Harry Potter, que descobre aos onze anos de idade que é um bruxo ao ser convidado para estudar na Escola de Magia e Bruxaria de Hogwarts."),
  Book(
      "O Pequeno Príncipe",
      "Antoine de Saint-Exupéry",
      "https://m.media-amazon.com/images/I/710Nd+Itq+L._SY466_.jpg",
      "O Pequeno Príncipe é uma obra do escritor e aviador francês Antoine de Saint-Exupéry que conta a história de um pequeno príncipe que sai de seu pequeno planeta para viajar por outros mundos e aprender sobre a solidão, o amor, a amizade e outras questões da vida. A obra foi publicada em 1943 nos Estados Unidos, onde Saint-Exupéry se exilou durante a Segunda Guerra Mundial e é o livro em língua francesa mais lido e mais traduzido no mundo."),
  Book(
      "Dom Quixote",
      "Miguel de Cervantes",
      "https://m.media-amazon.com/images/I/410TKbO3pSL._SY445_SX342_.jpg",
      "Dom Quixote de la Mancha é um livro escrito pelo espanhol Miguel de Cervantes. Publicado em duas partes, em 1605 e 1615, é uma das obras mais destacadas da literatura espanhola e da literatura universal, sendo o livro mais lido depois da Bíblia. A obra é considerada a primeira novela moderna e uma das melhores já escritas. É um dos primeiros romances psicológicos, e nele encontramos muitas das características dos romances modernos."),
  Book(
      "Cem Anos de Solidão",
      "Gabriel García Márquez",
      "https://m.media-amazon.com/images/I/817esPahlrL._AC_UY218_.jpg",
      "Cem Anos de Solidão é um romance do escritor colombiano Gabriel García Márquez, Prêmio Nobel de Literatura de 1982. A obra foi publicada em 1967 e é considerada uma das obras mais importantes da literatura latino-americana e mundial. O romance conta a história da família Buendía ao longo de sete gerações na fictícia cidade de Macondo. A obra é considerada um clássico da literatura do século XX e um dos livros mais importantes já escritos."),
  Book(
      "1984",
      "George Orwell",
      "https://m.media-amazon.com/images/I/51-DZ1v5gSL._SY445_SX342_.jpg",
      "1984 é um romance distópico do escritor britânico George Orwell, a publicado em 1949. A história se passa em um futuro distópico onde um regime totalitário, liderado pelo Grande Irmão, controla a vida dos cidadãos de Oceania. O romance é uma crítica ao totalitarismo e ao autoritarismo, e é considerado um dos melhores romances do século XX. A obra é um clássico da literatura mundial e é um dos livros mais vendidos de todos os tempos."),
  Book(
      "A Revolução dos Bichos",
      "George Orwell",
      "https://m.media-amazon.com/images/I/61owA5ey3iL._SY445_SX342_.jpg",
      "A Revolução dos Bichos é um livro do escritor britânico George Orwell, publicado em 1945. A obra é uma sátira política que critica o totalitarismo e o autoritarismo, e é considerada uma das melhores obras de Orwell. O livro conta a história dos animais da Fazenda do Solar, que se rebelam contra o dono da fazenda e tomam o controle da propriedade. No entanto, a revolução dos animais acaba se transformando em uma ditadura liderada pelos porcos, que se tornam tão autoritários quanto os humanos."),
  Book(
      "A Metamorfose",
      "Franz Kafka",
      "https://m.media-amazon.com/images/I/51H+90dUjzL._SY445_SX342_.jpg",
      "A Metamorfose é um livro do escritor tcheco Franz Kafka, publicado em 1915. A obra conta a história de Gregor Samsa, um caixeiro-viajante que um dia acorda transformado em um inseto gigante. O livro é uma das obras mais importantes da literatura mundial e é considerado um dos melhores romances já escritos. A Metamorfose é uma obra de ficção que aborda temas como a alienação, a solidão e a incomunicabilidade."),
];

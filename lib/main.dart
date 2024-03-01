import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'The Last Of Us Part II - Remastered';
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      title: appTitle,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(appTitle),
          ),
          body: const SingleChildScrollView(
            child: Column(children: [
              ImageSection(
                  image: 'assets/The-Last-of-Us-Parte-II-Remasterizado-2.jpg'),
              TitleSection(name: 'Video Game', location: 'Naughty Dog'),
              ButtonSection(),
              TextSection(
                  description:
                      'The Last of Us Part II é um jogo eletrônico de ação-aventura e sobrevivência desenvolvido pela Naughty Dog e publicado pela Sony Interactive Entertainment. É a sequência de The Last of Us, lançado em 2013 para PlayStation 3. O jogo foi lançado para PlayStation 4 em 19 de junho de 2020. A história se passa cinco anos após os eventos do primeiro jogo e segue Ellie e Abby, cujos destinos se entrelaçam em um ciclo de vingança e perdão. O jogador controla Ellie, uma jovem que embarca em uma jornada por Seattle, Washington, em busca de vingança contra um grupo misterioso. O jogo é jogado a partir de uma perspectiva de terceira pessoa e os jogadores podem usar armas de fogo, armas improvisadas e furtividade para se defender contra humanos e criaturas hostis. O jogo também possui elementos de sobrevivência, como coleta de recursos, artesanato e resolução de quebra-cabeças.'),
            ]),
          )),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.orange[500],
          ),
          const Text('95'),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.black87;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'Ligar',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'Endereço',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'Compartilhar',
          ),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, fit: BoxFit.contain);
  }
}

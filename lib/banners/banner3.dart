import 'package:flutter/material.dart';
import 'package:travel_app/home.dart';

final emailInputController = TextEditingController();
final passwordInputController = TextEditingController();

class Banner3 extends StatelessWidget {
  const Banner3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.zero,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 480,
                      child: Stack(alignment: Alignment.topCenter, children: [
                        Positioned(
                          top: -10.0,
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            'assets/images/banner3.png',
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        )
                      ])),
                  const Padding(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: Column(children: [
                        TitleSection(
                            title:
                                'As pessoas não fazem viagens, as viagens levam ',
                            titleHighlighted: 'pessoas',
                            description:
                                'Para aproveitar ao máximo sua aventura você só precisa sair e ir para onde quiser. estamos esperando por você'),
                      ])),
                  Image.asset('assets/images/step3.png'),
                  const Padding(
                      padding: EdgeInsets.all(16), child: ButtonLogin()),
                ]),
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.title,
    required this.titleHighlighted,
    required this.description,
  });

  final String title;
  final String titleHighlighted;
  final String description;

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /*2*/
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SizedBox(
                height: 120,
                child: Stack(alignment: Alignment.topCenter, children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: title,
                        style: TextStyle(
                            color: colors.onSurfaceVariant,
                            fontSize: 32,
                            fontFamily: 'AbhayaLibre',
                            fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                            text: titleHighlighted,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 145, 0),
                                fontSize: 32,
                                fontFamily: 'AbhayaLibre',
                                fontWeight: FontWeight.w400),
                          ),
                        ]),
                  ),
                  Positioned(
                    top: 108,
                    right: 60,
                    child:
                        Image.asset('assets/images/underline.png', scale: 0.75),
                  )
                ])),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colors.onSurfaceVariant,
              fontSize: 18,
              fontFamily: 'GillSansMT',
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return SizedBox(
        width: double.infinity,
        height: 60,
        child: TextButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const Home()));
          },
          style: TextButton.styleFrom(
            foregroundColor: colors.onPrimary,
            backgroundColor: colors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text('Próximo'),
        ));
  }
}

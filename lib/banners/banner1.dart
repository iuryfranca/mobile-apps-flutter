import 'dart:io';

import 'package:flutter/material.dart';
import 'package:travel_app/banners/banner2.dart';

final emailInputController = TextEditingController();
final passwordInputController = TextEditingController();

class Banner1 extends StatelessWidget {
  const Banner1({super.key});

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
                  Container(
                      height: 480,
                      child: Stack(alignment: Alignment.topCenter, children: [
                        Positioned(
                          top: -10.0,
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            'assets/images/banner1.png',
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        )
                      ])),
                  const Padding(
                      padding: EdgeInsets.only(left: 64, right: 64),
                      child: Column(children: [
                        TitleSection(
                            title: 'A vida é curta e o mundo é ',
                            titleHighlighted: 'vasto',
                            description:
                                'Na Friends tours and travel, personalizamos passeios educacionais confiáveis e confiáveis para destinos em todo o mundo'),
                      ])),
                  Image.asset('assets/images/step1.png'),
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
            child: Container(
                height: 100,
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
                    top: 70,
                    right: 40,
                    child: Image.asset('assets/images/underline.png'),
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
            Navigator.of(context)
                .push(_createRouteAnimationSliderLeft(const Banner2()));
          },
          style: TextButton.styleFrom(
            foregroundColor: colors.onPrimary,
            backgroundColor: colors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text('Iniciar'),
        ));
  }
}

Route _createRouteAnimationSliderLeft(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

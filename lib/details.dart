// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(alignment: Alignment.center, children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/espanha.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                  top: 10.0, left: 0, right: 0, child: HeaderSection()),
              Positioned(
                bottom: -60,
                right: 0,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: Color.fromARGB(255, 241, 246, 248),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6,
                          blurStyle: BlurStyle.normal,
                          color: Color.fromARGB(28, 0, 0, 0),
                          offset: Offset.zero,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 24, right: 32),
                      alignment: Alignment.centerLeft,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/header-espanha.png'),
                            const SizedBox(height: 16),
                            Image.asset('assets/images/paises.png'),
                            const SizedBox(height: 16),
                            const Text('About Destination',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'GillSansMT',
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(height: 8),
                            const Text(
                                'Madri, a capital da Espanha, situada no centro do país, é uma cidade de avenidas elegantes e parques grandes e bem cuidados, como o Buen Retiro.'),
                            const SizedBox(height: 16),
                          ]),
                    )),
              ),
              Positioned(
                  bottom: 10,
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: colors.onPrimary,
                            backgroundColor: colors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text('Agende agora'),
                        )),
                  ))
            ])));
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Padding(
        padding: const EdgeInsets.only(top: 48, bottom: 0, left: 32, right: 32),
        child: Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(129, 236, 236, 236),
                    ),
                    child: SvgPicture.asset('assets/svgs/Arrow.svg'),
                  ),
                  const Text('Detalhes',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(129, 236, 236, 236),
                    ),
                    child: SvgPicture.asset('assets/svgs/notifications.svg'),
                  )
                ])));
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.title,
    required this.description,
    required this.titleHighlighted,
  });

  final String title;
  final String description;
  final String titleHighlighted;

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Padding(
        padding:
            const EdgeInsets.only(top: 32, bottom: 32, left: 32, right: 32),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: title,
                        style: TextStyle(
                            color: colors.onSurfaceVariant,
                            fontSize: 50,
                            fontFamily: 'AbhayaLibre',
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Stack(alignment: Alignment.centerLeft, children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: description,
                            style: TextStyle(
                                color: colors.onSurfaceVariant,
                                fontSize: 34,
                                fontFamily: 'AbhayaLibre',
                                fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                text: titleHighlighted,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 145, 0),
                                    fontSize: 34,
                                    fontFamily: 'AbhayaLibre',
                                    fontWeight: FontWeight.w500),
                              ),
                            ]),
                      ),
                      Positioned(
                          top: 30,
                          right: 10,
                          child: Image.asset('assets/images/underline.png')),
                    ]),
                  ])),
        ));
  }
}

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/main.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
        // appBar: AppBar(
        //   actions: const [
        //     ButtonChangeDarkMode(),
        //   ],
        // ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const HeaderSection(),
                          const TitleSection(
                              title: 'Explore o',
                              description: 'o Belo mundo ',
                              titleHighlighted: ' world!'),
                          Container(
                              padding: const EdgeInsets.only(
                                  top: 16, bottom: 16, left: 32, right: 32),
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Melhor Destinos',
                                      style: TextStyle(
                                        color: colors.onSurfaceVariant,
                                        fontSize: 18,
                                        fontFamily: 'GillSansMT',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text('Ver Tudo',
                                        style: TextStyle(
                                          color: colors.primary,
                                          fontSize: 18,
                                          fontFamily: 'GillSansMT',
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ])),
                          Container(
                              padding: const EdgeInsets.only(
                                  top: 0, bottom: 16, left: 32, right: 32),
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 241, 246, 248),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
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
                                      child: Image.asset(
                                          'assets/images/card-viagem1.png'),
                                    ),
                                    const SizedBox(width: 16),
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 241, 246, 248),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
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
                                      child: Image.asset(
                                          'assets/images/card-viagem2.png'),
                                    ),
                                  ],
                                ),
                              )),
                        ]),
                  ),
                  Container(
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
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/svgs/Caht.svg'),
                                  Text('Mensagens')
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/svgs/Home.svg'),
                                  Text('Home')
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/svgs/Person.svg'),
                                  Text('Perfil')
                                ],
                              ),
                            ]),
                      )),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(207, 236, 236, 236),
                    ),
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Image.asset('assets/perfil.png'),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Leonardo',
                          style: TextStyle(
                              color: Color.fromARGB(255, 57, 57, 57),
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(207, 236, 236, 236),
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

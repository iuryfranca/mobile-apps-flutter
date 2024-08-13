import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/banners/banner1.dart';
import 'package:travel_app/main.dart';

final _passwordFieldKeyEmail = GlobalKey<FormFieldState<String>>();
final _passwordFieldKeyPassword = GlobalKey<FormFieldState<String>>();

final emailInputController = TextEditingController();
final passwordInputController = TextEditingController();

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          actions: const [
            ButtonChangeDarkMode(),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const TitleSection(
                title: 'Faça seu login ',
                description: 'Faça login para continuar nosso aplicativo'),
            LoginFormField(
              fieldKeyEmail: _passwordFieldKeyEmail,
              fieldKeyPassword: _passwordFieldKeyPassword,
              onFieldSubmittedEmail: (value) {
                emailInputController.text = value;
              },
              onFieldSubmittedPassword: (value) {
                passwordInputController.text = value;
              },
            ),
            const ButtonLogin(),
            Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 16, right: 32),
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Não tem uma conta?  ',
                        style: TextStyle(
                          color: colors.onSurface,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Inscreva-se',
                        style: TextStyle(
                          color: colors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(32),
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Ou conecte',
                          style: TextStyle(
                            color: colors.onSurface,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: 130,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Image.asset(
                                      'assets/logo/logo-facebook.png')),
                              Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Image.asset(
                                      'assets/logo/logo-instagram.png')),
                              Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Image.asset(
                                      'assets/logo/logo-twitter.png')),
                            ],
                          ))
                    ],
                  ),
                ))
          ]),
        ));
  }
}

class LoginFormField extends StatefulWidget {
  const LoginFormField({
    super.key,
    required this.fieldKeyEmail,
    required this.fieldKeyPassword,
    required this.onFieldSubmittedEmail,
    required this.onFieldSubmittedPassword,
  });

  final Key fieldKeyEmail;
  final Key fieldKeyPassword;

  final ValueChanged<String> onFieldSubmittedEmail;
  final ValueChanged<String> onFieldSubmittedPassword;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<LoginFormField> {
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        Padding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 8, left: 32, right: 32),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(88, 206, 206, 206),
              ),
              child: TextFormField(
                key: widget.fieldKeyEmail,
                onChanged: widget.onFieldSubmittedEmail,
                decoration: const InputDecoration(
                    isDense: false,
                    hintText: 'Email...',
                    suffixIcon: Icon(Icons.email),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20)),
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
        Padding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 32, left: 32, right: 32),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(88, 206, 206, 206),
              ),
              child: TextFormField(
                key: widget.fieldKeyPassword,
                onChanged: widget.onFieldSubmittedPassword,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscured,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  isDense: false,
                  hintText: '*********',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(20),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: GestureDetector(
                      onTap: _toggleObscured,
                      child: Icon(
                        _obscured
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
        Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 16, right: 32),
            child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  'Esqueceu a senha?',
                  style: TextStyle(
                    color: colors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ))),
      ],
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
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
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 32),
            ),
          ),
          Text(
            description,
            style: TextStyle(
              color: colors.onSurface,
              fontSize: 16,
              fontWeight: FontWeight.w300,
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
    return Padding(
        padding:
            const EdgeInsets.only(bottom: 64, top: 64, left: 32, right: 32),
        child: SizedBox(
            width: double.infinity,
            height: 60,
            child: TextButton(
              onPressed: () {
                // Abrir Dialog
                if (emailInputController.text.isEmpty ||
                    passwordInputController.text.isEmpty) {
                  showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Atenção'),
                          content:
                              const Text("E-mail e senha não podem ser vazios"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Beleza'),
                            ),
                          ],
                        );
                      });
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const Banner1()));
                }
              },
              style: TextButton.styleFrom(
                foregroundColor: colors.onPrimary,
                backgroundColor: colors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text('Entrar'),
            )));
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

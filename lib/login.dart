import 'package:flutter/material.dart';
import 'package:my_flutter_app/MovieList.dart';

final _passwordFieldKeyEmail = GlobalKey<FormFieldState<String>>();
final _passwordFieldKeyPassword = GlobalKey<FormFieldState<String>>();

final emailInputController = TextEditingController();
final passwordInputController = TextEditingController();

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    return Column(
      children: [
        Padding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 8, left: 32, right: 32),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 233, 233, 233),
              ),
              child: TextFormField(
                key: widget.fieldKeyEmail,
                onChanged: widget.onFieldSubmittedEmail,
                decoration: const InputDecoration(
                  isDense: false,
                  hintText: 'Email...',
                  suffixIcon: Icon(Icons.email),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
            )),
        Padding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 32, left: 32, right: 32),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 233, 233, 233),
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
              ),
            )),
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
    return Padding(
      padding: const EdgeInsets.only(top: 120, bottom: 16),
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
              color: Colors.grey[800],
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
    final Color? color = Colors.blue[900];
    return Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 32, right: 32),
        child: SizedBox(
            width: double.infinity,
            height: 60,
            child: TextButton(
              onPressed: () {
                // Abrir Dialog

                showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Dados Inseridos'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Email ${emailInputController.text}"),
                            Text("Senha: ${passwordInputController.text}"),
                          ],
                        ),
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
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Entrar'),
            )));
  }
}

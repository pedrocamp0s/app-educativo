import 'package:flutter/material.dart';

import '../screens/options_screen.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String _validateUsername(value) {
    String validationResult;

    if (value == null || value.isEmpty) {
      validationResult = 'Digite um nome de usuário para continuar';
    }

    return validationResult;
  }

  String _validatePassword(value) {
    String validationResult;

    if (value == null || value.isEmpty) {
      validationResult = 'Digite uma senha para continuar';
    }

    return validationResult;
  }

  @override
  Widget build(BuildContext context) {
    void _makeLogin() {
      if (_formKey.currentState.validate()) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OptionsScreen(),
          ),
        );
      }
    }

    return Form(
      key: this._formKey,
      child: Column(
        children: [
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Nome de usuário',
                errorMaxLines: 2,
              ),
              validator: this._validateUsername,
            ),
            margin: EdgeInsets.only(top: 0, left: 100, right: 100, bottom: 20),
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Senha',
                errorMaxLines: 2,
              ),
              validator: this._validatePassword,
              obscureText: true,
            ),
            margin: EdgeInsets.only(top: 0, left: 100, right: 100, bottom: 20),
          ),
          ElevatedButton(
            onPressed: _makeLogin,
            child: Text('Entrar'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}

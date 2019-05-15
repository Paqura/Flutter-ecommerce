import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  bool _hasObscureText = true;
  String _email, _password;

  Widget _showFormTitle() => Text('Login', style: Theme.of(context).textTheme.headline);

  Widget _showEmailInput() => Padding(
    padding: EdgeInsets.only(top: 20.0),
    child: TextFormField(
      onSaved: (value) => _email = value,
      validator: (value) => !value.contains('@') ? 'Invalid email' : null,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
        hintText: 'Enter email',
        icon: Icon(Icons.email),
      ),
    ),
  );

  Widget _showPasswordInput() => Padding(
    padding: EdgeInsets.only(top: 20.0),
    child: TextFormField(
      onSaved: (value) => _password = value,
      validator: (value) => value.length < 6 ? 'Too short' : null,
      obscureText: _hasObscureText,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          child: Icon(_hasObscureText ? Icons.visibility : Icons.visibility_off),
          onTap: () => setState(() => _hasObscureText = !_hasObscureText),
        ),
        border: OutlineInputBorder(),
        labelText: 'Password',
        hintText: 'Enter password',
        icon: Icon(Icons.lock),
      ),
    ),
  );

  Widget _showFormActions() =>  Padding(
    padding: EdgeInsets.only(top: 36.0),
    child: Column(children: [
      RaisedButton(
        child: Text(
          'Submit',
          style: Theme.of(context).textTheme.body1.copyWith(color: Colors.black, fontSize: 18.0),
        ),
        elevation: 8.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
        color: Theme.of(context).accentColor,
        onPressed: () => _submit(),
      ),
      FlatButton(
        child: Text('New user? Register'),
        onPressed: () => Navigator.pushReplacementNamed(context, '/register'),
      ),
    ])
  );

  void _saveFormState() {
    _formKey.currentState.save();
    print('Email: $_email, Password: $_password');
  }

  void _submit() {
    _formKey.currentState.validate() ? _saveFormState() : print('invalid data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _showFormTitle(),
                  _showEmailInput(),
                  _showPasswordInput(),
                  _showFormActions(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
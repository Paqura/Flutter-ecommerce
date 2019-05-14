import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _username, _email, _password;

  Widget _showFormTitle() => Text('Register', style: Theme.of(context).textTheme.headline);

  Widget _showUsernameInput() => Padding(
    padding: EdgeInsets.only(top: 20.0),
    child: TextFormField(
      onSaved: (value) => _username = value,
      validator: (value) => value.length < 6 ? 'Too short' : null,
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'UserName',
        hintText: 'Enter username, min lenght 6',
        icon: Icon(Icons.face),
      ),
    ),
  );

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
      obscureText: true,
      decoration: InputDecoration(
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
        color: Theme.of(context).primaryColor,
        onPressed: () => _submit(),
      ),
      FlatButton(
        child: Text('Existing user? Login'),
        onPressed: () => print('login'),
      ),
    ])
  );

  void _saveFormState() {
    _formKey.currentState.save();
    print('Username: $_username, Email: $_email, Password: $_password');
  }

  void _submit() {
    _formKey.currentState.validate() ? _saveFormState() : print('invalid form');
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
                  _showUsernameInput(),
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
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
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
              child: Column(
                children: [
                  Text('Register', style: Theme.of(context).textTheme.body1),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'UserName',
                        hintText: 'Enter username, min lenght 6',
                        icon: Icon(Icons.face),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter email',
                        icon: Icon(Icons.email),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter password',
                        icon: Icon(Icons.lock),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 36.0),
                    child: Column(children: [
                      RaisedButton(
                        child: Text(
                          'Submit',
                          style: Theme.of(context).textTheme.body1.copyWith(color: Colors.black)
                        ),
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
                        color: Theme.of(context).primaryColor,
                        onPressed: () => print('submitted'),
                      ),
                      FlatButton(
                        child: Text('Existing user? Login'),
                        onPressed: () => print('login'),
                      ),
                    ])
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
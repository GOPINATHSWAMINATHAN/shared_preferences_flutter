import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        title: 'Flutter Login Demo',
        theme: new ThemeData(
            primarySwatch: Colors.blue
        ),
        home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginPageState();
}
enum FormType {
  login,
  register
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";
  FormType _form = FormType.login;

  loginPageState()
  {
    _emailFilter.addListener(emailListen);
    _passwordFilter.addListener(passwordListen);
  }

  void emailListen()
  {
    if(_emailFilter.text.isEmpty)
      {
        _email="Enter your E-mail here!";
      }
    else
      {
        _email=_emailFilter.text;
      }

  }

  void passwordListen()
  {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  void formChange() async{
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            buildTextFields(),
            buildButtons(),
          ],
        ),
      ),
    );
  }
  Widget buildBar(BuildContext context)
  {
    return new AppBar(
      title: new Text("Login Example"),
      centerTitle:true,
    );
  }
  Widget buildTextFields()
  {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _emailFilter,
              decoration: new InputDecoration(
                  labelText: 'Email'
              ),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _passwordFilter,
              decoration: new InputDecoration(
                  labelText: 'Password'
              ),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }
  Widget buildButtons() {
    if (_form == FormType.login) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Login'),
              onPressed: _loginPressed

            ),
            new FlatButton(
              child: new Text('Dont have an account? Tap here to register.'),
              onPressed: formChange,
            ),
            new FlatButton(
              child: new Text('Forgot Password?'),
              onPressed: _passwordReset,
            )
          ],
        ),
      );
    } else {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Create an Account'),
              onPressed: _createAccountPressed,
            ),
            new FlatButton(
              child: new Text('Have an account? Click here to login.'),
              onPressed: formChange,
            )
          ],
        ),
      );
    }
  }
  void _loginPressed () {
    print('The user wants to login with +"_emailFilter.text"+"and"+ "_passwordFilter.text"');
  }

  void _createAccountPressed () {
    print('The user wants to create an accoutn with $_email and $_password');

  }

  void _passwordReset () {
    print("The user wants a password reset request sent to $_email");
  }
}

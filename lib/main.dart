import 'package:flutter/material.dart';
import 'package:components_learning/google_signin.dart';
void main() => runApp(Login());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final appTitle = "Form Validation Demo";

    return MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
          ),
          body: MyCustomForm(),
        ));
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    // TODO: implement createState
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  var stringValue;

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: myController,
              validator: (value) {
                if (value.isEmpty) {
                  debugPrint("Checking the values here.");
                  return 'Enter Some Text';
                }
                return null;
              },
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                    onPressed: () {
                      if (true) {
                        String value = myController.text;
                        debugPrint(value);
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text(value.toString())));
                      }
                    },
                    child: Text('Submit')))
          ],
        ));
  }
}

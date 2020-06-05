import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;


class OwnerLogin extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return TextFieldDemo();
  }
}

class TextFieldDemo extends StatelessWidget {
  const TextFieldDemo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Lab owner login'),
        backgroundColor: Colors.blue[500],
      ),
      body: const TextFormFieldDemo(),
    );
  }
}

class TextFormFieldDemo extends StatefulWidget {
  const TextFormFieldDemo({Key key}) : super(key: key);

  @override
  TextFormFieldDemoState createState() => TextFormFieldDemoState();
}

class PersonData {
  String username = '';
  String password = '';
}

class TextFormFieldDemoState extends State<TextFormFieldDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PersonData person = PersonData();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  bool _autoValidate = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
  GlobalKey<FormFieldState<String>>();

  void _handleSubmitted() {
    final form = _formKey.currentState;
    if (!form.validate()) {
      _autoValidate = true; // Start validating on every change.
      showInSnackBar(
        'All required fields are not filled.',
      );
    } else {
      form.save();
      showInSnackBar('${person.username} successfully logged in.');
      Navigator.pushNamed(context, '/owner_dashboard');
    }
  }

  String _validateName(String value) {
    if (value.isEmpty) {
      return 'Username is required';
    }
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'OnlyAlphabeticalChars';
    }
    return null;
  }

  String _validatePassword(String value) {
    final passwordField = _passwordFieldKey.currentState;
    if (passwordField.value == null || passwordField.value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final cursorColor = Theme.of(context).cursorColor;
    const sizedBoxSpace = SizedBox(height: 24);

    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              sizedBoxSpace,
              TextFormField(
                textCapitalization: TextCapitalization.words,
                cursorColor: cursorColor,
                decoration: InputDecoration(
                  filled: true,
                  icon: const Icon(Icons.person),
                  hintText: 'Enter your username',
                ),
                onSaved: (value) {
                  setState(() {
                    person.username = value;
                  });
                },
                validator: _validateName,
              ),
              sizedBoxSpace,
              TextFormField(
                cursorColor: cursorColor,
                decoration: InputDecoration(
                  filled: true,
                  icon: const Icon(Icons.lock),
                  hintText: 'Enter your password',
                ),
                obscureText: true,
                onSaved: (value) {
                  setState(() {
                    person.password = value;
                  });
                },
              ),
              sizedBoxSpace,
              RaisedButton(
                child: Text('LOG IN'),
                color: Colors.blue[500],
                textColor: Colors.white,
                onPressed: () {
                  _handleSubmitted();
                },
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text(
                  'Login as user',
                  style: TextStyle(fontSize: 16),
                ),
                textColor: Colors.amber[500],
              ),
              sizedBoxSpace,
            ],
          ),
        ),
      ),
    );
  }
}
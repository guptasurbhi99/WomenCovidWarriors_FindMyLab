import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;


class Register extends StatelessWidget {
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
        title: Text('Registration Lab User'),
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

class LabData {
  String name = '';
  String phoneNumber = '';
  String userID = '';
  String password = '';
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      cursorColor: Theme.of(context).cursorColor,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          dragStartBehavior: DragStartBehavior.down,
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            semanticLabel: _obscureText
                ? 'Show password label'
                : 'Hide password label',
          ),
        ),
      ),
    );
  }
}

class TextFormFieldDemoState extends State<TextFormFieldDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  LabData lab = LabData();

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
  //final _UsNumberTextInputFormatter _phoneNumberFormatter =
  //_UsNumberTextInputFormatter();

  void _handleSubmitted() {
    final form = _formKey.currentState;
    if (!form.validate()) {
      _autoValidate = true; // Start validating on every change.
      showInSnackBar(
        'Incorrect',
      );
    } else {
      form.save();
      showInSnackBar(lab.name + lab.phoneNumber);
      Navigator.pushNamed(context, '/user_dashboard');
    }
  }

  String _validateName(String value) {
    if (value.isEmpty) {
      return 'Name Required';
    }
    if (value.isEmpty) {
      return 'UserID is required';
    }
    return null;
  }

  String _validatePhoneNumber(String value) {
    final phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    if (!phoneExp.hasMatch(value)) {
      return 'Enter valid Phone Number';
    }
    return null;
  }

  String _validatePassword(String value) {
    final passwordField = _passwordFieldKey.currentState;
    if (passwordField.value == null || passwordField.value.isEmpty) {
      return 'Enter Password';
    }
    if (passwordField.value != value) {
      return 'Passwords Do Not Match';
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
        child: Scrollbar(
          child: SingleChildScrollView(
            dragStartBehavior: DragStartBehavior.down,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                sizedBoxSpace,
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  cursorColor: cursorColor,
                  decoration: InputDecoration(
                    filled: true,
                    icon: const Icon(Icons.person),
                    hintText: 'Enter the name of your lab',
                    labelText: 'Name',
                  ),
                  onSaved: (value) {
                    lab.name = value;
                  },
                  validator: _validateName,
                ),
                sizedBoxSpace,
                TextFormField(
                  cursorColor: cursorColor,
                  decoration: InputDecoration(
                    filled: true,
                    icon: const Icon(Icons.phone),
                    hintText: 'Enter a valid phone number',
                    labelText: 'Phone Number',
                    prefixText: '+91 ',
                  ),
                  keyboardType: TextInputType.phone,
                  onSaved: (value) {
                    lab.phoneNumber = value;
                  },
                  maxLength: 10,
                  maxLengthEnforced: false,
                  validator: _validatePhoneNumber,
                  // TextInputFormatters are applied in sequence.
                  //inputFormatters: <TextInputFormatter>[
                    //WhitelistingTextInputFormatter.digitsOnly,
                    // Fit the validating format.
                    //_phoneNumberFormatter,
                  //],
                ),
                sizedBoxSpace,
                TextFormField(
                  cursorColor: cursorColor,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Enter a UserID so that people can recognize you',
                    labelText: 'User ID',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    lab.userID = value;
                  },
                ),
                sizedBoxSpace,
                PasswordField(
                  fieldKey: _passwordFieldKey,
                  helperText:
                  'Enter a 8 character Password',
                  labelText:
                  'Password',
                  onFieldSubmitted: (value) {
                    setState(() {
                      lab.password = value;
                    });
                  },
                ),
                sizedBoxSpace,
                Center(
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('Register'),
                    onPressed: () {
                      _handleSubmitted();
                    },
                  ),
                ),
                sizedBoxSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Format incoming numeric text to fit the format of (###) ###-#### ##

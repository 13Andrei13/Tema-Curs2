import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'dart:math';

class App2Screen extends StatefulWidget {
  static const routeName = '/app-2';
  @override
  _App2ScreenState createState() => _App2ScreenState();
}

class _App2ScreenState extends State<App2Screen> {
  TextEditingController _controller = TextEditingController();
  double numberInput;
  int oki = 0;
  int i, ok;
  int verificationNumber(double numberInput) {
    double a = sqrt(numberInput);
    int m = 0;
    int n = numberInput.toInt();
    int i;
    for (i = 2; i <= n; i = i + 1) {
      int copie = n;
      int j = 0;
      if (n % i == 0) {
        while (copie % i == 0) {
          copie = (copie / i).toInt();
          j = j + 1;
        }

        if (j == 3 && copie == 1) {
          m = m + 2;
        }
      }
    }
    if (a == a.toInt())
      m = m + 1;
    else
      m = m + 0;
    return m;
  }

  void dialog(BuildContext context) {
    String text;
    int i = verificationNumber(numberInput);
    print(i);
    if (i == 0)
      text = 'Number $numberInput is neither TRIANGULAR OR SQUARE.';
    else if (i == 1)
      text = 'Number $numberInput is SQUARE.';
    else if (i == 2)
      text = 'Number $numberInput is TRIANGULAR';
    else if (i == 3)
      text = 'Number $numberInput is both SQUARE and TRIANGULAR.';

    var alertDialog = AlertDialog(
      title: Text('$numberInput'),
      content: Text(text),
    );

    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Shapes'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  'Please input a number to see if it is square or triangular',
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter your number',
                  suffix: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                    },
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  numberInput = double.parse(value);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onPressed: () {
          setState(() {
            _controller.clear();
            oki = 1;
            dialog(context);
          });
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _textoEntrada1 = "Pode entrar";

  void _changePeople(int delta) {
    setState(() {
      if ((_people == 20) && (delta == 1)) {
        _textoEntrada1 = "Cheio";
      } else {
        if ((_people == 0) && (delta == -1)) {
          _textoEntrada1 = "Mundo invertido?!";
        } else {
          _people += delta;
          _textoEntrada1 = "Pode Entrar";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/restaurant.jpg", fit: BoxFit.cover, height: 1000.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text(
                    "+1",
                    style: TextStyle(fontSize: 40.0, color: Colors.white),
                  ),
                  onPressed: () {
                    _changePeople(1);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text(
                    "-1",
                    style: TextStyle(fontSize: 40.0, color: Colors.white),
                  ),
                  onPressed: () {
                    _changePeople(-1);
                  },
                ),
              ),
            ]),
            Text(
              _textoEntrada1,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            ),
          ],
        )
      ],
    );
  }
}

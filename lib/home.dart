import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(opcoes.length);

    var escolhaApp = opcoes[numero];

//    Showing the Apps chosen image
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          _imagemApp = AssetImage("images/pedra.png");
        });
        break;

      case "papel":
        setState(() {
          _imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

//    Validating user win
    if (
        (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ) {
        this._mensagem = "Você ganhou :)";
    } else if (
        (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")
    ) {
      this._mensagem = "CPU ganhou :(";
    } else {
      this._mensagem = "Empate :/";
    }

//    print(escolhaUsuario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JoKenPo"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 70, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "Escolha do App",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Image(
              image: this._imagemApp,
            ),
            Text(
              this._mensagem,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                    onTap: () => this._opcaoSelecionada("pedra"),
                    child: Image.asset("images/pedra.png", height: 80)),
                GestureDetector(
                    onTap: () => this._opcaoSelecionada("papel"),
                    child: Image.asset("images/papel.png", height: 80)),
                GestureDetector(
                    onTap: () => this._opcaoSelecionada("tesoura"),
                    child: Image.asset("images/tesoura.png", height: 80)),
              ],
            )
            // row images
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hesapmakinesi extends StatefulWidget {
  const Hesapmakinesi({super.key});

  @override
  State<Hesapmakinesi> createState() => _HesapmakinesiState();
}

class _HesapmakinesiState extends State<Hesapmakinesi> {
  final numbers = List.generate(10, (index) => index.toString());
  String _display = '';

  void _onNumberPressed(String number) {
    setState(() {
      _display += number;
    });
  }

  void _clearButton() {
    setState(() {
      _display = "";
    });
  }

  void _sembolFonk() {
    setState(() {
      _display += "+";
    });
  }

  void _sonucGoster() {
    setState(() {
      if (_display.contains("+")) {
        List<String> sayilar = _display.split("+");
        int toplam = 0;
        for (var s in sayilar) {
          if (s.isNotEmpty) {
            toplam += int.parse(s);
          }
        }
        _display = toplam.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget buton1;
    Widget buton2;
    Widget buton3;
    Widget buton4;
    Widget buton5;
    Widget buton6;
    Widget buton7;
    Widget buton8;
    Widget buton9;
    Widget buton0;
    Widget butonac;
    Widget butonToplama;
    Widget islemButonu;
    Widget sonucGoster;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mini Hesap Makinesi",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                _display,
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buton1 = Buttons.butonEkleme("1", () => _onNumberPressed("1")),
              buton2 = Buttons.butonEkleme("2", () => _onNumberPressed("2")),
              buton3 = Buttons.butonEkleme("3", () => _onNumberPressed("3")),
            ],
          ),

          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buton4 = Buttons.butonEkleme("4", () => _onNumberPressed("4")),
              buton5 = Buttons.butonEkleme("5", () => _onNumberPressed("5")),
              buton6 = Buttons.butonEkleme("6", () => _onNumberPressed("6")),
            ],
          ),

          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buton7 = Buttons.butonEkleme("7", () => _onNumberPressed("7")),
              buton8 = Buttons.butonEkleme("8", () => _onNumberPressed("8")),
              buton9 = Buttons.butonEkleme("9", () => _onNumberPressed("9")),
            ],
          ),

          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              butonToplama = Buttons.butonEkleme("+", () => _sembolFonk()),
              buton0 = Buttons.butonEkleme("0", () => _onNumberPressed("0")),
              butonac = Buttons.butonEkleme("C", () => _clearButton()),
            ],
          ),

          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              sonucGoster = Buttons.butonEkleme("=", () => _sonucGoster())
            ],
          )
        ],
      ),
    );
  }
}

class Buttons {
  final String text;

  Buttons({required this.text});

  static Widget butonEkleme(String text, VoidCallback onPressed) {
    return SizedBox(
      width: 70,
      height: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

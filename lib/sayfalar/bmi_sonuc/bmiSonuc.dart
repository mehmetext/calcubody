import 'package:flutter/material.dart';
import 'dart:math' as math;

class BMISonuc extends StatelessWidget {
  double kilo;
  double boy;
  String isim;
  double sonuc;

  BMISonuc({
    @required this.kilo,
    @required this.boy,
    @required this.isim,
  });

  double sonucuBul() {
    return kilo / ((boy / 100) * (boy / 100));
  }

  @override
  Widget build(BuildContext context) {
    Color anaRenk = Theme.of(context).primaryColor;
    sonuc = sonucuBul();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: anaRenk,
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Hero(
                tag: "logo",
                child: Logo(),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(0, 4),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        sonucuGetir(anaRenk),
                        SizedBox(height: 10),
                        bilgiGetir(anaRenk, "18,5", "Zayıf"),
                        bilgiGetir(anaRenk, "18,5 - 25", "Sağlıklı"),
                        bilgiGetir(anaRenk, "25 - 30", "Kilolu"),
                        bilgiGetir(anaRenk, "30 - 40", "Aşırı Kilolu"),
                        SizedBox(height: 10),
                        butonGetir(anaRenk, context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container butonGetir(Color anaRenk, BuildContext context) {
    return Container(
      width: double.infinity,
      child: Material(
        borderRadius: BorderRadius.circular(80),
        color: anaRenk,
        child: InkWell(
          borderRadius: BorderRadius.circular(80),
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "TEKRAR HESAPLA",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container bilgiGetir(Color anaRenk, String aralik, String isim) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(80),
      ),
      padding: EdgeInsets.all(6),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              "$aralik",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            decoration: BoxDecoration(
              color: anaRenk,
              borderRadius: BorderRadius.circular(80),
            ),
            height: 28,
            width: 70,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10),
          ),
          Expanded(
            child: Text(
              "$isim",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column sonucuGetir(Color anaRenk) {
    return Column(
      children: <Widget>[
        Text(
          "$isim, BMI Sonucun:",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(120),
            color: anaRenk,
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "${sonuc.toStringAsFixed(1)}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "kg/m²",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -(8 * math.pi / 180),
      child: Image.asset(
        "assets/images/logo.png",
        width: 76,
      ),
    );
  }
}

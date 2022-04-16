import 'package:flutter/material.dart';
import 'dart:ui';

import 'widgetlar.dart';

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color anaRenk = Theme.of(context).primaryColor;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: anaRenk.withOpacity(0.84),
          ),
          Versiyon(),
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: "logo",
                    child: Logo(),
                  ),
                  SizedBox(height: 40),
                  Buton(anaRenk: anaRenk),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

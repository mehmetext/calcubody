import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui';

class Versiyon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            margin: EdgeInsets.only(right: 10, bottom: 10),
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Text(
            "Beta v1.0.0",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w100,
              fontSize: 10,
            ),
          ),
          ),
        ),
      ),
    );
  }
}

class Buton extends StatelessWidget {
  const Buton({
    Key key,
    @required this.anaRenk,
  }) : super(key: key);

  final Color anaRenk;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(80),
      child: InkWell(
        splashColor: anaRenk.withOpacity(0.1),
        highlightColor: anaRenk.withOpacity(0.1),
        borderRadius: BorderRadius.circular(80),
        onTap: () => Navigator.pushNamed(context, "/BMIHesaplama"),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "BMI HESAPLA",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: anaRenk,
            ),
          ),
        ),
      ),
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
        width: 220,
        height: 228,
      ),
    );
  }
}
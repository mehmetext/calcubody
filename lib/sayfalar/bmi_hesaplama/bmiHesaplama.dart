import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:toast/toast.dart';

class BMIHesaplama extends StatefulWidget {
  @override
  _BMIHesaplamaState createState() => _BMIHesaplamaState();
}

class _BMIHesaplamaState extends State<BMIHesaplama> {
  TextEditingController _adiniziGirin;
  bool erkekMi = true;
  double yas = 18;
  double kilo = 60;
  double boy = 180;
  GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _adiniziGirin = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Color anaRenk = Theme.of(context).primaryColor;

    return Scaffold(
      key: _scaffoldKey,
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
                        Bolum(
                          baslik: "Adın",
                          icerik: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(80),
                            ),
                            child: TextField(
                              controller: _adiniziGirin,
                              textCapitalization: TextCapitalization.sentences,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                hintText: "Adını gir...",
                                hintStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Bolum(
                          baslik: "Cinsiyetin",
                          icerik: Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                cinsiyetButon(
                                  renk: Color(0xFF1458F6),
                                  erkekBtn: true,
                                ),
                                cinsiyetButon(
                                  renk: Color(0xFFF614BA),
                                  erkekBtn: false,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Bolum(
                          baslik: "Yaşın",
                          icerik: SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 2,
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 8.0),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 8.0),
                              activeTrackColor: anaRenk,
                              thumbColor: anaRenk,
                              overlayColor: anaRenk.withOpacity(0.1),
                              valueIndicatorColor: anaRenk,
                              inactiveTrackColor:
                                  Colors.black.withOpacity(0.26),
                            ),
                            child: Slider(
                              min: 5,
                              max: 90,
                              divisions: 85,
                              label: yas.toStringAsFixed(0),
                              value: yas,
                              onChanged: (deger) {
                                setState(() {
                                  yas = deger;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Bolum(
                          baslik: "Kilon (kg)",
                          icerik: SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 2,
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 8.0),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 8.0),
                              activeTrackColor: anaRenk,
                              thumbColor: anaRenk,
                              overlayColor: anaRenk.withOpacity(0.1),
                              valueIndicatorColor: anaRenk,
                              inactiveTrackColor:
                                  Colors.black.withOpacity(0.26),
                            ),
                            child: Slider(
                              min: 20,
                              max: 140,
                              divisions: 240,
                              label: kilo.toStringAsFixed(2),
                              value: kilo,
                              onChanged: (deger) {
                                setState(() {
                                  kilo = deger;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Bolum(
                          baslik: "Boyun (cm)",
                          icerik: SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 2,
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 8.0),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 8.0),
                              activeTrackColor: anaRenk,
                              thumbColor: anaRenk,
                              overlayColor: anaRenk.withOpacity(0.1),
                              valueIndicatorColor: anaRenk,
                              inactiveTrackColor:
                                  Colors.black.withOpacity(0.26),
                            ),
                            child: Slider(
                              min: 100,
                              max: 230,
                              divisions: 130,
                              label: boy.toStringAsFixed(0),
                              value: boy,
                              onChanged: (deger) {
                                setState(() {
                                  boy = deger;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          child: Material(
                            borderRadius: BorderRadius.circular(80),
                            color: anaRenk,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(80),
                              onTap: () {
                                if (_adiniziGirin.text.length < 3) {
                                  Toast.show("Adınız en az 3 harf olmalı!", context, duration: Toast.LENGTH_LONG);
                                } else {
                                  Navigator.pushNamed(context, "/BMISonuc/${_adiniziGirin.text}/$kilo/$boy");
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  "HESAPLA",
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
                        ),
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

  Expanded cinsiyetButon({renk, erkekBtn}) {
    return Expanded(
      child: Material(
        borderRadius: erkekBtn
            ? BorderRadius.only(
                topLeft: Radius.circular(80),
                bottomLeft: Radius.circular(80),
              )
            : BorderRadius.only(
                topRight: Radius.circular(80),
                bottomRight: Radius.circular(80),
              ),
        color: erkekMi == erkekBtn ? renk : renk.withOpacity(0.2),
        child: InkWell(
          borderRadius: erkekBtn
              ? BorderRadius.only(
                  topLeft: Radius.circular(80),
                  bottomLeft: Radius.circular(80),
                )
              : BorderRadius.only(
                  topRight: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
          onTap: () {
            setState(() {
              erkekMi = erkekBtn;
            });
          },
          child: Align(
            alignment: Alignment.center,
            child: Text(
              erkekBtn ? "ERKEK" : "KADIN",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: erkekMi == erkekBtn ? Colors.white : renk,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Bolum extends StatelessWidget {
  final String baslik;
  final Widget icerik;

  Bolum({this.baslik, this.icerik});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "$baslik",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        icerik ?? Container(),
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

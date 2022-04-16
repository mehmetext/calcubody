import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'sayfalar/anasayfa/anasayfa.dart';
import 'sayfalar/bmi_hesaplama/bmiHesaplama.dart';
import 'sayfalar/bmi_sonuc/bmiSonuc.dart';

void main() => runApp(CalcuBody());

class CalcuBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CalcuBody",
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Color(0xFFD60033),
        fontFamily: "Roboto",
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => AnaSayfa(),
        "/BMIHesaplama": (context) => BMIHesaplama()
      },
      onGenerateRoute: (routeSettings) {
        var routePath = routeSettings.name;
        List<String> parcalar = routePath.split("/");
        print(parcalar);

        if (parcalar[1] == "BMISonuc") {
          return MaterialPageRoute(
            builder: (context) => BMISonuc(
              isim: parcalar[2],
              kilo: double.parse(parcalar[3]),
              boy: double.parse(parcalar[4]),
            ),
          );
        } else
          return null;
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:routebus/home.dart';
import 'package:splashscreen/splashscreen.dart';

void main(){
 runApp(MaterialApp(
   home:Splash(),
   debugShowCheckedModeBanner: false,
 )); 
}


class Splash extends StatefulWidget {
  @override
  _SplashState createState() =>_SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 8,
      navigateAfterSeconds: Home(),
      title: Text('Routebus - Transporte Público de Dourados',
      style: TextStyle(
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.w400
      ),
      textAlign: TextAlign.center,
      ),
      image: Image.asset("images/logo.png"),
      backgroundColor: Color(0xFF0e70c1),
      styleTextUnderTheLoader:  TextStyle(),
      photoSize:60.0,
      onClick: ()=>print("Flutter Egypt"),
      loadingText:Text('Versão 1.0 - Desenvolvido por Marcos Lopes.',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w400
        ),
      ),
      loaderColor: Colors.white
    );
  }
}

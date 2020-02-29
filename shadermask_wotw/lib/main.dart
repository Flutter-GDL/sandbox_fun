import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shadermask_wotw/watermark.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Samples Guadalajara'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _displayContainer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,style: GoogleFonts.dMSans(color: Colors.white,fontSize: 20),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 6,
              child: Column(
                children: <Widget>[
                  Text('Shadermask Sample', style: GoogleFonts.poppins(fontSize: 30)),
                  Spacer(),
                  shaderMaskSample(),
                  Spacer(),
                ],
              ),
            ),
            OutlineButton(
                onPressed: () {
                  setState(() {
                    _displayContainer = !_displayContainer;
                  });
                },
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Text(
                    "Switch widget to " + ((_displayContainer == true) ? "image" : "container")),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
            Spacer(
              flex: 1,
            ),
            bottomWatermark(),
          ],
        ),
      ),
    );
  }

  /// Aquí esta lo bueno
  Widget shaderMaskSample() {
    return ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            begin: Alignment(-1, 0),
            end: Alignment(1, 0),
            stops: [0, 0.5, 1.0],
            colors: <Color>[Colors.green, Colors.grey.withOpacity(0.2), Colors.red],
          ).createShader(bounds);
        },
        child: (_displayContainer == true) ? sampleContainer() : sampleImage());
  }

  /// NOTA:
  Widget sampleContainer() {
    return Column(
      children: <Widget>[
        Text(
          "Flutter",
          style: GoogleFonts.tradeWinds(fontSize: 60, color: Colors.white /*Colors.red*/),
        ),
        Text('Le baje al color del texto de arriba \n para que se vea contrastante'),
      ],
    );
  }

  /// la imagen ya tiene colores
  /// entonces el efecto satura los colores que ya existen
  Widget sampleImage() {
    return Column(
      children: <Widget>[
        Image.asset(
          "assets/mexico.png",
          width: 300,
          height: 300,
        ),
        Text('la imagen ya tiene colores,entonces \n el efecto satura los colores que ya existen'),
      ],
    );
  }


}

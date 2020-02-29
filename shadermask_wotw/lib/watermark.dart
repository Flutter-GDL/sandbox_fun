import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

Widget heart({double width = 20, double height = 20}) {
  return Image.asset(
    "assets/corazon.png",
    width: width,
    height: height,
  );
}


Widget bottomWatermark() {
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Created with', style: GoogleFonts.poppins(fontSize: 15)),
          SizedBox(
            width: 5,
          ),
          heart(),
          SizedBox(
            width: 5,
          ),
          Text('for Flutter Guadalajara', style: GoogleFonts.poppins(fontSize: 15)),
        ],
      ),
      // se puede haber usado safe area en todo el app
      // pero se hubiera visto mal arriba
      SizedBox(
        height: 20,
      )
    ],
  );
}

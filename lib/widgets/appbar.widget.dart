import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

appbarWidget(BuildContext context,String name,{bool istrue=false,bool removebackbutton=false})
{
  return  AppBar(
    automaticallyImplyLeading: removebackbutton ?false:true,
    title: Text(name,style:istrue?GoogleFonts.aladin():GoogleFonts.roboto()),
    backgroundColor: Colors.teal,
    centerTitle: true,
  );
}
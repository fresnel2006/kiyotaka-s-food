import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:kiyotaka_s_food/Pages/Acceuil.dart';
import 'package:kiyotaka_s_food/Pages/MainScreen.dart';
import 'package:kiyotaka_s_food/Pages/MenuScreen.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({super.key});

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ZoomDrawer(
        mainScreenTapClose: true,
         slideWidth:MediaQuery.of(context).size.width *0.65 ,
showShadow: true,
          shadowLayer1Color: Colors.deepOrange.shade400,
shadowLayer2Color:Colors.orange.shade300 ,
          angle: 0,
          menuScreen:MenuscreenPage(),
          mainScreen: MainscreenPage()),
    );
  }
}

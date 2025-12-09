import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiyotaka_s_food/Pages/Acceuil.dart';
import 'package:kiyotaka_s_food/Pages/Favoris.dart';
import 'package:kiyotaka_s_food/Pages/Panier.dart';
import 'package:kiyotaka_s_food/Pages/Profil.dart';

class MainscreenPage extends StatefulWidget {
  const MainscreenPage({super.key});

  @override
  State<MainscreenPage> createState() => _MainscreenPageState();
}

class _MainscreenPageState extends State<MainscreenPage> {
int index=0;
var Pages=[AcceuilPage(),PanierPage(),FavorisPage(),ProfilPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.white,
        body: Pages[index],
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height *0.08,

          child: Container(

            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){setState(() {
                  index=0;
                });},
                child:Container(child: Icon(Icons.home_filled,color: Colors.orange,size: MediaQuery.of(context).size.width *0.1,),) ,)
              ,GestureDetector(
                onTap: (){setState(() {
                  index=1;
                });},
                child:  Container(
                 child: Icon(Icons.shopping_basket,color: Colors.orange,size: MediaQuery.of(context).size.width *0.1),),)
              ,GestureDetector(
                onTap: (){setState(() {
                  index=2;
                });},
                child:  Container(child: Icon(CupertinoIcons.suit_heart_fill,color:Colors.orange,size: MediaQuery.of(context).size.width *0.1),),)
              ,GestureDetector(
                onTap: (){setState(() {
                  index=3;
                });},
                child:Container(child: Icon(Icons.manage_accounts_rounded,color: Colors.orange,size: MediaQuery.of(context).size.width *0.1),) ,)

            ],) ,),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(1000),)),
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height *0.02),
        ),
      )
    );
  }
}

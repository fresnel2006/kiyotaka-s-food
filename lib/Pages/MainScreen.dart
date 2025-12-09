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
                child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Container(

                        child: index==0?Icon(Icons.home_filled,color: Colors.orange,size: MediaQuery.of(context).size.width *0.1,):Icon(Icons.home_outlined,color: Colors.orange,size: MediaQuery.of(context).size.width *0.1,),)
                      ,index==0?Text("ACCEUIL",style: TextStyle(color: Colors.orange,fontFamily: "Poppins"),):Container()],)
                ,)
              ,GestureDetector(
                onTap: (){setState(() {
                  index=1;
                });},
                child:  Container(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                   index==1?Icon(Icons.shopping_basket_sharp,color: Colors.orange,size: MediaQuery.of(context).size.width *0.1):Icon(Icons.shopping_basket_outlined,color: Colors.orange,size: MediaQuery.of(context).size.width *0.1),
                   index==1?Text("PANIER",style: TextStyle(fontFamily: "Poppins",color: Colors.orange),):Container()
                 ],),),)
              ,GestureDetector(
                onTap: (){setState(() {
                  index=2;
                });},
                child:  Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      index==2?Icon(CupertinoIcons.suit_heart_fill,color:Colors.orange,size: MediaQuery.of(context).size.width *0.1):Icon(CupertinoIcons.suit_heart,color:Colors.orange,size: MediaQuery.of(context).size.width *0.1),
                      index==2?Text("FAVORIS",style: TextStyle(fontFamily: "Poppins",color: Colors.orange)):Container()
                  ],),),)
              ,GestureDetector(
                onTap: (){setState(() {
                  index=3;
                });},
                child:Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  index==3?Icon(Icons.manage_accounts_rounded,color: Colors.orange,size: MediaQuery.of(context).size.width *0.1):Icon(Icons.manage_accounts_outlined,color: Colors.orange,size: MediaQuery.of(context).size.width *0.1),
                  index==3?Text("COMPTE",style: TextStyle(fontFamily: "Poppins",color: Colors.orange),):Container()
                ],),) ,)

            ],) ,),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(1000),)),
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height *0.02),
        ),
      )
    );
  }
}

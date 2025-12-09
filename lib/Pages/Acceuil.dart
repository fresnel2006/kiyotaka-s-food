import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AcceuilPage extends StatefulWidget {
  const AcceuilPage({super.key});

  @override
  State<AcceuilPage> createState() => _AcceuilPageState();
}

class _AcceuilPageState extends State<AcceuilPage> {
var valeur_redictrice_widget;
  var images=["assets/images/Thiéboudiène sénégalais _ la recette de Marc Dufumier.jpg","assets/images/Ceebu Yapp - beef or lamb variation, of the….jpg","assets/images/Splash photography on Behance.jpg","assets/images/Attieke à la dorade royale (Côte d'Ivoire) - La tendresse en cuisine.jpg","assets/images/empiler de crêpe avec Chocolat bruine.jpg","assets/images/Water _).jpg","assets/images/crepes fromage.jpg","assets/images/Sprite Is No Longer Going to Be Sold in Green___.jpg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
body: Stack(

  children: [
  //l'espace scrollable
    SingleChildScrollView(
        child: Column(
          children: [
            //espace du haut
            SizedBox(height: MediaQuery.of(context).size.height *0.035,),
            //widget permettant de centrer
            Container(width: MediaQuery.of(context).size.width *1,),
            //le widget permettant de stocker l'image et "crepes" "boissons" "midi"



    Stack(
      children: [
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.12),
        height: MediaQuery.of(context).size.height *0.18,
        width: MediaQuery.of(context).size.width *0.85,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1

            ))),child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
        child: Image.asset(images[1],fit: BoxFit.cover,),),
      ),

    ],),SizedBox(height: MediaQuery.of(context).size.height *0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          valeur_redictrice_widget=1;
                        });
                      },
                      child:Container(
                        alignment: AlignmentGeometry.center,
                        height: MediaQuery.of(context).size.height *0.035,
                        width: MediaQuery.of(context).size.width *0.22,
                        child: Text("TOUS",style: TextStyle(fontFamily: "Poppins",color: Colors.white),),
                        decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1))),
                      ) ,
                    ),
GestureDetector(
  onTap: (){
    setState(() {
      valeur_redictrice_widget=2;
    });;
  },
    child:Container(
  alignment: AlignmentGeometry.center,
  height: MediaQuery.of(context).size.height *0.035,
  width: MediaQuery.of(context).size.width *0.22,
  child: Text("CRÊPES",style: TextStyle(fontFamily: "Poppins",color: Colors.white),),
  decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1))),
) ),
                    GestureDetector(child: Container(
                      alignment: AlignmentGeometry.center,
                      height: MediaQuery.of(context).size.height *0.035,
                      width: MediaQuery.of(context).size.width *0.22,
                      child: Text("BOISSONS",style: TextStyle(fontFamily: "Poppins",color: Colors.white)),
                      decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1))),
                    ),),
                    GestureDetector(child: Container(
                      alignment: AlignmentGeometry.center,
                      height: MediaQuery.of(context).size.height *0.035,
                      width: MediaQuery.of(context).size.width *0.22,
                      child: Text("MIDI",style: TextStyle(fontFamily: "Poppins",color: Colors.white)),
                      decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1))),
                    ),)
                    ,
                  ],),
SizedBox(height: MediaQuery.of(context).size.height *0.03,),
valeur_redictrice_widget==1?
    
            Container(
              height: MediaQuery.of(context).size.height *0.3,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                children: [

                  Container(
                    height: MediaQuery.of(context).size.height *0.274,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
                    child: Column(
                      children: [

                    Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                      child: Image.asset(images[0],fit: BoxFit.cover,),))
                    ,Container(

                        child: Column(

                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height *0.012,),
                            Row(children: [
                              Text("TCHÊPE POISSON",style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

                            ],),


                            Row(children: [
                              Text("1000 FCFA",style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                              SizedBox(width: MediaQuery.of(context).size.width *0.075,),
                              Icon(Icons.shopping_cart)
                            ],)
                      ],),)

                  ],),),
                  SizedBox(width: MediaQuery.of(context).size.width *0.03,),
                  Container(
                    height: MediaQuery.of(context).size.height *0.274,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
                    child: Column(
                      children: [

                        Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                          child: Image.asset(images[2],fit: BoxFit.cover,),))
                        ,Container(

                          child: Column(

                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height *0.012,),
                              Row(children: [
                                Text("COCA-COLA",style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

                              ],),


                              Row(children: [
                                Text("1000 FCFA",style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                                SizedBox(width: MediaQuery.of(context).size.width *0.075,),
                                Icon(Icons.shopping_cart)
                              ],)
                            ],),)

                      ],),),
                  SizedBox(width: MediaQuery.of(context).size.width *0.03,),
                  Container(
                    height: MediaQuery.of(context).size.height *0.274,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
                    child: Column(
                      children: [

                        Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                          child: Image.asset(images[3],fit: BoxFit.cover,),))
                        ,Container(

                          child: Column(

                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height *0.012,),
                              Row(children: [
                                Text("ATTIEKE POISSON",style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

                              ],),


                              Row(children: [
                                Text("1000 FCFA",style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                                SizedBox(width: MediaQuery.of(context).size.width *0.075,),
                                Icon(Icons.shopping_cart)
                              ],)
                            ],),),SizedBox(width: MediaQuery.of(context).size.width *0.03,),

                      ],),),
                  SizedBox(width: MediaQuery.of(context).size.width *0.03,),
                  Container(
                    height: MediaQuery.of(context).size.height *0.274,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
                    child: Column(
                      children: [

                        Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                          child: Image.asset(images[4],fit: BoxFit.cover,),))
                        ,Container(

                          child: Column(

                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height *0.012,),
                              Row(children: [
                                Text("CRÊPES",style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

                              ],),


                              Row(children: [
                                Text("1000 FCFA",style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                                SizedBox(width: MediaQuery.of(context).size.width *0.075,),
                                Icon(Icons.shopping_cart)
                              ],)
                            ],),),
                      ],),),SizedBox(width: MediaQuery.of(context).size.width *0.03,)
                  ,Container(
                    height: MediaQuery.of(context).size.height *0.274,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
                    child: Column(
                      children: [

                        Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                          child: Image.asset(images[5],fit: BoxFit.cover,),))
                        ,Container(

                          child: Column(

                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height *0.012,),
                              Row(children: [
                                Text("EAU",style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

                              ],),


                              Row(children: [
                                Text("1000 FCFA",style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                                SizedBox(width: MediaQuery.of(context).size.width *0.075,),
                                Icon(Icons.shopping_cart)
                              ],)
                            ],),),

                      ],),),


                ],),

              )):Text(""),
            
            SizedBox(height: MediaQuery.of(context).size.height *0.015),
            valeur_redictrice_widget==1?Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text("AUTRE OFFRE",style: TextStyle(color: Colors.black,fontFamily: "Poppins"),),
              Container(height: MediaQuery.of(context).size.height *0.002,
                width: MediaQuery.of(context).size.width *0.6,
                decoration: BoxDecoration(border: Border.all(color: Colors.orange)),)
            ],):Text(""),
            valeur_redictrice_widget==1?Container(
              height: MediaQuery.of(context).size.height *0.6,


              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,itemBuilder: (context, index) => ListTile(
                trailing: CircleAvatar(backgroundColor:Colors.white,child: Icon(CupertinoIcons.arrow_right,color: Colors.black,),),
                leading: Container(

                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.04)),
                    child: Image.asset(images[4]),),),
                title: Text("CRÊPES AU FROMAGE BY MARIAM",style: TextStyle(fontFamily: "Poppins"),),
                subtitle: Row(children: [Text("Prix : ",style: TextStyle(fontFamily: "Poppins"),),
                  Container(
                    alignment: AlignmentGeometry.center,
height: MediaQuery.of(context).size.height *0.03,
                  width: MediaQuery.of(context).size.width *0.16,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(

                      Radius.circular(MediaQuery.of(context).size.width *0.1))),
                  child: Text("2000FR",style: TextStyle(color: Colors.white,fontFamily: "Poppins"),),)],),
              ),)
              ,):Text("")
    ],
        )
    ),
valeur_redictrice_widget==2?Container(
    margin: EdgeInsets.only(top: 300),
    child: Text("crepes ouvert")):Text(""),










//Le menu du haut qui est fixe
  Container(
    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.032),
    decoration: BoxDecoration(color: Colors.white),
    height: MediaQuery.of(context).size.height *0.12,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){
        }, icon: Icon(Icons.menu_sharp,size: MediaQuery.of(context).size.width *0.1,)),
        Row(children: [
          Icon(Icons.local_restaurant ,size:MediaQuery.of(context).size.width *0.09),
          Text("kiyotaka's food",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.05),),
        ],),
      IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.magnifyingGlass,size:MediaQuery.of(context).size.width *0.07,))
    ],),


    ),

  ]),
    );
  }
}

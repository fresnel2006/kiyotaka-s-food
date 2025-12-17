import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiyotaka_s_food/Pages/Modification.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}
class _ProfilPageState extends State<ProfilPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width *1,
            height: MediaQuery.of(context).size.height *0.4,
            child: Image.asset("assets/images/Thiéboudiène sénégalais _ la recette de Marc Dufumier.jpg",fit: BoxFit.cover,),
          ),
          Container(

              width: MediaQuery.of(context).size.width *1,
              height: MediaQuery.of(context).size.height *0.4,
              decoration: BoxDecoration(

                  gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.white24,
                        Colors.white
                      ],
                      begin: AlignmentGeometry.topCenter,
                      end: AlignmentDirectional.bottomCenter

                  )
              )
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height *0.35,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("PROFIL",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.1),),
                ),

                Container(
                  width: MediaQuery.of(context).size.width *0.5,

                  decoration: BoxDecoration(border: Border.all(color: Colors.orange,width: MediaQuery.of(context).size.width *0.004)),)
            ],),
              SizedBox(height: MediaQuery.of(context).size.height *0.04,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
  Text("NOM : ",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),
                SizedBox(height: MediaQuery.of(context).size.height *0.02,),

                Container(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.pen,color: Colors.orange,),
                      hintText: "TRAORE ANGE FRESNEL",
                      hintStyle: TextStyle(fontFamily: "Poppins"),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1))
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1))
                      )
                    ),),
                  height: MediaQuery.of(context).size.height *0.06,width: MediaQuery.of(context).size.width *0.7,),


              ],),
              SizedBox(height: MediaQuery.of(context).size.height *0.02,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("NUMERO : ",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),
                  SizedBox(height: MediaQuery.of(context).size.height *0.02,),
                  Container(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.numbers,color: Colors.green,),
                        hintText: "0150161468",
                        hintStyle: TextStyle(fontFamily: "Poppins"),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1))
                        )
                    ),),
                  height: MediaQuery.of(context).size.height *0.06,width: MediaQuery.of(context).size.width *0.7,),


              ],),
              SizedBox(height: MediaQuery.of(context).size.height *0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Container(
                  alignment: Alignment.topRight,
                  width: MediaQuery.of(context).size.width *0.25,
                  child: Text("PRODUIT \nPREFERE",style: TextStyle(fontFamily: "Poppins"),),),
                  Container(
                    height: MediaQuery.of(context).size.height *0.1,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  ),
                  Container(
                    width:MediaQuery.of(context).size.width *0.25,
                    child:Text("NOMBRE DE PRODUIT : 0",style: TextStyle(fontFamily: "Poppins")),)
              ],),
              SizedBox(height: MediaQuery.of(context).size.height *0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ModificationPage()));
                  },
                  child:
                  Container(
                  alignment: AlignmentGeometry.center,
                  height: MediaQuery.of(context).size.height *0.05,
                  width: MediaQuery.of(context).size.width *0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1)),
                      color: Colors.orange),
                  child: Text("MODIFIER COMPTE ",style: TextStyle(color: Colors.white,fontFamily: "Poppins"),),),
                ),
                  SizedBox(width: MediaQuery.of(context).size.width *0.06,),

                  GestureDetector(child: Container(
                    alignment: AlignmentGeometry.center,
                    height: MediaQuery.of(context).size.height *0.05,
                    width: MediaQuery.of(context).size.width *0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1)),
                        color: Colors.orange
                    ),
                    child: Text("DECONNEXION",style: TextStyle(color: Colors.white,fontFamily: "Poppins"),),)
                  )],)
          ],)
        ],
      ),)
    );
  }
}

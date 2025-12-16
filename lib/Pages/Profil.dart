import 'package:flutter/material.dart';

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
      body: Stack(
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
            Container(
              alignment: AlignmentDirectional.topStart,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.43),
              child: Text("PROFIL",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.1),),)
,
              SizedBox(height: MediaQuery.of(context).size.height *0.04,),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
  Text("NOM : ",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),
                SizedBox(width: MediaQuery.of(context).size.width *0.05,),

                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
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
                SizedBox(width: MediaQuery.of(context).size.width *0.05,),

                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1))
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1))
                        )
                    ),),
                  height: MediaQuery.of(context).size.height *0.06,width: MediaQuery.of(context).size.width *0.7,),


              ],),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(),
                  Container(
                    height: MediaQuery.of(context).size.height *0.065,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  ),
                  Container()
              ],)
          ],)
        ],
      ),
    );
  }
}

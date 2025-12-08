import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(child: Stack(children: [

        Column(children: [
          
          Container(width: MediaQuery.of(context).size.width *1,),
          //image de fond de kiyotaka's food
          Container(child: Image.asset("assets/images/kiyotaka image entreprise.png",height: MediaQuery.of(context).size.height *0.28,width: MediaQuery.of(context).size.width *0.65,),),
          //le mot "inscription"
          Container(child: Text("Inscription",style: TextStyle(fontSize: MediaQuery.of(context).size.width *0.1,color: Color(0xFF8B3E3B),fontFamily: "Poppins"),),),
//la ligne sous inscription
          Container(
  width: MediaQuery.of(context).size.width *0.5,

  decoration: BoxDecoration(border: Border.all(color: Color(0xFF8B3E3B),width:MediaQuery.of(context).size.height *0.002, )),),
         //espace
          SizedBox(height: MediaQuery.of(context).size.height *0.03,),
          //espace
          //contenaire de saisie du nom
          Container(

            decoration: BoxDecoration(


            ),
            width: MediaQuery.of(context).size.width *0.8,
            height: MediaQuery.of(context).size.height *0.065,
            child: TextFormField(

              decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.pen,size: MediaQuery.of(context).size.width *0.05,color: Color(0xFF8B3E3B),),
                  label: Text("NOM COMPLET ",style: TextStyle(fontFamily: "Poppins",),),

                  labelStyle: TextStyle(color: Color(0xFF8B3E3B)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                      borderSide: BorderSide(color: Color(0xFF8B3E3B))
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                      borderSide: BorderSide(color: Color(0xFF8B3E3B))
                  )
              ),
            ),

          ),
          SizedBox(height: MediaQuery.of(context).size.height *0.02,),
          //contenaire de saisie du numero
          Container(

            decoration: BoxDecoration(


            ),
            width: MediaQuery.of(context).size.width *0.8,
            height: MediaQuery.of(context).size.height *0.065,
            child: TextFormField(

              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.tag,size: MediaQuery.of(context).size.width *0.05,color: Color(0xFF8B3E3B),),
                  label: Text("NUMERO ",style: TextStyle(fontFamily: "Poppins",),),

                  labelStyle: TextStyle(color: Color(0xFF8B3E3B)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                      borderSide: BorderSide(color: Color(0xFF8B3E3B))
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                      borderSide: BorderSide(color: Color(0xFF8B3E3B))
                  )
              ),
            ),

          ),
          SizedBox(height: MediaQuery.of(context).size.height *0.02,),
          //contenaire de saisie du mot de passe
          Container(

            decoration: BoxDecoration(


            ),
            width: MediaQuery.of(context).size.width *0.8,
            height: MediaQuery.of(context).size.height *0.065,
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock,size: MediaQuery.of(context).size.width *0.05,color: Color(0xFF8B3E3B)),
                  label: Text("MOT DE PASSE ",style: TextStyle(fontFamily: "Poppins",),),

                  labelStyle: TextStyle(color: Color(0xFF8B3E3B)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                      borderSide: BorderSide(color: Color(0xFF8B3E3B))
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                      borderSide: BorderSide(color: Color(0xFF8B3E3B))
                  )
              ),
            ),

          ),
          SizedBox(height: MediaQuery.of(context).size.height *0.02,),
          //contenaire de confirmation du mot de passe
          Container(
decoration: BoxDecoration(


            ),
            width: MediaQuery.of(context).size.width *0.8,
            height: MediaQuery.of(context).size.height *0.065,
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.eye_fill,size: MediaQuery.of(context).size.width *0.05,color: Color(0xFF8B3E3B))),
                  prefixIcon: Icon(Icons.lock,size: MediaQuery.of(context).size.width *0.05,color: Color(0xFF8B3E3B)),
                  label: Text("CONFIRMER LE CODE",style: TextStyle(fontFamily: "Poppins",),),

                  labelStyle: TextStyle(color: Color(0xFF8B3E3B)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                      borderSide: BorderSide(color: Color(0xFF8B3E3B))
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                      borderSide: BorderSide(color: Color(0xFF8B3E3B))
                  )
              ),
            ),

          ),
          SizedBox(height: MediaQuery.of(context).size.height *0.02,),
          // les deux traits et le mot "assistance"
          Container(child: ElevatedButton(onPressed: (){}, child: Text("S'INSCRIRE",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: MediaQuery.of(context).size.width *0.04),),style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF8B3E3B)),),),
SizedBox(height: MediaQuery.of(context).size.height *0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Container(
              width: MediaQuery.of(context).size.width *0.25,
              decoration: BoxDecoration(border: Border.all(color:Color(0xFF8B3E3B) )),),
            Text("ASSISTANCE",style: TextStyle(fontFamily: "Poppins",color: Color(0xFF8B3E3B))),
            Container(
              width: MediaQuery.of(context).size.width *0.25,

              decoration: BoxDecoration(border: Border.all(color:Color(0xFF8B3E3B) )),)
          ],),
          SizedBox(height: MediaQuery.of(context).size.height *0.02,),
          //le contenaire contenant le logo et le mot  "whatsapp" 
          GestureDetector(
            onTap: (){

            },
              child: Container(height: MediaQuery.of(context).size.height *0.08,
                width: MediaQuery.of(context).size.width *0.5,
                decoration: BoxDecoration(color: Colors.green,borderRadius:BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.07))),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.whatsapp,color: Colors.white,size: MediaQuery.of(context).size.width *0.07,),
                    SizedBox(width: MediaQuery.of(context).size.width *0.02,),
                    Text("WHATSAPP ",style: TextStyle(color: Colors.white,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.05),)
                  ],),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.width *0.02,),
          Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Text("Deja un compte ? ",style: TextStyle(fontFamily: "Poppins"),),

            TextButton(onPressed: (){}, child:Text("SE CONNECTER",style: TextStyle(color: Color(0xFF8B3E3B),fontFamily: "Poppins"),)
            )
           ],),)

        ],),
        Container(

margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.23),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            CircleAvatar(radius: MediaQuery.of(context).size.width *0.04,backgroundColor: Colors.orange,),
            SizedBox(width: MediaQuery.of(context).size.width *0.04,),
              CircleAvatar(radius: MediaQuery.of(context).size.width *0.04,backgroundColor: Colors.orange.shade200,),
              SizedBox(width: MediaQuery.of(context).size.width *0.04,),

              CircleAvatar(radius: MediaQuery.of(context).size.width *0.04,backgroundColor: Colors.orange.shade100,),

          ],),
        )
      ],),)
    );
  }
}

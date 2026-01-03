import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class KiyotakaPage extends StatefulWidget {
  const KiyotakaPage({super.key});

  @override
  State<KiyotakaPage> createState() => _KiyotakaPageState();
}

Future <void> lancer_whatsapp() async{
  try {
    final url = Uri.parse("https://wa.me/2250789734299");
    var whatsapp = launchUrl(url,
        mode: LaunchMode.externalApplication);
  }catch(e){
    print("Probleme sur le lien pour aller vers numero whatsapp dans la page d'accueille");
  }
}

class _KiyotakaPageState extends State<KiyotakaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width *1,
              height: MediaQuery.of(context).size.height *0.45,
              child: Image.asset("assets/images/elysee.jpg",fit: BoxFit.cover,),
            ),
            Container(
                width: MediaQuery.of(context).size.width *1,
                height: MediaQuery.of(context).size.height *0.45,
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
            Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.037,left:MediaQuery.of(context).size.width *0.03 ),
                child: Row(
                  spacing: MediaQuery.of(context).size.width *0.04,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: AlignmentGeometry.center,
                        decoration: BoxDecoration(
                            color: Colors.white60,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.04))
                        ),
                        height: MediaQuery.of(context).size.height *0.06,
                        width: MediaQuery.of(context).size.height *0.06,

                        child: Icon(Icons.arrow_back,color: Colors.black,),),
                    ),
                    Container(
                        alignment: AlignmentGeometry.center,
                        height: MediaQuery.of(context).size.height *0.06,
                        width: MediaQuery.of(context).size.width *0.65,
                        decoration: BoxDecoration(color: Colors.white60,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.04))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.burger,color: Colors.black,),
                            SizedBox(width: MediaQuery.of(context).size.width *0.04,),
                            Text("KIYOTAKA'S FOOD",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.043),),

                          ],)),

                  ],
                ) ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.42),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("KIYOTAKA'S FOOD",style: TextStyle(fontFamily: "Poppins",fontSize:MediaQuery.of(context).size.width *0.06),),
                      Container(
                        width: MediaQuery.of(context).size.width *0.3,
                        decoration: BoxDecoration(border: Border.all(color: Colors.deepOrange)),)
                    ],),),
                SizedBox(height: MediaQuery.of(context).size.height *0.035,),
                Container(
                  child: Text("Salut, moi c'est Elysée, étudiant en TWIN 2, et bienvenue chez KIYOTAKA'S FOOD ! J'ai créé cette espace pour partager ma passion pour la bonne nourriture avec tout le monde. Que tu aies envie d'une crêpe gourmande ou d'un plat original , je m'assure que chaque bouchée soit préparée avec soin et des ingrédients frais",textAlign: TextAlign.center,style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.035),),),
                SizedBox(height: MediaQuery.of(context).size.height *0.06,),
                GestureDetector(
                    onTap: (){
lancer_whatsapp();
                    },
                    child: Container(
                        height: MediaQuery.of(context).size.height *0.07,
                        width: MediaQuery.of(context).size.width *0.5,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(
                                Radius.circular(MediaQuery.of(context).size.width *1))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.whatsapp,color: Colors.white,size:MediaQuery.of(context).size.width *0.07),
                            SizedBox(width: MediaQuery.of(context).size.width *0.04,),
                            Text("WHATSAPP",style: TextStyle(color: Colors.white,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),)
                          ],)))
              ],)
          ],
        ),
      ),
    );
  }
}

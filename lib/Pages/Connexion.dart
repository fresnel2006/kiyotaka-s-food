import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:kiyotaka_s_food/Pages/Acceuil.dart';
import 'package:kiyotaka_s_food/Pages/Inscription.dart';
import 'package:kiyotaka_s_food/Pages/Screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  //variable permettant de stocker des valeurs des saisies
  final numero=TextEditingController();
  final mot_de_passe=TextEditingController();

  //booleen permettant de donner des couleurs au bordure des champs de saisie
  bool couleur_bordure_numero=true;
  bool couleur_bordure_mot_de_passe=true;

  //fonction permettant de nous diriger vers le whatsapp de kyiyotaka's food
  Future <void> lancer_whatsapp ()async{
    try {
      final url = Uri.parse("https://wa.me/2250789734299");
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }catch(e){
      print("Erreur sur le lien vers le compte whatsapp dans la page de connexion");
    }
  }
  //fonctions permettant de faire afficher un message d'erreur
  void message_champs_vide(){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1),backgroundColor:Colors.transparent,content: Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height *0.1,
      width: MediaQuery.of(context).size.width *1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.04)),
          color: Colors.orange),
      child: ListTile(title: Text("CHAMP(S) VIDE(S)",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: MediaQuery.of(context).size.width *0.05),),subtitle: Text("VERIFIEZ LE(S) CHAMP(S)",style: TextStyle(color: Colors.white70,fontFamily: "Poppins"),),leading: Icon(Icons.dangerous_outlined,color: Colors.white,size: MediaQuery.of(context).size.width *0.1,),),

    )));
  }
  void message_numero_chiffre(){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1),backgroundColor:Colors.transparent,content: Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height *0.1,
      width: MediaQuery.of(context).size.width *1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.04)),
          color: Colors.orange),
      child: ListTile(title: Text("PROBLEME SUR NUMERO",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: MediaQuery.of(context).size.width *0.05),),subtitle: Text("VERIFIEZ LE NUMERO",style: TextStyle(color: Colors.white70,fontFamily: "Poppins"),),leading: Icon(Icons.dangerous_outlined,color: Colors.white,size: MediaQuery.of(context).size.width *0.1,),),

    )));
  }

  //fonction de verification des valeurs saisies
  void verification() async{
    if(numero.text.isEmpty||mot_de_passe.text.isEmpty||mot_de_passe.text.contains(" ")||numero.text.length!=10){
      if(numero.text.isEmpty||mot_de_passe.text.isEmpty){
        message_champs_vide();
      }else if(numero.text.isEmpty||numero.text.length!=10){
message_numero_chiffre();
      }
    }
    if(mot_de_passe.text.isNotEmpty&&!mot_de_passe.text.contains(" ")){
      setState(() {
        couleur_bordure_mot_de_passe=true;
      });
    }
    if(numero.text.length!=10||numero.text.isEmpty){
setState(() {
  couleur_bordure_numero=false;
});
    }
    if(numero.text.length==10){
      setState(() {
        couleur_bordure_numero=true;
      });
    }
    if(mot_de_passe.text.isEmpty||mot_de_passe.text.contains(" ")){
      setState(() {
        couleur_bordure_mot_de_passe=false;
      });
    }
    if(numero.text.length==10&&mot_de_passe.text.isNotEmpty&&!mot_de_passe.text.contains(" ")){
      setState(() {
        couleur_bordure_numero=true;
        couleur_bordure_mot_de_passe=true;
      });

      await reconnecter_utilisateur();
    }
  }
  void message_sur_utilisateur(){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1),backgroundColor:Colors.transparent,content: Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height *0.1,
      width: MediaQuery.of(context).size.width *1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.04)),
          color: Colors.orange),
      child: ListTile(title: Text("COMPTE NON-EXISTANT",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: MediaQuery.of(context).size.width *0.05),),subtitle: Text("VERIFIEZ LE NUMERO",style: TextStyle(color: Colors.white70,fontFamily: "Poppins"),),leading: Icon(Icons.dangerous_outlined,color: Colors.white,size: MediaQuery.of(context).size.width *0.1,),),

    )));
  }
  Future<void> sauvegarder_information_utilisateur(String nom,String numero) async{
    final prefs=await SharedPreferences.getInstance();
    prefs.setString("nom_utilisateur", nom);
    prefs.setString("numero_utilisateur", numero);
  }
Future<void> reconnecter_utilisateur()async{
    try{
      final url=Uri.parse("http://10.0.2.2:8000/reconnecter_utilisateur");
      final message=await http.post(url,headers: {"Content-Type":"application/json"}
      ,body: jsonEncode({
            "numero":numero.text,
            "mot_de_passe":mot_de_passe.text
          })
      );
      var data=jsonDecode(message.body);
      if(data["resultat"]=="existe pas"){
message_sur_utilisateur();
      }else{
      await sauvegarder_information_utilisateur(data["resultat"][0][0],data["resultat"][0][1]);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ScreenPage()), (route)=>false);
      }
    }catch(e){
print("erreur niveau reconnexion de l'utilisateur");
    }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF632B23),
      body: Stack(children: [
        Column(
          children: [
          Container(width: MediaQuery.of(context).size.width *1,),

            //image de fond de kiyotaka
            Container(child: Image.asset("assets/images/kiyotaka image 2 entreprise.png",height: MediaQuery.of(context).size.height *0.28,width: MediaQuery.of(context).size.width *0.65,),),
          //widget contenant le "mot"
            Container(child: Text("Connexion",style: TextStyle(fontSize: MediaQuery.of(context).size.width *0.1,color: Colors.white,fontFamily: "Poppins"),),),
          Container(
            width: MediaQuery.of(context).size.width *0.5,
            decoration: BoxDecoration(border: Border.all(color: Colors.white,width:MediaQuery.of(context).size.height *0.002, )),),
          //espace
          SizedBox(height: MediaQuery.of(context).size.height *0.04,),
          //espace
          //contenaire de saisie du numero
          Container(

            decoration: BoxDecoration(
            ),
            width: MediaQuery.of(context).size.width *0.8,
            height: MediaQuery.of(context).size.height *0.065,
            child: TextFormField(
              controller: numero,
              cursorColor: Colors.white,

              style: TextStyle(fontFamily: "Poppins",color:Colors.white ),

              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.tag,size: MediaQuery.of(context).size.width *0.05,color: couleur_bordure_numero?Colors.white:Colors.red,),
                  label: Text("NUMERO ",style: TextStyle(fontFamily: "Poppins",),),

                  labelStyle: TextStyle(color: couleur_bordure_numero?Colors.white:Colors.red),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                      borderSide: BorderSide(color: couleur_bordure_numero?Colors.white:Colors.red)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                      borderSide: BorderSide(color: couleur_bordure_numero?Colors.white:Colors.red)
                  )
              ),
            ),

          ),SizedBox(height: MediaQuery.of(context).size.height *0.02,),
          //espace
          //contenaire de saisie du mot de passe
          Container(

            decoration: BoxDecoration(


            ),
            width: MediaQuery.of(context).size.width *0.8,
            height: MediaQuery.of(context).size.height *0.065,
            child: TextFormField(
              controller: mot_de_passe,
              cursorColor: Colors.white,
              style: TextStyle(fontFamily: "Poppins",color:Colors.white ),

              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock,size: MediaQuery.of(context).size.width *0.05,color: couleur_bordure_mot_de_passe?Colors.white:Colors.red),
                  label: Text("MOT DE PASSE ",style: TextStyle(fontFamily: "Poppins",),),

                  labelStyle: TextStyle(color: couleur_bordure_mot_de_passe?Colors.white:Colors.red),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                      borderSide: BorderSide(color: couleur_bordure_mot_de_passe?Colors.white:Colors.red)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                      borderSide: BorderSide(color: couleur_bordure_mot_de_passe?Colors.white:Colors.red)
                  )
              ),
            ),

          ),SizedBox(height: MediaQuery.of(context).size.height *0.02,),
          //espace
          // les deux traits et le mot "assistance"
          Container(child: ElevatedButton(onPressed: (){

verification();
          }, child: Text("SE CONNECTER",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: MediaQuery.of(context).size.width *0.04),),style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF8B3E3B)),),),
          SizedBox(height: MediaQuery.of(context).size.height *0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width *0.25,
                decoration: BoxDecoration(border: Border.all(color:Colors.white70 )),),
              Text("ASSISTANCE",style: TextStyle(fontFamily: "Poppins",color: Colors.white70)),
              Container(
                width: MediaQuery.of(context).size.width *0.25,

                decoration: BoxDecoration(border: Border.all(color:Colors.white70)),)
            ],),
          //espace
          SizedBox(height: MediaQuery.of(context).size.height *0.02,),
          //espace
          //le contenaire contenant le logo et le mot  "whatsapp"
          GestureDetector(
              onTap: ()async{
                await lancer_whatsapp();
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
          //espace
          SizedBox(height: MediaQuery.of(context).size.width *0.02,),
          //espace
            //widget renfermant une option de reconnexion
          Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Deja un compte ? ",style: TextStyle(fontFamily: "Poppins",color: Colors.white60),),

                TextButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder:(context)=>InscriptionPage()));
                }, child:Text("S'INSCRIRE",style: TextStyle(color: Colors.white,fontFamily: "Poppins"),)
                )
              ],),)

        ],)
      ],),

    );
  }
}

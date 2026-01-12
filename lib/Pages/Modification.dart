import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:kiyotaka_s_food/Pages/MainScreen.dart';
import 'package:kiyotaka_s_food/Pages/Screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ModificationPage extends StatefulWidget {
  const ModificationPage({super.key});

  @override
  State<ModificationPage> createState() => _ModificationPageState();
}

class _ModificationPageState extends State<ModificationPage> {
  //varible permettant de stocker des valeurs des saisies
  final nom_complet=TextEditingController();
  final numero=TextEditingController();
  final mot_de_passe=TextEditingController();
  final confirmation_mot_de_passe=TextEditingController();

  //booleen permettant de donner des couleurs au bordure des champs de saisie
  bool couleur_bordure_nom=true;
  bool couleur_bordure_numero=true;
  bool couleur_bordure_mot_de_passe=true;
  bool couleur_bordure_champs_confirmation=true;

  //booleen permettant de faire afficher le mot de passe
  bool afficher_mot_de_passe=true;


  //fonctions permettant de faire afficher un message d'erreur
  void message_champ_vide(){
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
  void message_champs_espace(){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1),backgroundColor:Colors.transparent,content: Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height *0.1,
      width: MediaQuery.of(context).size.width *1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.04)),
          color: Colors.orange),
      child: ListTile(title: Text("PAS D'ESPACE",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: MediaQuery.of(context).size.width *0.05),),subtitle: Text("VERIFIEZ LE CODE",style: TextStyle(color: Colors.white70,fontFamily: "Poppins"),),leading: Icon(Icons.dangerous_outlined,color: Colors.white,size: MediaQuery.of(context).size.width *0.1,),),

    )));
  }
  //fonction de verification des valeurs des champs de saisie
  void verification()async{
    if(nom_complet.text.isEmpty||nom_complet.text.trim().isEmpty||mot_de_passe.text.isEmpty){
      message_champ_vide();
    }
    if(nom_complet.text.isEmpty||nom_complet.text.trim().isEmpty){
      setState(() {
        couleur_bordure_nom=false;
      });
    }


    if(mot_de_passe.text.isEmpty||mot_de_passe.text.contains(" ")){
      setState(() {
        couleur_bordure_mot_de_passe=false;
      });
    }
    if(mot_de_passe.text.contains(" ")){
      message_champs_espace();
    }

    if(nom_complet.text.isNotEmpty&&nom_complet.text.trim().isNotEmpty){
      setState(() {
        couleur_bordure_nom=true;
      });
    }

    if(mot_de_passe.text.isNotEmpty&&!mot_de_passe.text.contains(" ")){
      setState(() {
        couleur_bordure_mot_de_passe=true;
      });
    }
    if(mot_de_passe.text.isNotEmpty&&!mot_de_passe.text.contains(" ")&&nom_complet.text.isNotEmpty&&nom_complet.text.trim().isNotEmpty){
        deuxieme_saisie_mot_de_passe();
    }
  }

  void deuxieme_saisie_mot_de_passe(){
    showModalBottomSheet(backgroundColor: Colors.transparent,context: context, builder: (context)=>SingleChildScrollView(
        child: Container(
      height: MediaQuery.of(context).size.height *0.35,
      width: MediaQuery.of(context).size.width *1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(MediaQuery.of(context).size.width *0.1),topLeft: Radius.circular(MediaQuery.of(context).size.width *0.1))
      ),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height *0.04,),
          Text("Saisissez encore le mot de passe ",style: TextStyle(color:Color(0xFF8B3E3B),fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),
          SizedBox(height: MediaQuery.of(context).size.height *0.03,),
          Container(
            width: MediaQuery.of(context).size.width *0.8,
            child: TextFormField(

            controller: confirmation_mot_de_passe,
            cursorColor: Color(0xFF8B3E3B),
            style: TextStyle(fontFamily: "Poppins",color:Color(0xFF8B3E3B) ),

            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock,size: MediaQuery.of(context).size.width *0.05,color: couleur_bordure_champs_confirmation?Color(0xFF8B3E3B):Colors.red),
                label: Text("CONFIRMER",style: TextStyle(fontFamily: "Poppins",),),

                labelStyle: TextStyle(color: couleur_bordure_champs_confirmation?Color(0xFF8B3E3B):Colors.red),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                    borderSide: BorderSide(color: couleur_bordure_champs_confirmation?Color(0xFF8B3E3B):Colors.red)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                    borderSide: BorderSide(color: couleur_bordure_champs_confirmation?Color(0xFF8B3E3B):Colors.red)
                )
            ),
          ),),
          SizedBox(height: MediaQuery.of(context).size.height *0.03,),

          Container(child: ElevatedButton(onPressed: (){
            if(mot_de_passe.text==confirmation_mot_de_passe.text){
              modifier_compte();
            }else{
                Navigator.pop(context);
                message_sur_mot_de_passe();
            }
          }, child: Text("VALIDER",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: MediaQuery.of(context).size.width *0.04),),style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF8B3E3B)),),),
        ],
      ),)
    ));
  }
  void message_sur_mot_de_passe(){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1),backgroundColor:Colors.transparent,content: Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height *0.1,
      width: MediaQuery.of(context).size.width *1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.04)),
          color: Colors.orange),
      child: ListTile(title: Text("ERREUR SUR MOT DE PASSE",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: MediaQuery.of(context).size.width *0.05),),subtitle: Text("VERIFIEZ LE MOT DE PASSE",style: TextStyle(color: Colors.white70,fontFamily: "Poppins"),),leading: Icon(Icons.dangerous_outlined,color: Colors.white,size: MediaQuery.of(context).size.width *0.1,),),
    )));
  }
  void message_sur_modification(){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1),backgroundColor:Colors.transparent,content: Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height *0.1,
      width: MediaQuery.of(context).size.width *1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.04)),
          color: Colors.green),
      child: ListTile(title: Text("MODIFICATIONS AJOUTEES",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: MediaQuery.of(context).size.width *0.05),),subtitle: Text("MERCI !",style: TextStyle(color: Colors.white70,fontFamily: "Poppins"),),leading: Icon(Icons.check_circle,color: Colors.white,size: MediaQuery.of(context).size.width *0.1,),),
    )));
  }

  Future<void>modifier_compte() async{
    final url = Uri.parse("http://10.0.2.2:8000/modifier_utilisateur");
    var message = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "nom": nom_complet.text,
          "mot_de_passe": mot_de_passe.text,
          "numero_utilisation":numero_utilisation
        })
    );

    var data=jsonDecode(message.body);
    if(data["resultat"]=="modifications ajoutées"){
      sauvegarder_information_utilisateur();
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ScreenPage()), (route)=>false);
      message_sur_modification();
    }
  }



  Future<void> sauvegarder_information_utilisateur() async{
    final prefs=await SharedPreferences.getInstance();
    prefs.setString("nom_utilisateur", nom_complet.text);
  }
  var numero_utilisation;
  void charger_donnee() async{
    final prefs=await SharedPreferences.getInstance();
    setState(() {
      numero_utilisation=prefs.getString("numero_utilisateur");
    });

  }
  @override
  void initState(){
    super.initState();
    charger_donnee();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
body: SingleChildScrollView(
  child: Column(
  children: [
    Container(width: MediaQuery.of(context).size.width *1,),
    //image de fond de kiyotaka's food
    Container(child: Lottie.asset("assets/animations/chef.json",height: MediaQuery.of(context).size.height *0.28,width: MediaQuery.of(context).size.width *0.65,),),
    //le mot "inscription"
    Container(child: Text("Modification",style: TextStyle(fontSize: MediaQuery.of(context).size.width *0.1,color: Color(0xFF8B3E3B),fontFamily: "Poppins"),),),
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
        controller: nom_complet,
        cursorColor: Color(0xFF8B3E3B),
        style: TextStyle(fontFamily: "Poppins",color:Color(0xFF8B3E3B) ),
        decoration: InputDecoration(
            prefixIcon: Icon(CupertinoIcons.pen,size: MediaQuery.of(context).size.width *0.05,color: couleur_bordure_nom?Color(0xFF8B3E3B):Colors.red,),
            hint: Text("NOM COMPLET ",style: TextStyle(fontFamily: "Poppins",color: couleur_bordure_nom?Color(0xFF8B3E3B):Colors.red),),


            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                borderSide: BorderSide(color: couleur_bordure_nom?Color(0xFF8B3E3B):Colors.red)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                borderSide: BorderSide(color: couleur_bordure_nom?Color(0xFF8B3E3B):Colors.red)
            )
        ),
      ),

    ),
    //espace
    SizedBox(height: MediaQuery.of(context).size.height *0.02,),
    //espace
    //contenaire de saisie du numero


    //contenaire de saisie du mot de passe
    Container(

      decoration: BoxDecoration(


      ),
      width: MediaQuery.of(context).size.width *0.8,
      height: MediaQuery.of(context).size.height *0.065,
      child: TextFormField(
        controller: mot_de_passe,
        cursorColor: Color(0xFF8B3E3B),
        style: TextStyle(fontFamily: "Poppins",color:Color(0xFF8B3E3B) ),

        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock,size: MediaQuery.of(context).size.width *0.05,color: couleur_bordure_mot_de_passe?Color(0xFF8B3E3B):Colors.red),
            hint: Text("NOUVEAU MOT DE PASSE ",style: TextStyle(fontFamily: "Poppins",color: couleur_bordure_mot_de_passe?Color(0xFF8B3E3B):Colors.red),),

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                borderSide: BorderSide(color: couleur_bordure_mot_de_passe?Color(0xFF8B3E3B):Colors.red)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                borderSide: BorderSide(color: couleur_bordure_mot_de_passe?Color(0xFF8B3E3B):Colors.red)
            )
        ),
      ),

    ),
    SizedBox(height: MediaQuery.of(context).size.height *0.04,),
    //espace
    // les deux traits et le mot "assistance"
    Container(child: ElevatedButton(onPressed: (){
      verification();

    }, child: Text("SOUMETTRE",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: MediaQuery.of(context).size.width *0.04),),style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF8B3E3B)),),),
    SizedBox(height: MediaQuery.of(context).size.height *0.02,),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: MediaQuery.of(context).size.width *0.25,
          decoration: BoxDecoration(border: Border.all(color:Color(0xFF8B3E3B) )),),
        Text("PLUS BESOIN ?",style: TextStyle(fontFamily: "Poppins",color: Color(0xFF8B3E3B))),
        Container(
          width: MediaQuery.of(context).size.width *0.25,

          decoration: BoxDecoration(border: Border.all(color:Color(0xFF8B3E3B) )),)
      ],),
    SizedBox(height: MediaQuery.of(context).size.height *0.04,),
    GestureDetector(
        onTap: () async{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenPage()));
        },
        child: Container(height: MediaQuery.of(context).size.height *0.08,
          width: MediaQuery.of(context).size.width *0.5,
          decoration: BoxDecoration(color: Color(0xFF8B3E3B),borderRadius:BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.07))),

          //widget renfermant une option de reconnexion

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home_filled,color: Colors.white,size: MediaQuery.of(context).size.width *0.07,),
              SizedBox(width: MediaQuery.of(context).size.width *0.02,),
              Text("RETOUR \nA L'ACCUEUIL",style: TextStyle(color: Colors.white,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.035),)
            ],),
        )
    )

  ],),),

    );
  }
}

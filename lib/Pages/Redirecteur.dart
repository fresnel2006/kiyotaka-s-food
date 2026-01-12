import 'package:flutter/material.dart';
import 'package:kiyotaka_s_food/Pages/Inscription.dart';
import 'package:kiyotaka_s_food/Pages/Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RedirecteurPage extends StatefulWidget {
  const RedirecteurPage({super.key});

  @override
  State<RedirecteurPage> createState() => _RedirecteurPageState();
}

class _RedirecteurPageState extends State<RedirecteurPage> {
  void redirection() async{
    final prefs=await SharedPreferences.getInstance();
    String nom=prefs.getString("nom_utilisateur")??"vide";
    String numero=prefs.getString("numero_utilisateur")??"vide";
    if(nom=="vide" && numero=="vide"){

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>InscriptionPage()), (route)=>false);
    }else{
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ScreenPage()), (route)=>false);
    }
  }
  @override
  void initState(){
    super.initState();
    redirection();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF632B23),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            Image.asset("assets/images/kiyotaka image 2 entreprise.png",height: MediaQuery.of(context).size.height *0.7,width: MediaQuery.of(context).size.width *1,)
            ,Text("CHARGEMENT...",style: TextStyle(color: Colors.white,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.045),)
          ],),
        ),
      ),
    );
  }
}

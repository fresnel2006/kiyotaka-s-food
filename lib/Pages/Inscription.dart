import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiyotaka_s_food/Pages/Connexion.dart';
import 'package:url_launcher/url_launcher.dart';


class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {

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

  //fonction permettant de nous diriger vers le whatsapp de kyiyotaka's food
  Future <void> lancer_whatsapp ()async{
    try {
      final url = Uri.parse("https://wa.me/2250789734299");
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }catch(e){
      print("Erreur sur le lien vers le compte whatsapp");
    }
    }
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
      if(nom_complet.text.isEmpty||nom_complet.text.trim().isEmpty||numero.text.isEmpty||mot_de_passe.text.isEmpty||confirmation_mot_de_passe.text.isEmpty||numero.text.length!=10){
        if(nom_complet.text.isEmpty|| nom_complet.text.trim().isEmpty||mot_de_passe.text.isEmpty||confirmation_mot_de_passe.text.isEmpty){
          message_champ_vide();
        }
        else if(numero.text.length!=10){
          setState(() {
            couleur_bordure_numero=false;
          });
          message_numero_chiffre();
        }
      }
    if(nom_complet.text.isEmpty||nom_complet.text.trim().isEmpty){
        setState(() {
          couleur_bordure_nom=false;
        });
      }
      if(numero.text.isEmpty){
        setState(() {
          couleur_bordure_numero=false;
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
      if(confirmation_mot_de_passe.text.isEmpty||confirmation_mot_de_passe.text!=mot_de_passe.text||confirmation_mot_de_passe.text.contains(" ")){
        setState(() {
          couleur_bordure_champs_confirmation=false;
        });
      }
      if(nom_complet.text.isNotEmpty&&nom_complet.text.trim().isNotEmpty){
        setState(() {
          couleur_bordure_nom=true;
        });
      }
      if(numero.text.length==10){
        setState(() {
          couleur_bordure_numero=true;
        });
      }
      if(mot_de_passe.text.isNotEmpty&&!mot_de_passe.text.contains(" ")){
        setState(() {
          couleur_bordure_mot_de_passe=true;
        });
      }
      if(confirmation_mot_de_passe.text.isNotEmpty&&confirmation_mot_de_passe.text==mot_de_passe.text){
        setState(() {
          couleur_bordure_champs_confirmation=true;
        });
      }
    }
    //fonction pour afficher le mot de passe
void affichermotdepasse(){
    setState(() {
      afficher_mot_de_passe=!afficher_mot_de_passe;
    });
}
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
              controller: nom_complet,
              cursorColor: Color(0xFF8B3E3B),
              style: TextStyle(fontFamily: "Poppins",color:Color(0xFF8B3E3B) ),
              decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.pen,size: MediaQuery.of(context).size.width *0.05,color: couleur_bordure_nom?Color(0xFF8B3E3B):Colors.red,),
                  label: Text("NOM COMPLET ",style: TextStyle(fontFamily: "Poppins",),),

                  labelStyle: TextStyle(color: couleur_bordure_nom?Color(0xFF8B3E3B):Colors.red),
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
          Container(

            decoration: BoxDecoration(


            ),
            width: MediaQuery.of(context).size.width *0.8,
            height: MediaQuery.of(context).size.height *0.065,
            child: TextFormField(
              controller: numero,
              cursorColor: Color(0xFF8B3E3B),

              style: TextStyle(fontFamily: "Poppins",color:Color(0xFF8B3E3B) ),

              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.tag,size: MediaQuery.of(context).size.width *0.05,color: couleur_bordure_numero?Color(0xFF8B3E3B):Colors.red,),
                  label: Text("NUMERO ",style: TextStyle(fontFamily: "Poppins",),),

                  labelStyle: TextStyle(color: couleur_bordure_numero?Color(0xFF8B3E3B):Colors.red),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                      borderSide: BorderSide(color: couleur_bordure_numero?Color(0xFF8B3E3B):Colors.red)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
                      borderSide: BorderSide(color: couleur_bordure_numero?Color(0xFF8B3E3B):Colors.red)
                  )
              ),
            ),

          ),
          //espace
          SizedBox(height: MediaQuery.of(context).size.height *0.02,),
          //espace
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
                  label: Text("MOT DE PASSE ",style: TextStyle(fontFamily: "Poppins",),),

                  labelStyle: TextStyle(color: couleur_bordure_mot_de_passe?Color(0xFF8B3E3B):Colors.red),
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
          //espace
          SizedBox(height: MediaQuery.of(context).size.height *0.02,),
          //espace
          //contenaire de confirmation du mot de passe
          Container(
decoration: BoxDecoration(


            ),
            width: MediaQuery.of(context).size.width *0.8,
            height: MediaQuery.of(context).size.height *0.065,
            child: TextFormField(
              obscureText: afficher_mot_de_passe,
              controller: confirmation_mot_de_passe,
              cursorColor: Color(0xFF8B3E3B),
              style: TextStyle(fontFamily: "Poppins",color:Color(0xFF8B3E3B) ),

              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: (){
                  affichermotdepasse();

                }, icon: Icon(afficher_mot_de_passe?CupertinoIcons.eye_fill:CupertinoIcons.eye_slash_fill,size: MediaQuery.of(context).size.width *0.05,color: Color(0xFF8B3E3B))),
                  prefixIcon: Icon(Icons.lock,size: MediaQuery.of(context).size.width *0.05,color: couleur_bordure_champs_confirmation?Color(0xFF8B3E3B):Colors.red),
                  label: Text("CONFIRMER LE CODE",style: TextStyle(fontFamily: "Poppins",),),

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
            ),

          ),
          //espace
          SizedBox(height: MediaQuery.of(context).size.height *0.02,),
          //espace
          // les deux traits et le mot "assistance"
          Container(child: ElevatedButton(onPressed: (){
            verification();

          }, child: Text("S'INSCRIRE",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: MediaQuery.of(context).size.width *0.04),),style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF8B3E3B)),),),
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

                //widget renfermant une option de reconnexion

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
          Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Text("Deja un compte ? ",style: TextStyle(fontFamily: "Poppins"),),

            TextButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>ConnexionPage()));
            }, child:Text("SE CONNECTER",style: TextStyle(color: Color(0xFF8B3E3B),fontFamily: "Poppins"),)
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiyotaka_s_food/Pages/Inscription.dart';
import 'package:kiyotaka_s_food/Pages/Modification.dart';
import 'package:kiyotaka_s_food/Pages/Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}
class _ProfilPageState extends State<ProfilPage> {
  var nom;
  var numero;
List<String>titre_favoris=[];
  void charger_donnee() async{
    final prefs=await SharedPreferences.getInstance();
    setState(() {
      nom=prefs.getString("nom_utilisateur");
      numero=prefs.getString("numero_utilisateur");
    });
print(nom);
print(numero);
  }
  Future <void> charger_produit_favoris()async{
    try {
      final perfs = await SharedPreferences.getInstance();
      setState(() {
        titre_favoris= perfs.getStringList("titre_favoris")??[];
      });
      print(titre_favoris);

    }catch(e){
      print(e);
    }
  }
  @override
  void initState(){
    super.initState();
    charger_produit_favoris();
    charger_donnee();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
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
                      hintText: "$nom",
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
                        hintText: "$numero",
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
                    child:titre_favoris==0?Text("0",style: TextStyle(fontFamily: "Poppins"),):Text("NOMBRE DE PRODUIT : ${titre_favoris.length}",style: TextStyle(fontFamily: "Poppins")),)
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
                  GestureDetector(
                      child: Container(
                    alignment: AlignmentGeometry.center,
                    height: MediaQuery.of(context).size.height *0.05,
                    width: MediaQuery.of(context).size.width *0.4,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1)),
                        color: Colors.white
                    ),
                    child: Text("DECONNEXION",style: TextStyle(color: Colors.orange,fontFamily: "Poppins"),),)
                  )],)
          ],)
        ],
      ),)
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiyotaka_s_food/Pages/Produit.dart';
import 'package:kiyotaka_s_food/Pages/Screen.dart';
import 'package:kiyotaka_s_food/main.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PanierPage extends StatefulWidget {
  const PanierPage({super.key});

  @override
  State<PanierPage> createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {

  var nom;
  var numero;
  List reponse=[];

  void charger_donnee() async{
    final prefs=await SharedPreferences.getInstance();
    setState(() {
      nom=prefs.getString("nom_utilisateur");
      numero=prefs.getString("numero_utilisateur");
    });
    await charger_commande_utilisateur();
    print(nom);
    print(numero);
  }

  Future <void> charger_commande_utilisateur() async{
    try{
setState(() {
  reponse = supabase
      .from('commandes')
      .select("*")
      .eq("numero", numero) as List<dynamic>;
});

  print(reponse);




    }catch(e){
      print("erreur niveau de la commande");
    }
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
      body: SingleChildScrollView(child: Stack(
        children: [
          Column(
            children: [
              Container(width: MediaQuery.of(context).size.width *1),
              Container(child: reponse.isNotEmpty?Image.asset("assets/images/kiyotaka image entreprise.png",height: MediaQuery.of(context).size.height *0.4,width: MediaQuery.of(context).size.width *1,):Text(""),),

            ],),
          Column(
            children: [
              reponse.isNotEmpty?SizedBox(height: MediaQuery.of(context).size.height *0.33,):SizedBox(height: MediaQuery.of(context).size.height *0.06,),
              reponse.isNotEmpty?Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width *0.3,
                    height: MediaQuery.of(context).size.height *0.0015,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  ),
                  Container(

                    child: Column(
                      children: [
                        Text("Panier",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04,color: Colors.orange),),

                      ],
                    ),
                  ),
                  Container(width: MediaQuery.of(context).size.width *0.3,
                    height: MediaQuery.of(context).size.height *0.0015,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  )
                ],):Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.1),
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Text("PANIER",style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.07),),
                    Container(
                      width: MediaQuery.of(context).size.width *0.26,
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.orange,width: MediaQuery.of(context).size.width *0.01))),)
                  ],
                ),
              ),

              reponse.isEmpty?SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height *0.1),
                      Container(
                        height: MediaQuery.of(context).size.height *0.25,
                        child: Lottie.asset("assets/animations/chef.json"),),
                      SizedBox(height: MediaQuery.of(context).size.height *0),
                      Container(child: Text("AUCUNE COMMANDE\nCOMMANDE UN PLAT",textAlign: TextAlign.center,style: TextStyle(fontFamily: "Poppins",color: Colors.black,fontSize: MediaQuery.of(context).size.width *0.035),),),
                      SizedBox(height: MediaQuery.of(context).size.height *0.03),

                      Container(child:ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenPage()));
                      }, child: Text("COMMANDER",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: MediaQuery.of(context).size.width *0.035)),style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent),) ,)
                    ],
                  )

              ):Container(
                height: MediaQuery.of(context).size.height *0.6,
                child:ListView.builder(itemCount: reponse.length,itemBuilder: (context, index) => GestureDetector(

    child: Container(
    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height *0.012,
    left: MediaQuery.of(context).size.width *0.02),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(
    alignment: Alignment.center,
    height:MediaQuery.of(context).size.height *0.1,
    width: MediaQuery.of(context).size.height *0.07,
    child: Icon(FontAwesomeIcons.burger,color: Colors.orange,size: MediaQuery.of(context).size.width *0.08,),
    ),
    SizedBox(width: MediaQuery.of(context).size.width *0.06,),
    Column(
    children: [
    Container(
    width: MediaQuery.of(context).size.width *0.5,
    child: Text("${reponse[0][index]}\nPRIX : ",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.035),),
    ),
    Container(
    width: MediaQuery.of(context).size.width *0.5,
    alignment: AlignmentDirectional.topStart,
    child:Text("{prix_panier[index]} x {quantite_panier[index]}  FCFA ",style:TextStyle(fontFamily: "Poppins",color: Colors.orange,fontSize: MediaQuery.of(context).size.width *0.04) ,),
    ),

    Container(
    width: MediaQuery.of(context).size.width *0.5,
    child:Text("{date_panier[index].substring(0,19)}",style:TextStyle(fontFamily: "Poppins",color: Colors.orange,fontSize: MediaQuery.of(context).size.width *0.04) ,),
    )



    ],

    )

    ],),),),),)
    
            ],)
        ],)));
  }
}

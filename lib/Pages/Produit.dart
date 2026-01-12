import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart' as http;
import 'package:kiyotaka_s_food/Pages/Screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/animation.dart';

class ProduitPage extends StatefulWidget {
  ProduitPage({super.key, required this.index});
var index;
  @override
  State<ProduitPage> createState() => _ProduitPageState();
}

List<String> image_favoris=[];
List<String> titre_favoris=[];
List<String> prix_favoris=[];
List<String> image_panier=[];
List<String> titre_panier=[];
List<String> prix_panier=[];
List<String> date_panier=[];
List<String> quantite_panier=[];

int index_fonction=0;


class _ProduitPageState extends State<ProduitPage> {
  String numero="vide";
  String nom="vide";

  int quantite=1;

  bool coeur=false;
  var images=["assets/images/Thiéboudiène sénégalais _ la recette de Marc Dufumier.jpg","assets/images/Splash photography on Behance.jpg","assets/images/Attieke à la dorade royale (Côte d'Ivoire) - La tendresse en cuisine.jpg","assets/images/empiler de crêpe avec Chocolat bruine.jpg","assets/images/eau.jpg","assets/images/crepes ceralac.jpg","assets/images/empiler de crêpe avec Chocolat bruine.jpg","assets/images/crepes fromage.jpg","assets/images/Crêpes au yaourt.jpg","assets/images/Gözleme - Crêpes turques fourrées à la viande hachée.jpg","assets/images/Crystal-Cool Sprite – Refreshment Captured in every sip.jpg","assets/images/Picture of MOSCOW, RUSSIA-APRIL 4, 2014_ Can of….jpg","assets/images/Orangina reviews ratings & information - Bev Rank.jpg","assets/images/tchepe poulet.jpg",""];
  var titre=["TCHÊPE POISSON","COCA-COLA","GARBA","CRÊPES CHOCOLAT","EAU","CRÊPES AU CERELAC","CRÊPES AU CHOCOLAT","CRÊPES JAMBON","CRÊPES NATURE","CRÊPES BOEUF HACHE","SPRIT","FANTA","ORANGINA","TCHÊPE POULET","BOUTEILLE DE GARI"];
  var prix=[1000,500,1000,2000,200,2000-1000,2000-1000,3500,1000,4000,500,500,500,1000,500,500];

  var prix_produit;
  void reduction_augmentation_prix(){
    if (widget.index==0||widget.index==2){
      setState(() {
        prix_produit=1000;
      });
    }
    else if(widget.index==5||widget.index==6){
      setState(() {
        prix_produit=2000;
      });
    }

    else if (widget.index==1||widget.index==11||widget.index==10||widget.index==12){
      setState(() {
        prix_produit=500;
      });
    }
    else if(widget.index==7){
      setState(() {
        prix_produit=3500;
      });
    }
    else if(widget.index==4){
      setState(() {
        prix_produit=200;
      });
    }
    else if (widget.index==9){
      setState(() {
        prix_produit=4000;
      });
    }
    else if (widget.index==14){
      setState(() {
        prix_produit=500;
      });
    }
    else{
      setState(() {
        prix_produit=1000;
      });
    }

  }

  Future <void> sauvegarder_produit_favoris()async{
      final perfs = await SharedPreferences.getInstance();
      await perfs.setStringList("image_favoris", image_favoris);
      await perfs.setStringList("titre_favoris", titre_favoris);
      await perfs.setStringList("prix_favoris", prix_favoris);
  }
  Future <void> charger_donnee_produit() async{
    final perfs = await SharedPreferences.getInstance();
    setState(() {
      image_favoris=perfs.getStringList("image_favoris")??[];
      titre_favoris=perfs.getStringList("titre_favoris")??[];
      prix_favoris=perfs.getStringList("prix_favoris")??[];
    });
  }
  Future <void> ajouter_coeur()async{
    if(image_favoris.contains(images[widget.index])){
      setState(() {
        coeur=true;
      });
    };
  }

  Future <void> commande() async {

    showModalBottomSheet(backgroundColor: Colors.transparent,context: context, builder: (context)=>SingleChildScrollView(child: Stack(children: [
      Container(
          width: MediaQuery.of(context).size.width *1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(MediaQuery.of(context).size.width *0.04,),topRight: Radius.circular(MediaQuery.of(context).size.width *0.04,),),),
          height: MediaQuery.of(context).size.height *0.7,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height *0.06,),
              Lottie.asset("assets/animations/chef.json",height: MediaQuery.of(context).size.height *0.25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("QUANTITE : ",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.05)),
                  ),

                  Container(
                    child:    Text("X ${quantite}",style: TextStyle(fontFamily: "Poppins",color: Colors.deepOrange,fontSize: MediaQuery.of(context).size.width *0.05),)
                    ,)
                ],),
              SizedBox(height: MediaQuery.of(context).size.height *0.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("PRIX : ",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.05)),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width *0.15,),
                  Container(
                    height: MediaQuery.of(context).size.height *0.06,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.black)
                    ),),
                  SizedBox(width: MediaQuery.of(context).size.width *0.1,),
                  Container(
                    child:  Text("${prix_produit} FCFA",style: TextStyle(fontFamily: "Poppins",color: Colors.deepOrange,fontSize: MediaQuery.of(context).size.width *0.05),)
                    ,),

                ],),
              SizedBox(height: MediaQuery.of(context).size.height *0.03,),
              Container(
                width: MediaQuery.of(context).size.width *0.55,
                height: MediaQuery.of(context).size.height *0.06,
                child: ElevatedButton(onPressed: (){
              commander_nourriture();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ScreenPage()), (route)=>false);

}, child: Text("VALIDER",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: MediaQuery.of(context).size.width *0.05),),style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),),)
            ],)),
      Column(children: [
        Container(width: MediaQuery.of(context).size.width *1,),
        Container(
          width: MediaQuery.of(context).size.width *1,
        ),
        SizedBox(height: MediaQuery.of(context).size.height *0.03,),
        Text("${titre[widget.index]}",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.06,color: Colors.green),),

      ],)
    ],)));
  }
  Future<void> commander_nourriture()async{
    final url=Uri.parse("http://10.0.2.2:8000/enregistrer_commande");
    var message=await http.post(url,headers: {"Content-Type":"application/json"},
    body: jsonEncode({
      "numero":numero,
      "quantite":quantite.toString(),
      "produit":titre[widget.index],
      "nom":nom,
      "prix_produit":prix_produit.toString(),
    }));

    var data=jsonDecode(message.body);
    print(data);
    if(data["resultat"]=="trop de requette petit hacker"){
      message_sur_trop_de_commande();
      return;
    }else{
    setState(() {
      image_panier.add(images[widget.index]);
      titre_panier.add(titre[widget.index]);
      prix_panier.add(prix_produit.toString());
      date_panier.add(DateTime.now().toString());
      quantite_panier.add(quantite.toString());
    });
    message_commande_valide();
    sauvegarder_commande();

  }}
  Future<void> sauvegarder_commande() async{
    final prefs=await SharedPreferences.getInstance();
    prefs.setStringList("image_panier", image_panier);
    prefs.setStringList("titre_panier", titre_panier);
    prefs.setStringList("prix_panier", prix_panier);
    prefs.setStringList("date_panier", date_panier);
    prefs.setStringList("quantite_panier", quantite_panier);


  }
  Future <void> charger_donnee_utilisateur() async{
    final prefs=await SharedPreferences.getInstance();
    setState(() {
      nom=prefs.getString("nom_utilisateur")??"vide";
      numero=prefs.getString("numero_utilisateur")??"vide";
    });
    print(nom);
    print(numero);

  }


  void message_sur_trop_de_commande(){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 3),backgroundColor:Colors.transparent,content: Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height *0.1,
      width: MediaQuery.of(context).size.width *1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.04)),
          color: Colors.orange),
      child: ListTile(title: Text("TROP DE COMMANDE PATIENTEZ",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: MediaQuery.of(context).size.width *0.05),),leading: Icon(Icons.dangerous,color: Colors.white,size: MediaQuery.of(context).size.width *0.1,),),
    )));
  }
  void message_commande_valide(){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 3),backgroundColor:Colors.transparent,content: Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height *0.1,
      width: MediaQuery.of(context).size.width *1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.04)),
          color: Colors.orange),
      child: ListTile(title: Text("COMMANDE VALIDEE",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: MediaQuery.of(context).size.width *0.05),),subtitle: Text("VOUS SEREZ BIENTOT CONTACTEZ",style: TextStyle(color: Colors.white70,fontFamily: "Poppins"),),leading: Icon(Icons.check_circle,color: Colors.white,size: MediaQuery.of(context).size.width *0.1,),),
    )));
  }
  @override
  void initState(){
    super.initState();
    reduction_augmentation_prix();
    charger_donnee_produit();
    charger_donnee_utilisateur();
    ajouter_coeur();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Stack(
            children: [
            Container(
             height: MediaQuery.of(context).size.height *0.355,
              width: MediaQuery.of(context).size.width *1,
              child: Image.asset(images[widget.index],fit: BoxFit.cover,),),
                Container(
                  height: MediaQuery.of(context).size.height *0.355,
                  width: MediaQuery.of(context).size.width *1,
                  decoration: BoxDecoration(color: Colors.black38,),
            )
          ],),
          SingleChildScrollView(
            child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.03),
                height: MediaQuery.of(context).size.height *0.27,
                width: MediaQuery.of(context).size.width *1,
                decoration: BoxDecoration(color: Colors.transparent,),

              ),
              Container(
                width: MediaQuery.of(context).size.width *1,
                height: MediaQuery.of(context).size.height *0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(MediaQuery.of(context).size.width *0.1),topLeft:  Radius.circular(MediaQuery.of(context).size.width *0.1))
                ),
                child: Column(
                  children: [

                ],),
              )
            ],
          ),),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.26,left:MediaQuery.of(context).size.width *0.3 ),
            alignment: AlignmentGeometry.center,
            height:MediaQuery.of(context).size.height *0.07,
            width: MediaQuery.of(context).size.width *0.4,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.deepOrangeAccent),
                borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  if(quantite>1){
                    setState(() {
quantite-=1;
                    });
                  }

                }, icon: Icon(CupertinoIcons.minus,color: Colors.deepOrangeAccent,)),
                Container(
                  alignment: AlignmentGeometry.center,
                  height: MediaQuery.of(context).size.height *0.05,
                  width: MediaQuery.of(context).size.width *0.1,
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.02))
                  ),

                  child:Text("${quantite}",style: TextStyle(fontSize: MediaQuery.of(context).size.width *0.04,color: Colors.white,fontFamily: "Poppins"),),
                    ),
                IconButton(onPressed: (){
                  setState(() {
                    quantite+=1;

                  });
                }, icon: Icon(Icons.add,color: Colors.deepOrangeAccent,)
                )
              ],),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.04,left: MediaQuery.of(context).size.width *0.04),
            height: MediaQuery.of(context).size.width *0.12,
            width: MediaQuery.of(context).size.width *0.12,
            decoration: BoxDecoration(
              color: Colors.white,
                border: Border.all(
color: Colors.deepOrangeAccent
                ),
                borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1))
            ),

            child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenPage()));
            }, icon: Icon(CupertinoIcons.arrow_left,color: Colors.deepOrangeAccent,)),),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.04,left: MediaQuery.of(context).size.width *0.9),

            child: coeur==false?IconButton(onPressed: ()async{
setState(() {
  coeur=!coeur;
  index_fonction=widget.index;
});
if(coeur){
  image_favoris.add(images[index_fonction]);
  titre_favoris.add(titre[index_fonction]);
  prix_favoris.add(prix_produit.toString());
  print(image_favoris);
  print(titre_favoris);
  print(prix_favoris);
  print("liked");
  await sauvegarder_produit_favoris();
}
else{
  image_favoris.removeAt(index_fonction);
  titre_favoris.removeAt(index_fonction);
  prix_favoris.remove(prix_produit.toString());
  print(image_favoris);
  print(titre_favoris);
  print(prix_favoris);
  print("not liked");
  await sauvegarder_produit_favoris();
}
            }, icon: coeur?Icon(CupertinoIcons.heart_fill,color: Colors.deepOrangeAccent):Icon(CupertinoIcons.heart,color: Colors.deepOrangeAccent)):
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.01,left: MediaQuery.of(context).size.width *0.025),
              child: Icon(CupertinoIcons.heart_fill,color: Colors.deepOrangeAccent,).animate().scale(begin: Offset(0, 0),end: Offset(3, 3),duration: Duration(seconds: 1)).fadeOut(duration: Duration(seconds: 1)) ,),
          ),Container(
           margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.36),
            child: SingleChildScrollView(child: Column(
            children: [
Container(
  margin:EdgeInsets.only(left: MediaQuery.of(context).size.height *0.01),
  width:MediaQuery.of(context).size.width *0.9,

  child: Text(titre[widget.index],style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.06 ),),
),
              Container(
                margin:EdgeInsets.only(left: MediaQuery.of(context).size.height *0.017),
                width:MediaQuery.of(context).size.width *0.9,

                child: Row(
                  children: [
                  Text("PRIX : ",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.06 )),
                  Text("${prix_produit} FCFA",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.06 ,color: Colors.deepOrangeAccent))
                ],),),
              Container(
               width: MediaQuery.of(context).size.width *0.7,
                height: MediaQuery.of(context).size.height *0.1,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(

                        height: MediaQuery.of(context).size.height *0.06,
                        width: MediaQuery.of(context).size.width *0.3,
                        decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.02))),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.car),
                            SizedBox(width: MediaQuery.of(context).size.width *0.02,),
                            Text("GRATUITE",style: TextStyle(fontFamily: "Poppins"))
                          ],))
                    ,Container(
                        height: MediaQuery.of(context).size.height *0.06,
                        width: MediaQuery.of(context).size.width *0.3,
                        decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.02))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.timer),
                            SizedBox(width: MediaQuery.of(context).size.width *0.02,),
                            Text("MATIN",style: TextStyle(fontFamily: "Poppins"))
                          ],))

                  ],),),
              Container(
alignment: AlignmentGeometry.center,
                width: MediaQuery.of(context).size.width *1,
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.03,right: MediaQuery.of(context).size.width *0.03),
                child:
                widget.index==2?Text("Découvrez notre plat composé d’un attiéké fin et bien émietté, accompagné d’un délicieux Tchpê préparé avec soin. Un mélange savoureux, équilibré et généreux, parfait pour un repas complet.",textAlign: TextAlign.center,style: TextStyle(fontFamily: "Poppins",color: Colors.black87,fontSize: MediaQuery.of(context).size.width *0.035)):
                widget.index==3||widget.index==5||widget.index==6||widget.index==7||widget.index==8||widget.index==9?Text("Crêpe Gourmande ESATIC Découvrez notre délicieuse crêpe préparée avec une pâte légère et moelleuse, cuite à la perfection. Garnie selon votre choix.",textAlign: TextAlign.center,style: TextStyle(fontFamily: "Poppins",color: Colors.black87,fontSize: MediaQuery.of(context).size.width *0.035),):
                widget.index==0?Text("Savourez notre Tchpê préparé avec une cuisson maîtrisée pour offrir un goût riche et authentique. Parfait pour un repas rapide, consistant et plein de saveurs.",textAlign: TextAlign.center,style: TextStyle(fontFamily: "Poppins",color: Colors.black87,fontSize: MediaQuery.of(context).size.width *0.035)):
                widget.index==4?Text("Profitez d’une eau fraîche et légère, parfaite pour vous hydrater à tout moment de la journée. Idéale pour accompagner vos repas ou simplement vous rafraîchir.",style: TextStyle(fontFamily: "Poppins",color: Colors.black87,fontSize: MediaQuery.of(context).size.width *0.03)):
                widget.index==11?Text("Gari de très bonne qualité, bien sec, propre et naturellement savoureux. Préparé avec soin à partir de manioc sélectionné, il est croquant et agréable à consommer tel quel ou pour accompagner vos plats. Idéal pour une consommation quotidienne.",textAlign: TextAlign.center,style: TextStyle(fontFamily: "Poppins",color: Colors.black87,fontSize: MediaQuery.of(context).size.width *0.035)):
                Text("Savourez un soda pétillant et rafraîchissant, disponible en plusieurs parfums selon votre préférence. Une boisson idéale pour apporter une touche sucrée et agréable à votre commande.",textAlign: TextAlign.center,style: TextStyle(fontFamily: "Poppins",color: Colors.black87,fontSize: MediaQuery.of(context).size.width *0.035))



              )],),),
          ),

          Container(
          decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1,))
          ),

            height:MediaQuery.of(context).size.height *0.08 ,
            width: MediaQuery.of(context).size.width *0.5,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.8,left: MediaQuery.of(context).size.width *0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            IconButton(onPressed: (){
              if(widget.index==3||widget.index==7){
                if(prix_produit==2000){
                  setState(() {
                    prix_produit-=1000;
                  });
                }
              }
              if(widget.index==8){
                if(prix_produit==1500){
                  setState(() {
                    prix_produit-=500;
                  });
                }
              }
            }, icon: Icon(CupertinoIcons.minus,color: Colors.white,)),
              Text("${prix_produit} FCFA",style: TextStyle(fontFamily: "Poppins",color: Colors.white),),
              IconButton(onPressed: (){

        if(widget.index==8){
          if(prix_produit==1000){
            setState(() {
              prix_produit+=500;
            });
          }
        }
              }, icon: Icon(Icons.add,color: Colors.white,))
          ],),),
          GestureDetector(
onTap: (){
  commande();
},
              child: Container(
            alignment: AlignmentGeometry.center,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.9),
            height: MediaQuery.of(context).size.height *0.1,
            width: MediaQuery.of(context).size.width *1,
            decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.only(topLeft:Radius.circular(MediaQuery.of(context).size.width *1),topRight: Radius.circular(MediaQuery.of(context).size.width *1))
            ),
            child: Text("COMMANDER",style: TextStyle(color: Colors.white,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.06),),
          ))
      ],
      ),
    );
  }
}

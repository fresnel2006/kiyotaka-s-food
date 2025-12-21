import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiyotaka_s_food/Pages/Produit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class AcceuilPage extends StatefulWidget {
  const AcceuilPage({super.key});

  @override
  State<AcceuilPage> createState() => _AcceuilPageState();
}

class _AcceuilPageState extends State<AcceuilPage> {
  Future <void> charger_donnee() async{
    final perfs = await SharedPreferences.getInstance();
    setState(() {
      image_favoris=perfs.getStringList("image_favoris")??[];
      titre_favoris=perfs.getStringList("titre_favoris")??[];
      prix_favoris=perfs.getStringList("prix_favoris")??[];
    });

  }
//variable de redirections redirigeant vers les differents contenaire tous, crepes,boissons,midi
int valeur_redictrice_widget=1;

//les differentes liste contenant les images de l'apk

  //images de la liste horizontale
var images_liste_horizontale=["assets/images/Thiéboudiène sénégalais _ la recette de Marc Dufumier.jpg","assets/images/Ceebu Yapp - beef or lamb variation, of the….jpg","assets/images/Splash photography on Behance.jpg","assets/images/Attieke à la dorade royale (Côte d'Ivoire) - La tendresse en cuisine.jpg","assets/images/empiler de crêpe avec Chocolat bruine.jpg","assets/images/eau.jpg","assets/images/crepes fromage.jpg","assets/images/Sprite Is No Longer Going to Be Sold in Green___.jpg"];

//titres de la liste horizontale
var titre_liste_horizontale=["TCHÊPE POISSON","COCA-COLA","GARBA","CRÊPES CHOCOLAT","EAU"];

//prix de la liste horizontale
var prix_liste_horizontale=["1000 FCFA","500 FCFA","1000 FCFA","1000-2000 fCFA","200 FCFA"];

//images de la liste verticale
var images_liste_verticale=["assets/images/crepes ceralac.jpg","assets/images/crepes chocolat.jpg","assets/images/crepes fromage.jpg","assets/images/Crêpes au yaourt.jpg","assets/images/Gözleme - Crêpes turques fourrées à la viande hachée.jpg","assets/images/Crystal-Cool Sprite – Refreshment Captured in every sip.jpg","assets/images/Picture of MOSCOW, RUSSIA-APRIL 4, 2014_ Can of….jpg","assets/images/Orangina reviews ratings & information - Bev Rank.jpg","assets/images/autreboissons.jpg","assets/images/tchepe poulet.jpg"];

//titres de la liste horizontale
var titre_liste_verticale=["CRÊPES CERELAC","CRÊPES  CHOCOLAT","CRÊPES JAMBON","CRÊPES NATURE","CRÊPES BOEUF HACHE","SPRIT","FANTA","ORANGINA","AUTRES BOISSONS","TCHÊPE POULET"];

//prix de la liste horizontale
var prix_liste_vertical=["1000-2000 FCFA","1000-2000 FCFA","3500 FCFA","1000-1500 FCFA","4000 FCFA","500 FCFA","500 FCFA","500 FCFA","VARIANT","1000 FCFA"];

//fonction pour ramener vers le lien whatsapp de dogbe

  Future <void> lancer_whatsapp() async{
    try {
      final url = Uri.parse("https://wa.me/2250789734299");
      var whatsapp = launchUrl(url,
          mode: LaunchMode.externalApplication);
    }catch(e){
      print("Probleme sur le lien pour aller vers numero whatsapp dans la page d'accueille");
    }
  }
  @override
  void initState(){
    super.initState();
    charger_donnee();
  }
  @override
  Widget build(BuildContext context) {
    var index;
    return Scaffold(
      backgroundColor: Colors.white,
body: Stack(

  children: [
  //l'espace scrollable
    SingleChildScrollView(
        child: Column(
          children: [
            //espace du haut
            SizedBox(height: MediaQuery.of(context).size.height *0.035,),
            //espace du haut

            //widget permettant de centrer
            Container(width: MediaQuery.of(context).size.width *1,),
            //le widget permettant de stocker l'image et "crepes" "boissons" "midi"


      //widget de l'image de kiyotaka's food
            valeur_redictrice_widget==2?Container(
              alignment: AlignmentGeometry.center,
              height: MediaQuery.of(context).size.height *0.23,
              width: MediaQuery.of(context).size.width *0.55,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.12),
              child:  Image.asset("assets/images/mariame food.png",fit: BoxFit.cover

              ),):Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.12),
        height: MediaQuery.of(context).size.height *0.23,
        width: MediaQuery.of(context).size.width *0.55,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1
            ))),child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1)),
        child: Image.asset("assets/images/kiyotaka image entreprise.png",fit: BoxFit.cover,),),
      ),



            //espace
            SizedBox(height: MediaQuery.of(context).size.height *0.02,),
           //espace

            //le widget contenant "tous", "crepes","BOISSONS" et "MIDI"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    //Pour affichier la premiere partie du contenaire avec marqué tous
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          valeur_redictrice_widget=1;
                        });
                      },
                      child:valeur_redictrice_widget==1?Container(
                        alignment: AlignmentGeometry.center,
                        height: MediaQuery.of(context).size.height *0.05,
                        width: MediaQuery.of(context).size.width *0.24,
                        child: Text("TOUS",style: TextStyle(fontFamily: "Poppins",color: Colors.orange),),
                        decoration: BoxDecoration(border: Border.all(color: Colors.orange),color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1))),
                      ):Container(
                        alignment: AlignmentGeometry.center,
                        height: MediaQuery.of(context).size.height *0.035,
                        width: MediaQuery.of(context).size.width *0.22,
                        child: Text("TOUS",style: TextStyle(fontFamily: "Poppins",color: Colors.white),),
                        decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1))),
                      ) ,
                    ),

//Pour affichier la seconde partie du contenaire avec marqué crepes

GestureDetector(
  onTap: (){
    setState(() {
      valeur_redictrice_widget=2;
    });
  },
    child:valeur_redictrice_widget==2?Container(
    alignment: AlignmentGeometry.center,
    height: MediaQuery.of(context).size.height *0.05,
    width: MediaQuery.of(context).size.width *0.24,
    child: Text("CRÊPES",style: TextStyle(fontFamily: "Poppins",color: Colors.orange),),
    decoration: BoxDecoration(border: Border.all(color: Colors.orange),color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1))),
    ):Container(
  alignment: AlignmentGeometry.center,
  height: MediaQuery.of(context).size.height *0.035,
  width: MediaQuery.of(context).size.width *0.22,
  child: Text("CRÊPES",style: TextStyle(fontFamily: "Poppins",color: Colors.white),),
  decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1))),
) ),

                    //Pour affichier la troisieme partie du contenaire avec marqué BOISSONS

                    GestureDetector(
onTap: (){
  setState(() {
    valeur_redictrice_widget=3;
  });
},
                      child: valeur_redictrice_widget==3?Container(
                      alignment: AlignmentGeometry.center,
                        height: MediaQuery.of(context).size.height *0.05,
                        width: MediaQuery.of(context).size.width *0.24,
                      child: Text("BOISSONS",style: TextStyle(fontFamily: "Poppins",color: Colors.orange)),
                      decoration: BoxDecoration(border: Border.all(color: Colors.orange),color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1))),
                    ):Container(
                        alignment: AlignmentGeometry.center,
                        height: MediaQuery.of(context).size.height *0.035,
                        width: MediaQuery.of(context).size.width *0.22,
                        child: Text("BOISSONS",style: TextStyle(fontFamily: "Poppins",color: Colors.white)),
                        decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1))),
                      ),),

                    //Pour affichier la troisieme partie du contenaire avec marqué BOISSONS
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          valeur_redictrice_widget=4;
                        });
                      },
                      child: valeur_redictrice_widget==4?Container(
    alignment: AlignmentGeometry.center,
                        height: MediaQuery.of(context).size.height *0.05,
                        width: MediaQuery.of(context).size.width *0.24,
    child: Text("MIDI",style: TextStyle(fontFamily: "Poppins",color: Colors.orange)),
    decoration: BoxDecoration(border: Border.all(color: Colors.orange),color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1))),
                      ):Container(
                      alignment: AlignmentGeometry.center,
                      height: MediaQuery.of(context).size.height *0.035,
                      width: MediaQuery.of(context).size.width *0.22,
                      child: Text("MIDI",style: TextStyle(fontFamily: "Poppins",color: Colors.white)),
                      decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1))),
                    ),)

                  ],),
SizedBox(height: MediaQuery.of(context).size.height *0.03,),
valeur_redictrice_widget==1?
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                children: [
//Premiere menu horizontal
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        index=0;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProduitPage(index:index)));
                    },
                    child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
                    child: Column(
                      children: [

                    Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                      child: Image.asset(images_liste_horizontale[0],fit: BoxFit.cover,),))
                    ,Container(

                        child: Column(

                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height *0.013,),
                            Row(children: [
                              Text(titre_liste_horizontale[0],style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

                            ],),



                              Text(prix_liste_horizontale[0],style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                              SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),
                            Icon(Icons.shopping_cart)

                      ],),)

                  ],),),),
                  SizedBox(width: MediaQuery.of(context).size.width *0.03,),
//deuxieme
                  GestureDetector(
    onTap: (){
    setState(() {
    index=1;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProduitPage(index:index)));
    },
                    child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
                    child: Column(
                      children: [

                        Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                          child: Image.asset(images_liste_horizontale[2],fit: BoxFit.cover,),))
                        ,Container(

                          child: Column(

                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height *0.012,),
                              Row(children: [
                                Text(titre_liste_horizontale[1],style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),
                              ],),
                                Text(prix_liste_horizontale[1],style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                              SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),
                              Icon(Icons.shopping_cart)
                            ],),)

                      ],),),),
                  SizedBox(width: MediaQuery.of(context).size.width *0.03,),

                  //troisieme
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        index=2;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProduitPage(index:index)));
                    },
                    child:
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
                    child: Column(
                      children: [

                        Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                          child: Image.asset(images_liste_horizontale[3],fit: BoxFit.cover,),))
                        ,Container(

                          child: Column(

                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height *0.012,),
                              Row(children: [
                                Text(titre_liste_horizontale[2],style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

                              ],),



                                Text(prix_liste_horizontale[2],style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                                SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),
                                Icon(Icons.shopping_cart)

                            ],),),SizedBox(width: MediaQuery.of(context).size.width *0.03,),

                      ],),),),
                  SizedBox(width: MediaQuery.of(context).size.width *0.03,),

                  //quatrieme
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        index=3;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProduitPage(index:index)));
                    },
                    child:
                  Container(
                   decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
                    child: Column(
                      children: [

                        Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                          child: Image.asset(images_liste_horizontale[4],fit: BoxFit.cover,),))
                        ,Container(

                          child: Column(

                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height *0.012,),
                              Row(children: [
                                Text(titre_liste_horizontale[3],style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

                              ],),



                                Text(prix_liste_horizontale[3],style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                                SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),
                                Icon(Icons.shopping_cart)

                            ],),),
                      ],),),),
    SizedBox(width: MediaQuery.of(context).size.width *0.03,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        index=4;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProduitPage(index:index)));
                    },
                    child:
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
                    child: Column(
                      children: [

                        Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                          child: Image.asset(images_liste_horizontale[5],fit: BoxFit.cover,),))
                        ,Container(

                          child: Column(

                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height *0.012,),
                              Row(children: [
                                Text(titre_liste_horizontale[4],style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

                              ],),



                                Text(prix_liste_horizontale[4],style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                                SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),
                                Icon(Icons.shopping_cart)

                            ],),),

                      ],),),


                  )],),

              )):Text(""),
            
            SizedBox(height: MediaQuery.of(context).size.height *0.045),
            valeur_redictrice_widget==1?Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text("AUTRE OFFRE",style: TextStyle(color: Colors.black,fontFamily: "Poppins"),),
              Container(height: MediaQuery.of(context).size.height *0.002,
                width: MediaQuery.of(context).size.width *0.6,
                decoration: BoxDecoration(border: Border.all(color: Colors.orange)),)
            ],):Text(""),
            valeur_redictrice_widget==1?Container(
              height:MediaQuery.of(context).size.height *1.2,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 7,itemBuilder: (context, index) => GestureDetector(
                onTap: (){
                  setState(() {
                    int valeur=index+4;
                    index=valeur+1;
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProduitPage(index: index)));
                },
                child: Container(

                margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height *0.012,left: MediaQuery.of(context).size.width *0.02),
                child: Row(
mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                    height:MediaQuery.of(context).size.height *0.1,
                    width: MediaQuery.of(context).size.height *0.165,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.04)),
                    child: Image.asset(images_liste_verticale[index],fit: BoxFit.cover,),),
                  ),
                    SizedBox(width: MediaQuery.of(context).size.width *0.06,),
                    Column(
                      children: [
                      Container(
                      width: MediaQuery.of(context).size.width *0.5,
                        child: Text("${titre_liste_verticale[index]}\nPRIX : ",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.035),),
                      ),Container(
width: MediaQuery.of(context).size.width *0.5,

  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(prix_liste_vertical[index],style:TextStyle(fontFamily: "Poppins",color: Colors.orange,fontSize: MediaQuery.of(context).size.width *0.03) ,),
      Icon(Icons.shopping_cart_checkout_rounded,size: MediaQuery.of(context).size.width *0.045,color:Colors.black)
    ],),),


                    ],
                      
                    )
                    
              ],),),)
              ,)):Text("")
    ],
        )
    ),





valeur_redictrice_widget==2?Container(
    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.484),
    height: MediaQuery.of(context).size.height *0.8,

    child: SingleChildScrollView(
      child: Column(
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      GestureDetector(
        onTap:(){
          setState(() {
            index=5;
          });
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProduitPage(index: index)));
        },
        child:
    Container(
    decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
    child: Column(
    children: [

    Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
    child: Image.asset(images_liste_verticale[0],fit: BoxFit.cover,),))
    ,Container(

    child: Column(

    children: [
    SizedBox(height: MediaQuery.of(context).size.height *0.023,),
    Row(
    children: [
    Text(titre_liste_verticale[0],style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

    ],),


SizedBox(height: MediaQuery.of(context).size.height *0.01,),
    Text(prix_liste_vertical[0],style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
    SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),
    Icon(Icons.shopping_cart)

    ],),)

    ],),),
      ),
    GestureDetector(
        onTap:(){
          setState(() {
            index=6;
          });
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProduitPage(index: index)));
        },
      child:
    Container(
    decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
    child: Column(
    children: [

    Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
    child: Image.asset(images_liste_verticale[1],fit: BoxFit.cover,),))
    ,Container(

    child: Column(

    children: [
    SizedBox(height: MediaQuery.of(context).size.height *0.023,),
    Row(children: [
    Text(titre_liste_verticale[1],style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

    ],),


      SizedBox(height: MediaQuery.of(context).size.height *0.01,),
    Text(prix_liste_vertical[1],style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
    SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),
    Icon(Icons.shopping_cart)

    ],),)

    ],),)),

    ],),
      SizedBox(height: MediaQuery.of(context).size.height *0.02,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap:(){
              setState(() {
                index=7;
              });
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProduitPage(index: index)));
            },
            child:
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
            child: Column(
              children: [

                Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                  child: Image.asset(images_liste_verticale[2],fit: BoxFit.cover,),))
                ,Container(

                  child: Column(

                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height *0.023,),
                      Row(
                        children: [

                          Text(titre_liste_verticale[2],style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

                        ],),


                      SizedBox(height: MediaQuery.of(context).size.height *0.01,),
                      Text(prix_liste_vertical[2],style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                      SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),
                      Icon(Icons.shopping_cart)

                    ],),)

              ],),),
          ),
          GestureDetector(
              onTap:(){
                setState(() {
                  index=8;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProduitPage(index: index)));
              },
              child:
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
                child: Column(
                  children: [

                    Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                      child: Image.asset(images_liste_verticale[3],fit: BoxFit.cover,),))
                    ,Container(

                      child: Column(

                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height *0.023,),
                          Row(children: [
                            Text(titre_liste_verticale[3],style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

                          ],),


                          SizedBox(height: MediaQuery.of(context).size.height *0.01,),
                          Text(prix_liste_vertical[3],style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                          SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),
                          Icon(Icons.shopping_cart)

                        ],),)

                  ],),)),

        ],),
      SizedBox(height: MediaQuery.of(context).size.height *0.02,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap:(){
              setState(() {
                index=9;
              });
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProduitPage(index: index)));
            },
            child:
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
            child: Column(
              children: [

                Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                  child: Image.asset(images_liste_verticale[4],fit: BoxFit.cover,),))
                ,Container(

                  child: Column(

                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height *0.023,),
                      Row(
                        children: [

                          Text(titre_liste_verticale[4],style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

                        ],),


                      SizedBox(height: MediaQuery.of(context).size.height *0.01,),
                      Text(prix_liste_vertical[4],style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                      SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),
                      Icon(Icons.shopping_cart)

                    ],),)

              ],),),
          ),
          GestureDetector(child:
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
            child: Column(
              children: [

                Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                  child: Text(""),))
                ,Container(

                  child: Column(

                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height *0.023,),
                      Row(
                        children: [

                          Text("",style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

                        ],),


                      SizedBox(height: MediaQuery.of(context).size.height *0.01,),
                      Text("",style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                      SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),


                    ],),)

              ],),),
          )



        ],)


    ],),)):Text(""),











    valeur_redictrice_widget==3?Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.484),
      child: SingleChildScrollView(
  child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap:(){
              setState(() {
                index=10;
              });
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProduitPage(index: index)));
            },
            child:
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
            child: Column(
              children: [

                Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                  child: Image.asset(images_liste_verticale[5],fit: BoxFit.cover,),))
                ,Container(

                  child: Column(

                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height *0.023,),
                      Row(
                        children: [
                          Text(titre_liste_verticale[5],style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

                        ],),


                      SizedBox(height: MediaQuery.of(context).size.height *0.01,),
                      Text(prix_liste_vertical[5],style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                      SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),
                      Icon(Icons.shopping_cart)

                    ],),)

              ],),),
          ),
          GestureDetector(
              onTap:(){
                setState(() {
                  index=11;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProduitPage(index: index)));
              },
              child:
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
                child: Column(
                  children: [

                    Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                      child: Image.asset(images_liste_verticale[6],fit: BoxFit.cover,),))
                    ,Container(

                      child: Column(

                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height *0.023,),
                          Row(children: [
                            Text(titre_liste_verticale[6],style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

                          ],),


                          SizedBox(height: MediaQuery.of(context).size.height *0.01,),
                          Text(prix_liste_vertical[6],style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                          SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),
                          Icon(Icons.shopping_cart)

                        ],),)

                  ],),)),


        ],),
      SizedBox(height: MediaQuery.of(context).size.height *0.02,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap:(){
              setState(() {
                index=12;
              });
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProduitPage(index: index)));
    },
            child:
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
              child: Column(
                children: [

                  Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                    child: Image.asset(images_liste_verticale[7],fit: BoxFit.cover,),))
                  ,Container(

                    child: Column(

                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height *0.023,),
                        Row(
                          children: [
                            Text(titre_liste_verticale[7],style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

                          ],),


                        SizedBox(height: MediaQuery.of(context).size.height *0.01,),
                        Text(prix_liste_vertical[7],style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                        SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),
                        Icon(Icons.shopping_cart)

                      ],),)

                ],),),
          ),
          GestureDetector(
            onTap: () async {
              await lancer_whatsapp();
            },
              child:
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
                child: Column(
                  children: [

                    Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                      child: Image.asset(images_liste_verticale[8],fit: BoxFit.cover,),))
                    ,Container(

                      child: Column(

                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height *0.023,),
                          Row(children: [
                            Text(titre_liste_verticale[8],style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),
                          ],),


                          SizedBox(height: MediaQuery.of(context).size.height *0.01,),
                          Text(prix_liste_vertical[8],style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                          SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),
                          Container(
                            width: MediaQuery.of(context).size.width *0.3,
                              height:MediaQuery.of(context).size.height *0.04 ,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1))
                              ),
                              child: Icon(FontAwesomeIcons.whatsapp,color: Colors.white,))

                        ],),)

                  ],),)),


        ],),



  ],),
),
    ):Text(""),







    valeur_redictrice_widget==4?Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.484),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap:(){
                    setState(() {
                      index=0;
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProduitPage(index: index)));
                  },
                  child:
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
                    child: Column(
                      children: [

                        Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                          child: Image.asset(images_liste_horizontale[0],fit: BoxFit.cover,),))
                        ,Container(

                          child: Column(

                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height *0.023,),
                              Row(
                                children: [
                                  Text(titre_liste_horizontale[0],style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),
                                ],),


                              SizedBox(height: MediaQuery.of(context).size.height *0.01,),
                              Text(prix_liste_horizontale[0],style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                              SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),
                              Icon(Icons.shopping_cart)

                            ],),)

                      ],),),
                ),
                GestureDetector(
    onTap:(){
    setState(() {
    index=2;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProduitPage(index: index)));
    },
                    child:
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
                      child: Column(
                        children: [

                          Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                            child: Image.asset(images_liste_horizontale[3],fit: BoxFit.cover,),))
                          ,Container(

                            child: Column(

                              children: [
                                SizedBox(height: MediaQuery.of(context).size.height *0.023,),
                                Row(children: [
                                  Text(titre_liste_horizontale[2],style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

                                ],),


                                SizedBox(height: MediaQuery.of(context).size.height *0.01,),
                                Text(prix_liste_horizontale[2],style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                                SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),
                                Icon(Icons.shopping_cart)

                              ],),)

                        ],),)),


              ],),
            SizedBox(height: MediaQuery.of(context).size.height *0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
    onTap:(){
    setState(() {
    index=13;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProduitPage(index: index)));
    },
                  child:
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
                    child: Column(
                      children: [

                        Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                          child: Image.asset(images_liste_verticale[9],fit: BoxFit.cover,),))
                        ,Container(

                          child: Column(

                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height *0.023,),
                              Row(
                                children: [
                                  Text(titre_liste_verticale[9],style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),

                                ],),


                              SizedBox(height: MediaQuery.of(context).size.height *0.01,),
                              Text(prix_liste_vertical[9],style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                              SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),
                              Icon(Icons.shopping_cart)

                            ],),)

                      ],),),
                ),
                GestureDetector(
                  onTap: (){

                  },
                    child:
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03))),
                      child: Column(
                        children: [

                          Container(height: MediaQuery.of(context).size.height *0.19,width: MediaQuery.of(context).size.width *0.45,child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.03)),
                            child: Text(""),))
                          ,Container(

                            child: Column(

                              children: [
                                SizedBox(height: MediaQuery.of(context).size.height *0.023,),
                                Row(children: [
                                  Text("",style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),),
                                ],),


                                SizedBox(height: MediaQuery.of(context).size.height *0.01,),
                                Text("",style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04)),
                                SizedBox(width: MediaQuery.of(context).size.width *0.075,height: MediaQuery.of(context).size.height *0.01,),
                                Container(
                                    width: MediaQuery.of(context).size.width *0.3,
                                    height:MediaQuery.of(context).size.height *0.04 ,
                                    decoration: BoxDecoration(

                                        borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1))
                                    ),
                                   )

                              ],),)

                        ],),)),


              ],),



          ],),
      ),
    ):Text("")











































    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    








//Le menu du haut qui est fixe
  ,Container(
    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.032),
    decoration: BoxDecoration(color: Colors.white),
    height: MediaQuery.of(context).size.height *0.12,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: (){
          ZoomDrawer.of(context)!.toggle();
        }, icon: Icon(Icons.menu,size: MediaQuery.of(context).size.width *0.07,color:Colors.black)),
        Row(children: [
          Icon(Icons.local_restaurant ,size:MediaQuery.of(context).size.width *0.09),
          Text("kiyotaka's food",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.05),),
        ],),

      IconButton(onPressed: (){

      }, icon: Icon(FontAwesomeIcons.magnifyingGlass,size:MediaQuery.of(context).size.width *0.07,color: Colors.black,))
    ],),


    ),

  ]),
    );
  }
}

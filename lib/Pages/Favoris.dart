import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiyotaka_s_food/Pages/Acceuil.dart';
import 'package:kiyotaka_s_food/Pages/MainScreen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FavorisPage extends StatefulWidget {
  const FavorisPage({super.key});

  @override
  State<FavorisPage> createState() => _FavorisPageState();
}

class _FavorisPageState extends State<FavorisPage> {
  List<String> image_favoris=[];
  List<String> titre_favoris=[];
  List<String> prix_favoris=[];
  Future <void> charger_produit_favoris()async{
    try {
      final perfs = await SharedPreferences.getInstance();
      setState(() {
        image_favoris= perfs.getStringList("image_favoris")??[];
        titre_favoris= perfs.getStringList("titre_favoris")??[];
        prix_favoris= perfs.getStringList("prix_favoris")??[];

      });
      print(image_favoris);
      print(titre_favoris);
      print(prix_favoris);
    }catch(e){
      print(e);
    }
  }

  Future <void> sauvegarder_produit_favoris()async{
    final perfs = await SharedPreferences.getInstance();
    await perfs.setStringList("image_favoris", image_favoris);
    await perfs.setStringList("titre_favoris", titre_favoris);
    await perfs.setStringList("prix_favoris", prix_favoris);
  }
  @override
  void initState(){
    super.initState();
    charger_produit_favoris();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Stack(
        children: [
        Column(
          children: [
          Container(width: MediaQuery.of(context).size.width *1),
          Container(child: image_favoris.isNotEmpty?Image.asset("assets/images/kiyotaka image entreprise.png",height: MediaQuery.of(context).size.height *0.4,width: MediaQuery.of(context).size.width *1,):Text(""),),

        ],),
          Column(
            children: [
              image_favoris.isNotEmpty?SizedBox(height: MediaQuery.of(context).size.height *0.33,):SizedBox(height: MediaQuery.of(context).size.height *0.06,),
              image_favoris.isNotEmpty?Row(
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
      Text("Favoris",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04,color: Colors.orange),),

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
                    Text("FAVORIS",style: TextStyle(color: Colors.orange,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.07),),
                    Container(
                      width: MediaQuery.of(context).size.width *0.3,
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.orange,width: MediaQuery.of(context).size.width *0.01))),)
    ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width *1,
                height: MediaQuery.of(context).size.height *0.54,
              child: image_favoris.isNotEmpty?ListView.builder(itemCount: image_favoris.length,itemBuilder: (context, index) => GestureDetector(

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
    child: Image.asset(image_favoris[index],fit: BoxFit.cover,),),
    ),
    SizedBox(width: MediaQuery.of(context).size.width *0.06,),
    Column(
    children: [
    Container(
      width: MediaQuery.of(context).size.width *0.5,
      child: Text("${titre_favoris[index]}\nPRIX : ",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.035),),
    ),Container(
      width: MediaQuery.of(context).size.width *0.5,
      decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1))
    ),


    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text("${prix_favoris[index]} FCFA",style:TextStyle(fontFamily: "Poppins",color: Colors.orange,fontSize: MediaQuery.of(context).size.width *0.04) ,),
    IconButton(onPressed: ()async{
      image_favoris.removeAt(index);
      titre_favoris.removeAt(index);
      prix_favoris.removeAt(index);
      print(image_favoris);
      print(titre_favoris);
      print(prix_favoris);
      print("not liked");
      await sauvegarder_produit_favoris();
      await charger_produit_favoris();
    }, icon: Icon(CupertinoIcons.heart_slash,color: Colors.orange,size:MediaQuery.of(context).size.width *0.04))

    ],),),


    ],

    )

    ],),),),):SingleChildScrollView(child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height *0.1),
                  Container(
                    height: MediaQuery.of(context).size.height *0.25,
                    child: Lottie.asset("assets/animations/Frying Pan Breakfast.json"),),
                  SizedBox(height: MediaQuery.of(context).size.height *0),
                  Container(child: Text("VEUILLEZ AJOUTER \nUN PRODUIT EN FAVORIS",textAlign: TextAlign.center,style: TextStyle(fontFamily: "Poppins",color: Colors.black,fontSize: MediaQuery.of(context).size.width *0.035),),),
                  SizedBox(height: MediaQuery.of(context).size.height *0.035),
                  Container(child:ElevatedButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MainscreenPage()));
    }, child: Text("AJOUTER PRODUIT",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: MediaQuery.of(context).size.width *0.035)),style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent),) ,)
                ],
              )

              )

              )
            ],)
      ],)

      ));
  }
}

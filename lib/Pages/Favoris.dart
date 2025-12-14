import 'package:flutter/material.dart';
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

  @override
  void initState(){
    super.initState();
    charger_produit_favoris();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Stack(
        children: [
        Column(
          children: [
          Container(width: MediaQuery.of(context).size.width *1),
          Container(child: Image.asset("assets/images/kiyotaka image entreprise.png",height: MediaQuery.of(context).size.height *0.4,width: MediaQuery.of(context).size.width *1,),),

        ],),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height *0.33,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width *0.3,
                    height: MediaQuery.of(context).size.height *0.0015,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  ),
                  Container(child: Text("Favoris",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04,color: Colors.orange),),),
                  Container(width: MediaQuery.of(context).size.width *0.3,
                    height: MediaQuery.of(context).size.height *0.0015,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  )
                ],),
              Container(
                width: MediaQuery.of(context).size.width *1,
                height: MediaQuery.of(context).size.height *0.54,
              child: ListView.builder(itemCount: 0,itemBuilder: (context, index) => GestureDetector(
    onTap: (){
    setState(() {
    int valeur=index+4;
    index=valeur+1;
    });

    },
    child: Container(
    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height *0.012,left: MediaQuery.of(context).size.width *0.02),
    child: Row(
    children: [
    Container(height: MediaQuery.of(context).size.height *0.12,
    decoration: BoxDecoration(),
    width: MediaQuery.of(context).size.width *0.35,
    child: ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.04)),
    child: Text(""),),
    ),
    SizedBox(width: MediaQuery.of(context).size.width *0.06,),
    Stack(
    children: [
    Text("\nPRIX : ",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.035),),
    Container(
    height: MediaQuery.of(context).size.height *0.04,
    width: MediaQuery.of(context).size.width *0.5,
    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.05),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1))
    ),


    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text("",style:TextStyle(fontFamily: "Poppins",color: Colors.orange) ,),
    Icon(Icons.shopping_cart_checkout_rounded)
    ],),),


    ],

    )

    ],),),),),

              )


            ],)
      ],)
      ,
    );
  }
}

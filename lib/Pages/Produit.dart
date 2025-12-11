import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProduitPage extends StatefulWidget {
  ProduitPage({super.key, required this.index});
var index;
  @override
  State<ProduitPage> createState() => _ProduitPageState();
}

class _ProduitPageState extends State<ProduitPage> {
  var images=["assets/images/Thiéboudiène sénégalais _ la recette de Marc Dufumier.jpg","assets/images/Splash photography on Behance.jpg","assets/images/Attieke à la dorade royale (Côte d'Ivoire) - La tendresse en cuisine.jpg","assets/images/empiler de crêpe avec Chocolat bruine.jpg","assets/images/Water _).jpg","assets/images/crepes ceralac.jpg","assets/images/empiler de crêpe avec Chocolat bruine.jpg","assets/images/crepes fromage.jpg","assets/images/Sprite Is No Longer Going to Be Sold in Green___.jpg","assets/images/crepes chocolat.jpg","assets/images/crepes fromage.jpg","assets/images/sprit.jpg","assets/images/fanta.jpg"];
  var titre=["TCHÊPE POISSON","COCA-COLA","GARBA","CRÊPES CHOCOLAT","EAU","FROMAGE AU CERELAC","CRÊPES AU CHOCOLAT","CRÊPES FROMAGE","SPRIT"];
  var prix=[1000,500,1000,2000-1000,200,2000-1000,2000-1000,3500,500];

  var prix_produit;
  void reduction_augmentation_prix(){
    if (widget.index==0||widget.index==2){
      setState(() {
        prix_produit=1000;
      });
    }
    else if (widget.index==1||widget.index==8){
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
    else{
      setState(() {
        prix_produit=1000;
      });
    }

  }

  @override
  void initState(){
    super.initState();
    reduction_augmentation_prix();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(children: [
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.03),
              height: MediaQuery.of(context).size.height *0.32,
              width: MediaQuery.of(context).size.width *1,
              child: Image.asset(images[widget.index],fit: BoxFit.cover,),),

                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.03),
                  height: MediaQuery.of(context).size.height *0.32,
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

                }, icon: Icon(CupertinoIcons.minus,color: Colors.deepOrangeAccent,)),
                Container(
                  alignment: AlignmentGeometry.center,
                  height: MediaQuery.of(context).size.height *0.05,
                  width: MediaQuery.of(context).size.width *0.1,
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.02))
                  ),

                  child:Text("1",style: TextStyle(fontSize: MediaQuery.of(context).size.width *0.05,color: Colors.white,fontFamily: "Poppins"),),
                    ),
                IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.deepOrangeAccent,)
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
              Navigator.pop(context);
            }, icon: Icon(CupertinoIcons.arrow_left,color: Colors.deepOrangeAccent,)),),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.04,left: MediaQuery.of(context).size.width *0.9),

            child: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.heart,color: Colors.deepOrangeAccent,)) ,),
          Container(
           margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.36),
            child: Column(
            children: [
Container(
  margin:EdgeInsets.only(left: MediaQuery.of(context).size.height *0.01),
  width:MediaQuery.of(context).size.width *0.7,

  child: Text(titre[widget.index],style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.06 ),),
),
              Container(
                margin:EdgeInsets.only(left: MediaQuery.of(context).size.height *0.017),
                width: MediaQuery.of(context).size.height *0.32,

                child: Row(
                  children: [
                  Text("PRIX : ",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.06 )),
                  Text("${prix_produit} FCFA",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.06 ,color: Colors.deepOrangeAccent))
                ],),),



              
          ],),),
          Container(
margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.44,left: MediaQuery.of(context).size.width *0.15),
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

            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.55,left: MediaQuery.of(context).size.width *0.05),

            width: MediaQuery.of(context).size.width *0.9,


            child: Text("Crêpe Gourmande ESATIC Découvrez notre délicieuse crêpe préparée avec une pâte légère et moelleuse, cuite à la perfection. Garnie selon votre choix.",style: TextStyle(fontFamily: "Poppins",color: Colors.black87,fontSize: MediaQuery.of(context).size.width *0.05),),),
          Container(
          decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *0.1,))
          ),

            height:MediaQuery.of(context).size.height *0.08 ,
            width: MediaQuery.of(context).size.width *0.5,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.75,left: MediaQuery.of(context).size.width *0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            IconButton(onPressed: (){
              if(widget.index==3||widget.index==6||widget.index==7){
                if(prix_produit==2000){
                  setState(() {
                    prix_produit-=1000;
                  });
                }

              }
            }, icon: Icon(CupertinoIcons.minus,color: Colors.white,)),
              Text("${prix_produit} FCFA",style: TextStyle(fontFamily: "Poppins",color: Colors.white),),
              IconButton(onPressed: (){
        if(widget.index==3||widget.index==6||widget.index==7){
          if(prix_produit==1000){
            setState(() {
              prix_produit+=1000;
            });
          }

        }
              }, icon: Icon(Icons.add,color: Colors.white,))
          ],),),
          Container(
            alignment: AlignmentGeometry.center,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.9),
            height: MediaQuery.of(context).size.height *0.1,
            width: MediaQuery.of(context).size.width *1,

            decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.only(topLeft:Radius.circular(MediaQuery.of(context).size.width *1),topRight: Radius.circular(MediaQuery.of(context).size.width *1))
            ),
            child: Text("COMMANDER",style: TextStyle(color: Colors.white,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.06),),
          )
      ],
      ),
    );
  }
}

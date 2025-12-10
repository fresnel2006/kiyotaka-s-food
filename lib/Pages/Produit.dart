import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProduitPage extends StatefulWidget {
  const ProduitPage({super.key});

  @override
  State<ProduitPage> createState() => _ProduitPageState();
}

class _ProduitPageState extends State<ProduitPage> {
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
              child: Image.asset("assets/images/crepes fromage.jpg",fit: BoxFit.cover,),),

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

            child: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.arrow_left,color: Colors.deepOrangeAccent,)),),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.04,left: MediaQuery.of(context).size.width *0.9),

            child: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.heart,color: Colors.deepOrangeAccent,)) ,),
          Container(
           margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.36),
            child: Column(
            children: [
Container(
  margin:EdgeInsets.only(left: MediaQuery.of(context).size.height *0.02),
  child: Text("CRÊPES AU CHOCOLAT ",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.06 ),),
),
              Container(
                margin:EdgeInsets.only(left: MediaQuery.of(context).size.height *0.01),
                width: MediaQuery.of(context).size.height *0.3,

                child: Row(
                  children: [
                  Text("PRIX : ",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.06 )),
                  Text("500-2000 FCFA",style: TextStyle(fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.06 ,color: Colors.deepOrangeAccent))
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


            child: Text("Crêpe Gourmande ESATIC Découvrez notre délicieuse crêpe préparée avec une pâte légère et moelleuse, cuite à la perfection. Garnie selon votre choix",style: TextStyle(fontFamily: "Poppins",color: Colors.black87,fontSize: MediaQuery.of(context).size.width *0.05),),),
          Container(
            color: Colors.blue,
            height:100 ,
            width: 200,
            margin: EdgeInsets.only(top: 700),
            child: Row(
            children: [
            IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.minus)),
              Text("...",style: TextStyle(fontFamily: "Poppins"),),
              IconButton(onPressed: (){}, icon: Icon(Icons.add))
          ],),)
      ],
      ),
    );
  }
}

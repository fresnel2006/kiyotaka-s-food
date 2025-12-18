import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class MenuscreenPage extends StatefulWidget {
  const MenuscreenPage({super.key});

  @override
  State<MenuscreenPage> createState() => _MenuscreenPageState();
}

class _MenuscreenPageState extends State<MenuscreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(width: MediaQuery.of(context).size.width *1,),
            Container(margin: EdgeInsets.only( bottom:MediaQuery.of(context).size.height *0.05,top: MediaQuery.of(context).size.height *0.04),

              child: Lottie.asset("assets/animations/Frying Pan Breakfast.json",height: MediaQuery.of(context).size.height *0.3,width: MediaQuery.of(context).size.width *1),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                width: MediaQuery.of(context).size.width *0.1,),
                Container(child: Text("VOIR PLUS",style: TextStyle(fontFamily: "Poppins",color: Colors.deepOrangeAccent),),),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  width: MediaQuery.of(context).size.width *0.1,),
              ],),
            SizedBox(height: MediaQuery.of(context).size.height *0.05,),
            GestureDetector(
              child: Container(
              height: MediaQuery.of(context).size.height *0.07,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrangeAccent,width: MediaQuery.of(context).size.width *0.004),
                  borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1))
              ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

Icon(FontAwesomeIcons.burger,color: Colors.deepOrangeAccent,),
                SizedBox(width: MediaQuery.of(context).size.width *0.04,),
                Text("KIYOTAKA'S FOOD",style: TextStyle(color: Colors.deepOrangeAccent,fontFamily: "Poppins"),)
              ],
            ),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height *0.03,),

            GestureDetector(
                child: Container(
                height: MediaQuery.of(context).size.height *0.07,
                decoration: BoxDecoration(

                    border: Border.all(color: Colors.deepOrangeAccent,width: MediaQuery.of(context).size.width *0.004),
                    borderRadius: BorderRadius.all(

                        Radius.circular(MediaQuery.of(context).size.width *1))
                ),
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(FontAwesomeIcons.candyCane,color: Colors.deepOrangeAccent,),
                SizedBox(width: MediaQuery.of(context).size.width *0.04,),
                Text("MARIAM'S FOOD",style: TextStyle(color: Colors.deepOrangeAccent,fontFamily: "Poppins"),)
            ],))),
            Lottie.asset("assets/animations/chef.json")
        ],) ,

      ),
    );
  }
}

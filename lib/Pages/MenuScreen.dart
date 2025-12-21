import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiyotaka_s_food/Pages/Kiyotaka.dart';
import 'package:kiyotaka_s_food/Pages/Mariam.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuscreenPage extends StatefulWidget {
  const MenuscreenPage({super.key});

  @override
  State<MenuscreenPage> createState() => _MenuscreenPageState();
}
Future <void> lancer_whatsapp() async{
  final url=Uri.parse("");
  final whatsapp=await launchUrl(url,mode: LaunchMode.externalApplication);
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
            Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.04),
              child: Lottie.asset("assets/animations/Frying Pan Breakfast.json",height: MediaQuery.of(context).size.height *0.3,width: MediaQuery.of(context).size.width *1),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                width: MediaQuery.of(context).size.width *0.1,),
                Container(child: Text("VOIR PLUS",style: TextStyle(fontFamily: "Poppins",color: Colors.deepOrangeAccent,fontSize: MediaQuery.of(context).size.width *0.035),),),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  width: MediaQuery.of(context).size.width *0.1,),
              ],),
            SizedBox(height: MediaQuery.of(context).size.height *0.025,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>KiyotakaPage()));
              },
              child: Container(
              height: MediaQuery.of(context).size.height *0.07,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                  border: Border.all(color: Colors.deepOrangeAccent,width: MediaQuery.of(context).size.width *0.004),
                  borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width *1))
              ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

Icon(FontAwesomeIcons.burger,color: Colors.white,),
                SizedBox(width: MediaQuery.of(context).size.width *0.04,),
                Text("KIYOTAKA'S FOOD",style: TextStyle(color: Colors.white,fontFamily: "Poppins"),)
              ],
            ),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height *0.02,),

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
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MariamPage()));
                  },
                  child:Text("MARIAM CRÊPES",style: TextStyle(color: Colors.deepOrangeAccent,fontFamily: "Poppins"),) ,)
            ],))),
            SizedBox(height: MediaQuery.of(context).size.height *0.02,),
            GestureDetector(
                child: Container(
                    height: MediaQuery.of(context).size.height *0.07,
                    decoration: BoxDecoration(
                    color: Colors.green,
                        borderRadius: BorderRadius.all(
                            Radius.circular(MediaQuery.of(context).size.width *1))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.whatsapp,color: Colors.white,size:MediaQuery.of(context).size.width *0.07),
                        SizedBox(width: MediaQuery.of(context).size.width *0.04,),
                        Text("WHATSAPP",style: TextStyle(color: Colors.white,fontFamily: "Poppins",fontSize: MediaQuery.of(context).size.width *0.04),)
                      ],))),
            Lottie.asset("assets/animations/chef.json")
        ],) ,

      ),
    );
  }
}

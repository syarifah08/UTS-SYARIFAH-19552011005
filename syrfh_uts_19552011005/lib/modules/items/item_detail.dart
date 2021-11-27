import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syrfh_uts_19552011005/modules/models/items.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: AppBar(
        actions: [
          Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width / 1,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, border: Border.all(color: Color(int.parse(item.color)))),
                  child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back_ios_new, color: Color(int.parse(item.color)),)),
                  alignment: Alignment.center,
                ),
                Image.asset('assets/images/fujifilm-banner.png',
                    width: 150),
                Container(
                    decoration: BoxDecoration(shape: BoxShape.circle,
                      color: Colors.black,),
                    child: IconButton(
                        onPressed: (){
                        }, icon: Icon(Icons.more_vert_rounded, color: Colors.white,)))

              ],
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
    ),
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Container(
              height: 200,
              width: 170,
                child: Image.asset(item.url)),
          ),
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(text: 'Instax ', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
                          TextSpan(text: item.name, style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color(int.parse(item.color))))
                        ]
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 50,),
                  Text("Be real and fun with the INSTAX MINI 7+. Cool design, colorful and compact, this instant camera is fun andeasy to use.Point and shoot and give your day some fun!"),
                  SizedBox(height: MediaQuery.of(context).size.height / 50,),
                  Text("Point & Shoot", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  SizedBox(height: MediaQuery.of(context).size.height / 50,),
                  Text("The Mini 7+ is easy to use! Simply point and shoot! With its exposure control adjustment and 60mm fixed-focuslens, the Mini 7+ makes it easy for you to be creative and live in the moment."),
                  SizedBox(height: MediaQuery.of(context).size.height / 50,),
                  Text("Mini But With Full-Size Memories", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  SizedBox(height: MediaQuery.of(context).size.height / 50,),
                  Text("Pop it in your wallet, stick it to your wall – the INSTAX Mini film brings you instant 2 x 3 sized photos youcan show and tell."),
                  SizedBox(height: MediaQuery.of(context).size.height / 50,),
                  Text("Using professional high-quality film technology (as you’d expect from Fujifilm), your festival frolicking, sunworshipping, crowd surfing memories that you print will transport you right back into that moment."),
                  SizedBox(height: MediaQuery.of(context).size.height / 50,),
                  Text("Mini Film", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  SizedBox(height: MediaQuery.of(context).size.height / 50,),
                  Text("Mini moments with maximum impact. What’s your next mini moment?"),
                  SizedBox(height: MediaQuery.of(context).size.height / 50,),
                  Text("Plenty of Great Color Choices", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  SizedBox(height: MediaQuery.of(context).size.height / 50,),
                  Text("Available in five awesome colors: Lavender, Seafoam Green, Coral, Light Pink & Light Blue"),
                  SizedBox(height: MediaQuery.of(context).size.height / 50,),
                  Text("The Mini 7+ Has Your Back!", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  SizedBox(height: MediaQuery.of(context).size.height / 50,),
                  Text("Depending upon the weather conditions, you can easily control brightness to obtain a great picture"),
                  SizedBox(height: MediaQuery.of(context).size.height / 50,),
                  Text("Fun All The Time!", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  SizedBox(height: MediaQuery.of(context).size.height / 50,),
                  Text("Live in the moment and enjoy your Mini 7+, and give your day some instant fun!"),
                ],
              ),
            ),
          )
        ],
      ),
    ),
    bottomNavigationBar: BottomAppBar(
      child: Container(
        padding: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width / 1,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(item.price, style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(15), color: Color(int.parse(item.color))),
              child: Text("Buy Now", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    ),
  );
}
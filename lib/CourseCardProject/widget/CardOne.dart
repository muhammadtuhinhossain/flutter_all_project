import 'package:flutter/material.dart';

import 'Chip_card.dart';
class fullCard extends StatelessWidget {
  final String img;
  final String text;
  final String txt;
  const fullCard({
    super.key, required this.img, required this.text, required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 270,
          width: 180,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(topLeft:Radius.circular(4), topRight: Radius.circular(4)),
                        child: Image.asset(
                          height: 90,
                          width: double.infinity,
                          img,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(4), topRight: Radius.circular(4)),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('FULL STACK',style: TextStyle(color: Colors.white,fontSize: 12,height: 1),),
                              Text('Web Development',style: TextStyle(color: Colors.white,height: 1,fontWeight: FontWeight.w500),),
                              Text(
                                text,
                                style: TextStyle(
                                  fontSize: 20,height: 1,
                                  fontWeight: FontWeight.w900,
                                  foreground: Paint()..shader = LinearGradient(
                                    colors: [
                                      Color(0xFFFFD700),
                                      Colors.yellow,
                                      Colors.red,
                                    ],
                                  ).createShader(Rect.fromLTWH(0, 0, 200, 50)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 20,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Text('ব্যাচ ১৪',style: TextStyle(fontSize: 8),),
                      ),
                      chipCard(title: '৬ সিট বাকি', icon: Icons.chair_alt),
                      chipCard(title: '৬ দিন বাকি', icon: Icons.access_time),
                    ],
                  ),
                  Divider(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(txt,
                        style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8,top: 22),
                    child: Container(
                        height: 30,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('বিস্তারিত দেখি',style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(width: 5,),
                              Icon(Icons.arrow_forward_rounded,size: 15,fontWeight: FontWeight.bold,),
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
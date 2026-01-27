import 'package:flutter/material.dart';
import 'package:professional_project/CourseCardProject/widget/CardOne.dart';
import 'package:professional_project/CourseCardProject/widget/CardTwo.dart';
class CardDesign extends StatelessWidget {
  const CardDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Card Design'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                fullCard(img: 'asset/java.jpg', text: 'JavaScipt \n  (MERN)', txt: 'Full Stack Web\n'
                    'Development Web\n'
                    'JavaScript(MERN)',),
                fullCard(img: 'asset/code.jpg', text: 'Python,Django \n      & React', txt: 'Full Stack Web\n'
                    'Development Web\n'
                    'Python,Django & React',),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                fullCard(img: 'asset/ASP.png', text: 'ASP.NET CORE\n', txt: 'Full Stack Web\n'
                    'Development With\n'
                    'ASP.Net Core',),
                fullCard2(img: 'asset/react.png', text: 'SQA', txt: 'SQA: Manual &\n'
                    'Automated Testing'),
              ],
            ),
          ],
        )
    );
  }
}





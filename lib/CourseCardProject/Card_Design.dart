import 'package:flutter/material.dart';
import 'package:professional_project/CourseCardProject/widget/Container_Card.dart';
import 'package:professional_project/CourseCardProject/widget/course_Card.dart';

class CardDesign extends StatelessWidget {
  const CardDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card Design')),
      body: Column(
        children: [
          Row(
            children: [
              ContCard(
                img: 'asset/java.jpg',
                text: 'JavaScipt \n  (MERN)',
                txt:
                    'Full Stack Web\n'
                    'Development Web\n'
                    'JavaScript(MERN)',
              ),

              ContCard(
                img: 'asset/code.jpg',
                text: 'Python,Django \n      & React',
                txt:
                    'Full Stack Web\n'
                    'Development Web\n'
                    'Python,Django & React',
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              CourseCardWidget(
                img:
                    'https://cdn.ostad.app/course/photo/2025-12-08T14-27-28.969Z-Flutter-Thumbnail.jpg',
                txt:
                    'App Development With\n'
                    'Flutter & AI\n',
              ),
              CourseCardWidget(
                img:
                    'https://cdn.ostad.app/course/photo/2024-12-18T15-24-44.114Z-Untitled-1%20(21).jpg',
                txt:
                    'SQA: Manual &\n'
                    'Automated Testing',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

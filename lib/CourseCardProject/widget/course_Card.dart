import 'package:flutter/material.dart';

import 'Chip_card.dart';

class CourseCardWidget extends StatelessWidget {
  final String img;
  final String txt;
  const CourseCardWidget({
    super.key,
    required this.img,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: 180,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                          child: Image.network(
                            img,
                            height: 90,
                            width: 172,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Row(
                    children: [
                      Card(
                        child: Container(
                          height: 20,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          alignment: Alignment.center,
                          child: Text('ব্যাচ ১৪', style: TextStyle(fontSize: 8)),
                        ),
                      ),
                      Card(child: chipCard(title: '৬ সিট বাকি', icon: Icons.groups_rounded)),
                      Card(child: chipCard(title: '৬ সিট বাকি', icon: Icons.access_time)),
                    ],
                  ),
                ),
                Divider(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      txt,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 12,
              left: 10,
              right: 10,
              child: Card(
                child: Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'বিস্তারিত দেখি',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
class chipCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const chipCard({
    super.key, required this.title, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Icon(icon,size: 8,),
              SizedBox(width: 2,),
              Text(title,style: TextStyle(fontSize: 8),),
            ],
          ),
        )
    );
  }
}
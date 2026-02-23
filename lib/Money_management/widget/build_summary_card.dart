import 'package:flutter/material.dart';
class MoneyWidget extends StatelessWidget {
  final String title;
  final double amount;
  final Color cardColor;
  const MoneyWidget({
    super.key, required this.title, required this.amount, required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(title,style: TextStyle(fontSize: 16),),
              Text(amount.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}
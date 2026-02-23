import 'package:flutter/material.dart';
class CardListWidget extends StatelessWidget {
  final List<Map<String, dynamic>>items;
  final bool isEarning;
  final Function(int) onDelete;
  const CardListWidget({
    super.key, required this.items, required this.isEarning, required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: isEarning? Colors.green:Colors.red,
                child: Icon(isEarning? Icons.arrow_upward:Icons.arrow_downward,color: Colors.white,),
              ),
              title: Text(items[index]['title'],style: TextStyle(fontSize: 16),),
              subtitle: Text(items[index]['date'].toString(),style: TextStyle(fontSize: 12),),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(items[index]['amount'].toString(),style: TextStyle(fontSize: 16),
                  ),
                  IconButton(onPressed: (){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        title: Text('Confirm Delete'),
                        content: Text("Are you sure want to delete this item?"),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text('Cancel')),
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                            onDelete(index);
                          }, child: Text('Delete',style: TextStyle(color: Colors.red,),)),
                        ],
                      );
                    });
                  }, icon: Icon(Icons.delete,color: Colors.red,)),
                ],
              ),
            ),
          );
        });
  }
}
import 'package:flutter/material.dart';
class NotesHomePage extends StatefulWidget {
  const NotesHomePage({super.key});

  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
  final List<String> dropdownOptions=['Date modified','Date created'];
  late String dropdownValue=dropdownOptions.first;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes Book'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.logout),
          style: IconButton.styleFrom(
              backgroundColor: Color(0xFFFFDDE6),
              foregroundColor: Colors.orange,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.purpleAccent),
              ))
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search notes...',
                hintStyle: TextStyle(fontSize: 14),
                prefixIcon:Icon(Icons.search,size: 18,),
                fillColor: Colors.white,
                filled: true,

                isDense: true,
                contentPadding: EdgeInsets.zero,
                prefixIconConstraints: BoxConstraints(minWidth: 42,minHeight: 42),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.red,
                  )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Colors.green,
                    )
                ),
              ),
            ),
            Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_downward),
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  constraints: BoxConstraints(),
                  style: IconButton.styleFrom(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  iconSize: 18,
                  color: Colors.grey.shade700,
                ),
                SizedBox(width: 16,),
                DropdownButton<String>(
                    value: dropdownValue,
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.sort,size: 18,color: Colors.grey.shade700,),
                    ),
                    underline: SizedBox.shrink(),
                    borderRadius: BorderRadius.circular(10),
                    items: dropdownOptions.map((e)=>DropdownMenuItem(
                        value: e,
                        child: Row(
                          children: [
                            Text(e),
                            if(e == dropdownValue)...[
                              SizedBox(width: 8,),
                              Icon(Icons.check,size: 18,),
                            ],
                          ],
                        ),
                    ))
                    .toList(), onChanged: (newValue){
                      setState(() {
                        dropdownValue=newValue!;
                      });
                }),
                Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.menu),
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  constraints: BoxConstraints(),
                  style: IconButton.styleFrom(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  iconSize: 18,
                  color: Colors.grey.shade700,
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
                  itemBuilder: (context, int index){
                return Container(
                  child: Column(
                    children: [
                      Text('This is going to be a title'),
                      Row(
                        children: [
                          Container(
                            child: Text('First Chip'),
                          ),
                        ],
                      ),
                      Text('Some content'),
                      Row(
                        children: [
                          Text('02 jun 2026'),
                          Icon(Icons.delete),
                        ],
                      )
                    ],
                  ),
                );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

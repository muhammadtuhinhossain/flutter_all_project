
import 'package:flutter/material.dart';

class Livetest extends StatelessWidget {
  const Livetest({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> contacts = [
      {'name': 'Jawad',   'number': '017040-00000'},
      {'name': 'Ferdous', 'number': '018120-11111'},
      {'name': 'Karim',   'number': '019330-22222'},
      {'name': 'Rahim',   'number': '016550-33333'},
      {'name': 'Sabbir',  'number': '017220-44444'},
      {'name': 'Hasan',   'number': '018450-55555'},
      {'name': 'Rifat',   'number': '019670-66666'},
      {'name': 'Nayeem',  'number': '016890-77777'},
      {'name': 'Shuvo',   'number': '017110-88888'},
      {'name': 'Imran',   'number': '018330-99999'},
      {'name': 'Arif',    'number': '019550-10101'},
      {'name': 'Tanvir',  'number': '016770-12121'},
      {'name': 'Mahmud',  'number': '017990-13131'},
      {'name': 'Sohel',   'number': '018210-14141'},
      {'name': 'Bashir',  'number': '019430-15151'},
      {'name': 'Kamal',   'number': '016650-16161'},
      {'name': 'Nasim',   'number': '017870-17171'},
      {'name': 'Fahim',   'number': '018090-18181'},
      {'name': 'Rashed',  'number': '019310-19191'},
      {'name': 'Anik',    'number': '016530-20202'},
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Hasan',
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                hintText: '01745-777777',
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: Text('Add'))),
            SizedBox(height: 20,),

            Expanded(
              child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index){
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text(contacts[index]['name']!),
                        subtitle: Text(contacts[index]['number']!),
                        trailing: Icon(Icons.phone),
                      ),
                    );
                  }

              ),
            ),
          ],
        ),
      ),
    );
  }
}

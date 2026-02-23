import 'package:flutter/material.dart';
import 'package:professional_project/Money_management/widget/build_List.dart';
import 'package:professional_project/Money_management/widget/build_summary_card.dart';

class HomePageMoney extends StatefulWidget {
  const HomePageMoney({super.key});
  @override
  State<HomePageMoney> createState() => _HomePageMoneyState();
}

class _HomePageMoneyState extends State<HomePageMoney> with SingleTickerProviderStateMixin{
  List<Map<String, dynamic>>expense=[];
  List<Map<String, dynamic>>earning=[];

  double get totalExpense=>expense
      .where((item) => item['amount'] != null)
      .fold(0.0, (sum, item) => sum + item['amount']);
  double get totalEarning=>earning
      .where((item) => item['amount'] != null)
      .fold(0.0, (sum, item) => sum + item['amount']);
  double get balance=> totalEarning-totalExpense;

  void _showOptions(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    _showFrom(true);
                    }, child: Text('Add Earning')),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    _showFrom(false);
                    },child: Text('Add Expense')),
            ],
          ),
        );
    });
  }
  void _showFrom(bool isEarning){
    TextEditingController titleController=TextEditingController();
    TextEditingController amountController=TextEditingController();
    DateTime entryDate=DateTime.now();
    showDialog(context: context, builder: (context){
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(isEarning?'Add Earning':'Add Expense'),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  label: Text('title'),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                keyboardType: TextInputType.number,
                controller: amountController,
                decoration: InputDecoration(
                  label: Text('amount'),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    final title = titleController.text.trim();
                    final amountText = amountController.text.trim();
                    final amount = double.tryParse(amountText);

                    if (title.isEmpty || amount == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a valid title and amount'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }
                    setState(() {
                      if (isEarning) {
                        earning.add({
                          'title': title,
                          'amount': amount,
                          'date': entryDate,
                        });
                      } else {
                        expense.add({
                          'title': title,
                          'amount': amount,
                          'date': entryDate,
                        });
                      }
                    });

                    Navigator.pop(context);
                  },
                    child: const Text('Add'),
                  ),

                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('Cancel')),

                ],
              )
            ],
          ),
        ),
      );
    });
  }
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('Money Management'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Container(
            color: Colors.lime.shade600,
            child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.red,
                controller: _tabController,
                indicatorWeight: 3,
                tabs: [
                  Tab(text: 'Earning',icon: Icon(Icons.arrow_upward,color: Colors.green,fontWeight: FontWeight.w900,),),
                  Tab(text: 'Expense',icon: Icon(Icons.arrow_downward,color: Colors.red,fontWeight: FontWeight.bold,),),
            ]),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 5,),
          Row(
            children: [
              MoneyWidget(title: 'Earning', amount: totalEarning, cardColor: Colors.green,),
              MoneyWidget(title: 'Expense', amount: totalExpense, cardColor: Colors.red,),
              MoneyWidget(title: 'Balance', amount: balance, cardColor: Colors.blue,),
            ],
          ),
          SizedBox(height: 15,),

          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: [
                  CardListWidget(items: earning, isEarning: true, onDelete: (index) {
                    setState(() {
                      earning.removeAt(index);
                    });
                  },),
                  CardListWidget(items: expense, isEarning: false, onDelete: (index) {
                    setState(() {
                      expense.removeAt(index);
                    });
                  },),
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=>_showOptions(context),child: Icon(Icons.add),),
    );
  }
}






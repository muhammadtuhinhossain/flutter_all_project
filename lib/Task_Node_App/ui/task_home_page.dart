import 'package:flutter/material.dart';
import 'package:professional_project/Task_Node_App/db/task_database.dart';
import 'package:professional_project/Task_Node_App/models/task.dart';
class TaskHomePage extends StatefulWidget {
  const TaskHomePage({super.key});

  @override
  State<TaskHomePage> createState() => _TaskHomePageState();
}

class _TaskHomePageState extends State<TaskHomePage> {
  List<Task>tasks=[];
  final TextEditingController controller=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshTask();
  }
  Future<void> refreshTask()async{
    tasks=await TaskDatabase.getTask();
    setState(() {
    });
  }
  Future<void> addTask()async{
    if(controller.text.isNotEmpty){
      await TaskDatabase.insertTask(Task(title: controller.text, isDone: false));
      controller.clear();
      refreshTask();
    }
  }
  Future<void>toggleTaskState(Task task)async{
    await TaskDatabase.updateTask(Task(
        id:task.id,
        title: task.title,
        isDone: !task.isDone
    ));
    refreshTask();
    setState(() {
    });
  }


  Future<void>deleteTask(int id) async {
   await TaskDatabase.deleteTask(id);
   refreshTask();
   setState(() {
   });
  }
  Future<void>editTask(Task task)async{
    TextEditingController editTaskController=TextEditingController();
    editTaskController.text=task.title;
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text('EDIT Task'),
        content: TextField(
          controller: editTaskController,
          decoration: InputDecoration(hintText: 'Edit Text'),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Cancel')),
          TextButton(onPressed: () async {
            await TaskDatabase.updateTask(Task(
                id:task.id,
                title: editTaskController.text,
                isDone: task.isDone
            ));
            refreshTask();
            setState(() {
            });
            Navigator.pop(context);
          }, child: Text('Save')),
        ],
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Node'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Add Task',
                  ),
                )),
                IconButton(onPressed: addTask, icon: Icon(Icons.add)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index){
                  final task=tasks[index];
                  return Card(
                    child: ListTile(
                      leading: Checkbox(value: task.isDone, onChanged: (_)=>toggleTaskState(task),),
                      title: Text(task.title,
                      style: TextStyle(
                        decoration: task.isDone? TextDecoration.lineThrough: TextDecoration.none,
                        color: task.isDone? Colors.grey:Colors.black,
                      ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: ()=>editTask(task), icon: Icon(Icons.edit,color: Colors.green,)),
                          IconButton(onPressed: ()=>deleteTask(task.id!), icon: Icon(Icons.delete,color: Colors.red,)),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do_list/new_todo.dart';
import 'package:my_to_do_list/widgets/todo_list.dart';
import 'package:my_to_do_list/model/todo.dart';


class HomePage extends StatefulWidget{
  const HomePage ({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{

  

  final List<ToDo> _registeredToDoList = [
    ToDo(title: 'Date with GF', category: Category.entertainment, date: DateTime.now()),
    ToDo(title: 'Play Football', category: Category.sports, date: DateTime.now())
  ];
    

  

  void _openAddToDoVoerlay(){
    showModalBottomSheet(
      backgroundColor: Color(0xffFF9BD2),
      isScrollControlled: true,
      context: context,
      builder: ((context) => NewToDo(onAddToDo: _addToDo)
    ));
  }

  void _addToDo(ToDo todo){
    setState(() {
      _registeredToDoList.add(todo);
    });
  }

  void _removeToDo(ToDo todo){
    final todoIndex = _registeredToDoList.indexOf(todo);

    setState(() {
      _registeredToDoList.remove(todo);
    });

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: const Text('To Do List deleted'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: (){
              setState(() {
                _registeredToDoList.insert(todoIndex, todo);
              });
            },
          ),
          )
    );
  }

  
   
   @override
  Widget build(BuildContext context) {

    Widget mainContent = const Center(
       child: Text('No To Do List found. Start adding some!'),
    );
    if(_registeredToDoList.isNotEmpty){
      mainContent = 
       ToDoList(todolist: _registeredToDoList, onRemoveToDo: _removeToDo);
    }

    return Scaffold(
      backgroundColor: const Color(0xffF8F4EC),
      appBar: AppBar(title:  Text('To Do List',
                     style: GoogleFonts.orbitron(
                      color:  Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      
                     ),
                      ),
                     backgroundColor: const Color(0xffD63484),  
                     centerTitle: true,
                    ),

      floatingActionButton: FloatingActionButton(onPressed: _openAddToDoVoerlay,
                          backgroundColor: const Color(0xff402B3A),
                          child: const Icon(Icons.add,color: Color(0xffF8F4EC),),
                          ),              
      
      body: Expanded(child: mainContent),
      // body: ToDoList(todolist: _registeredToDoList, onRemoveToDo: _removeToDo) ,
                    
    );
  }
}
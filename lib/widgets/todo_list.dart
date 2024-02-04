import 'package:flutter/material.dart';

import 'package:my_to_do_list/model/todo.dart';
import 'package:my_to_do_list/widgets/todo_item.dart';

class ToDoList extends StatelessWidget{
   const ToDoList({super.key, 
                  required this.todolist,
                  required this.onRemoveToDo,  
                  });

  final List<ToDo> todolist;
  final void Function(ToDo todo) onRemoveToDo;
  

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: todolist.length,
      itemBuilder: (ctx,index) => 
      ToDoItem(todo: todolist[index], deleteFunction: (context)=>onRemoveToDo(todolist[index]))

      //  Dismissible(
      //   key: ValueKey(todolist[index]), 
      //   onDismissed: (direction) => {onRemoveToDo(todolist[index])},
      //   child: ToDoItem(todo: todolist[index],)
        
      );
    
   
  }
}
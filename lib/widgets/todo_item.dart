import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do_list/model/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoItem extends StatelessWidget{
  const ToDoItem ({super.key,required this.todo,required this.deleteFunction});
   final Function( BuildContext) deleteFunction;

  final ToDo todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion:  const StretchMotion(),
          children: [
            SlidableAction(
              icon: Icons.delete,
              backgroundColor: Colors.black,
              // foregroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
              onPressed: deleteFunction
              )

          ]),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          shadowColor:  Colors.black,
          color: const Color(0xffFF9BD2),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 30
              ),
              child: Row(
                children: [
                  Text(todo.title,
                  style: GoogleFonts.kanit(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: const Color(0xff402B3A)
                  ),
                  ),
                  const Spacer(),
                  Icon(categoryIcons[todo.category]),
                  const SizedBox(width: 20,),
                  Text(todo.formattedDate,
                  style: const TextStyle(color: Color(0xff402B3A),fontSize: 15),)
                ],
              ),
              ),
        ),
      ),
    );
  }
}
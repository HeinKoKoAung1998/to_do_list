import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do_list/model/todo.dart';

class NewToDo extends StatefulWidget{
  const NewToDo ({super.key,required this.onAddToDo});
  final void Function(ToDo todo) onAddToDo;

  @override
  State<NewToDo> createState() {
    return _NewToDoState();
  }
}

class _NewToDoState extends State<NewToDo>{

  final _titleController = TextEditingController();

  DateTime? _selectedDate;
  Category _selectedCategory = Category.sports;

 void _presentDatePicker() async {
    final now = DateTime.now();
    final lastDate = DateTime(now.year+3, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context, 
      initialDate: now,
      firstDate: now, 
      lastDate: lastDate
      );

      setState(() {
        _selectedDate = pickedDate;
      });
 }
 
 void _submitToDoData(){

  if(_titleController.text.trim().isEmpty || _selectedDate == null ){
    showDialog(
      context: context, 
      builder: (context)=>
      AlertDialog(
        title: const Text('Invalid Input'),
        content: const Text('Please make sure a valid data. Add ToDo List and Select date complety!'),
        actions: [
          TextButton(
            onPressed: (){Navigator.pop(context);},
             child: const Text('Okay'))
        ],
      )
      );
      return;
  }

  widget.onAddToDo(
    ToDo(
      title: _titleController.text, 
      category: _selectedCategory, 
      date: _selectedDate!
      )
  );
  Navigator.pop(context);

 }

 @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
    return Padding(
      
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 80
      ),
      child: Column(children: [TextField(
        keyboardType: TextInputType.text,
        controller: _titleController,
        maxLength: 15,
        textAlign: TextAlign.center,
        decoration: InputDecoration(labelText: "Add Your ToDo List",
        )
      ),
       Row(children: [
        Expanded(
          child: Row(children: [
            DropdownButton(
              iconSize: 40,
              borderRadius: BorderRadius.circular(20),
              dropdownColor: Color(0xffD63484),
              // focusColor: Colors.white,
              // focusColor: Colors.black,
              value: _selectedCategory,
              items: Category.values.map((category) => 
                      DropdownMenuItem(
                        // alignment: Alignment.center,
                        value: category,
                        child: 
                      Text(category.name.toUpperCase(),
                         style: GoogleFonts.ubuntu(color: Color(0xff402B3A)),
                        //  selectionColor: Color(0xffF8F4EC),
                      ))).toList(), 
              onChanged: (value){
                if(value == null){return;}
                setState(() {
                  _selectedCategory = value;
                });
              }),

            const Spacer(),
            Text(
              _selectedDate == null 
              ? 'Plese Select Date'
              : formatter.format(_selectedDate!)
            ),
            IconButton(onPressed: _presentDatePicker, icon: const Icon(Icons.calendar_month_outlined))    
            
          ],),
          
          )
      ],),
      const SizedBox(height: 50,),

         Row(children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 35),
            backgroundColor: const Color(0xffD63484),
            foregroundColor: const Color(0xffF8F4EC)
            ),
          onPressed: (){_submitToDoData();},
          child:  Text('Add List',
                  style: GoogleFonts.orbitron(fontWeight: FontWeight.bold),
          )),
          const Spacer(),
          ElevatedButton(
            onPressed: (){Navigator.pop(context);},
            child:  Text('Cancel',
            style: GoogleFonts.orbitron(),))
      ],)
      
      ],) 
      );
  }
}
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoApp2()
    );
  }
}
class TodoApp2 extends StatefulWidget{

  const TodoApp2({super.key});
  @override
  State createState()=>_TodoApp2State();
}

 class ToDoModelClass{
   String title;
   String description;
   String date;


  ToDoModelClass({
     required this.title,
    required this.description,
     required this.date
        });

         Map<String,dynamic>toDoMap(){
    return{
      'title':title,
      'description':description,
      'date':date
    };
  }
 }
  // @override
  // String toString(){
  //   return '{title:$title,description:$description,date:$date}';
//}


class _TodoApp2State extends State{

 final  TextEditingController _titleEditingController=TextEditingController();
 final  TextEditingController _descriptionEditingController=TextEditingController();
 final  TextEditingController _dateEditingController=TextEditingController();

  // @override
  // void initState() {
    
  //   super.initState();
  //   createDatabase();
  // }
final _formKey=GlobalKey<FormState>();

 List <ToDoModelClass>todoList=[
    ToDoModelClass(
      title:"take Notes",
      description:"take notes of every App",
      date:"02 feb 2024"
    ),
    

  ];
  void submit(bool doedit,[ToDoModelClass? toDoModelClass]){

    if(_titleEditingController.text.trim().isNotEmpty&&
     _descriptionEditingController.text.trim().isNotEmpty &&
     _dateEditingController.text.trim().isNotEmpty  ){


                 if(!doedit){
                     setState(() {
                        todoList.add(
                            ToDoModelClass(title: _titleEditingController.text.trim(),
                                          description:_descriptionEditingController.text.trim(),
                                           date:_dateEditingController.text.trim()
              ),
          );
          
        }
        
        );
      }
      else{
        setState(() {
          toDoModelClass!.title=_titleEditingController.text.trim();
            toDoModelClass.description=_descriptionEditingController.text.trim();
              toDoModelClass.date=_dateEditingController.text.trim();
        });
      }
     }
     clearController();

  }

    void clearController(){
          _titleEditingController.clear();
          _descriptionEditingController.clear();
          _dateEditingController.clear();
        }

        //Remove notes
void removeTask(ToDoModelClass toDoModelClass){
  setState(() {
     todoList.remove(toDoModelClass);
  });
 
}
void editTask(ToDoModelClass toDoModelClass){                            //for editing purpuse
   _titleEditingController.text=toDoModelClass.title;
   _descriptionEditingController.text=toDoModelClass.description;
   _dateEditingController.text=toDoModelClass.date;


   showbottom(true,toDoModelClass);
}

@override
void dispose(){
  super.dispose();
  _titleEditingController.dispose();
  _descriptionEditingController.dispose();
  _dateEditingController.dispose();
}





  void showbottom(bool doedit,[ ToDoModelClass?toDoModelClass]){
    showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)
              ),
            ),
            isDismissible: true,
            
            context:this. context,
           builder:(BuildContext context){
            return Padding(padding: EdgeInsets.only(
              left: 20,
              right: 20,
           bottom: MediaQuery.of(context).viewInsets.bottom
            
            ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
               mainAxisSize: MainAxisSize.min,
                children: [
                    Text("Create To-Do",
                  style: GoogleFonts.quicksand(
                    fontSize: 22,
                    fontWeight:FontWeight.w600
                  ),
                  
                  ),
                  const  SizedBox(
                    height: 10,
                    
                     ),

                  Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                    
                

               Text("Title",
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      fontWeight:FontWeight.w600,
                      color:const  Color.fromRGBO(89, 57, 241, 1)
                    ),
                       
                    ),

                
                  TextField(
                    controller:_titleEditingController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 139,148, 1)
                        )
                      ),
                      hintText: "Enter title",
                      

                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.purpleAccent
                        ),
                        borderRadius: BorderRadius.circular(12), 
                      ),
                      
                       ),
                  cursorColor: Colors.amber,
                  textInputAction: TextInputAction.done,
                 
                  ),
                const SizedBox(
                  height: 10,
                ),

              Text("Discription",
              style: GoogleFonts.quicksand(
                      fontSize: 16,
                      fontWeight:FontWeight.w600,
                      color:const  Color.fromRGBO(89, 57, 241, 1))
              ),

                TextField(
                    controller:_descriptionEditingController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 139,148, 1)
                        )
                      ),
                      hintText: "Enter Discription",
                      

                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.purpleAccent
                        ),
                        borderRadius: BorderRadius.circular(12), 
                      ),
                      
                       ),
                  cursorColor: Colors.amber,
                  textInputAction: TextInputAction.done,
                 
                  ),
                const  SizedBox(
                    height: 10,
                  ),


                  Text("Date",
                  style: GoogleFonts.quicksand(
                      fontSize: 16,
                      fontWeight:FontWeight.w600,
                      color:const  Color.fromRGBO(89, 57, 241, 1))
                  ),

               TextField(
                    controller: _dateEditingController,
                    readOnly:true,
                    decoration:  InputDecoration(
                      suffixIcon: const Icon(Icons.date_range_rounded),
                      focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 139,148, 1)
                        )
                      ), 
                      hintText: "MM/DD/YYYY",
                      
                      border: OutlineInputBorder(
                   
                        borderSide: const  BorderSide(
                          color: Colors.purpleAccent,

                        ),
                        borderRadius: BorderRadius.circular(12)
                      
                      ),

                    ),
                 
                  
                  onTap: ()async {
                    DateTime?Pickeddate=await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                     firstDate: DateTime(2020),
                      lastDate:DateTime(2025));

                   String formatDated=
                       DateFormat.yMMMd().format(Pickeddate!);
                      setState(() {
                      _dateEditingController.text=formatDated;
                      });
                    
                  },
                 
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  
                 
                ],


               ),

               
                Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      
                      
                      ),
                      
                    //color: Color.fromRGBO(0, 139, 148, 1),
                    
                    child:ElevatedButton( 
                      style:  ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        backgroundColor:const Color.fromRGBO(89, 57, 241, 1)
                      ),
                    
              
                      onPressed: (){
                        setState(() {
                        doedit?submit(doedit,toDoModelClass):submit(doedit); 
                          
                        });
                        

                       
                        
                        Navigator.of(context).pop();
                      }, 
                    
                    
                    child:Text("Submit",
                    
                    style: GoogleFonts.inter(fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                    
                    )
                    ),
                     ),
                ),

                  
                  const SizedBox(
                    height: 30,
                  )
                   ])
            );
          });
       

  }
  @override
  Widget build(BuildContext context ){
    return Scaffold(
      backgroundColor:const  Color.fromRGBO(111, 81, 255, 1),
     body:Padding(
      
      padding:const EdgeInsets.only(
        top: 100
      ), 

     child:Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      
      children: [

        const   SizedBox(height: 20,),

      
           Container(
           
            padding: const EdgeInsets.only(
             left: 35,
            ),
             child:Text(" Good Morning",
            style:GoogleFonts.quicksand(
              color:Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.w400,
              
            ),
            ),
          ),
          const SizedBox(height: 5),
          
       Container(
        padding: const EdgeInsets.only(
          left: 35
        ),
       
        child:Text("Shiv",
        style: GoogleFonts.quicksand(
          color:Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w600
        ),
        
        ),
      ),
      const SizedBox(height: 20,),



     Expanded(
       child: Container(
        height: 800,
        width: double.infinity,
        decoration:const  BoxDecoration(
          color: Color.fromRGBO(217, 217, 217, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40)
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

             Text("CREATE TO DO TASK",
            style: GoogleFonts.quicksand(
              fontWeight:FontWeight.w600,
              fontSize:14,
            ),),
            const SizedBox(height: 5),

            Expanded(
              child:Container(
                padding: const EdgeInsets.only( top: 20),
                decoration:const  BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                  ),
                   color: Colors.white,
                ),
                child: ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder:((context, index) {
                    return Slidable(

                      closeOnScroll: true,
                      endActionPane: ActionPane(motion: const DrawerMotion(),
                       children:[
                        Expanded(
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                             const  SizedBox(height:5),
                             GestureDetector(
                              onTap: () {
                                  editTask(todoList[index]);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(89,57,241,1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                             ),
                             const SizedBox(
                              height: 5,
                             ),

                              GestureDetector(
                                onTap: () {
                                  
                                 removeTask(todoList[index]);
                                
                                },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(89,57,241,1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 20,
                                  
                                ),
                              ),
                             ),
                             const SizedBox(
                              height: 5,
                             ),



                            ],
                            ) 
                        )
                       ]
                       ),
                       key:ValueKey(index),
                       child: Expanded(child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255,255,255,1),
                          border: Border.all(
                            color:const  Color.fromRGBO(0,0,0,0.5),
                            width: 0.5
                          
                          ),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 20,
                              color: Color.fromRGBO(0, 0, 0, 0.13),
                            )
                            
                          ],
                          borderRadius: BorderRadius.circular(15)
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height:60,
                                  width: 60,
                                  decoration:const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:Colors.white
                                  ),
                                  child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS10PiEpYQQXrkwvjjNgpxhwsR4iiv2FHIbhYbg7yvqUkjC9P_k0YNYPCu0Hw&s"),
                                ),
                                const SizedBox(width: 10,),
                                SizedBox(
                                  width: 220,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    
                                    children: [

                                      Text(  todoList[index].title.trim(),
                                      style: GoogleFonts.inter(
                                        fontSize:15,
                                        fontWeight:FontWeight.w500,
                                        color:Colors.black
                                      ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(  todoList[index].description.trim(),
                                      style: GoogleFonts.inter(
                                        fontSize:12,
                                        fontWeight:FontWeight.w400
                                      ),
                                      ),
                                      const SizedBox(height: 20),

                                       Row(
                                children: [
                                 Text(
                                  
                                  todoList[index].date.trim(),
                                 style: GoogleFonts.quicksand(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500
                                 ),
                                 ),
                               const   Spacer(
                                  flex: 1,
                                 ),
                              
                                const  SizedBox(
                                  width: 5,
                                 ),
                                
                                ],
                              )
                                    ],
                                  ),
                                  
                                ),
                                Checkbox(value: true,
                                 shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),

                                 ),
                                 activeColor: Colors.green,
                                 onChanged: (value) {
                                   
                                 },
                                 )
                                
                              ],
                            )
                          ],
                        ),
                       ),
                    )
                    );
                  }
                  ) 
                  
                  ),
              
              
              ) 
              
              )

          ],
        ),
       ),
     )

      ],

        


     ),  
       ),

       floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(89,57,241,1
       ),
       onPressed: ()async {
      showbottom(false);
         
       },
       child: const Icon(
        size: 50,
        color: Colors.white,
        Icons.add
       ),
          )
    );
        
      


    
  }
}

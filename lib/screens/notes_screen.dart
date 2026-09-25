import 'package:dmsn/database/notes_db.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  NotesDB? notesDB;
  
  @override
  void initState() {
    super.initState();
    notesDB = NotesDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: notesDB!.SELECT(), 
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Center(child: Text('Si trae datos'));
          }else{
            if( snapshot.hasError ){
              return Text(snapshot.error.toString());
            }else{
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.note),
        onPressed: ()=> Navigator.pushNamed(context, "/add")
      ),
    );
  }
}
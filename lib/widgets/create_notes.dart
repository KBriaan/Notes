import 'package:flutter/material.dart';
import 'package:flutter_notes/models/note_model.dart';

class CreateNote extends StatefulWidget {
  final Function(Note) onNewNoteCreated;
  const CreateNote({super.key, required this.onNewNoteCreated});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final titleController =TextEditingController();
    final bodyController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('New note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Title'),
            ),
          const  SizedBox( height: 20,),
              TextFormField(
                controller: bodyController,
              style: const TextStyle(
                fontSize: 18,
              ),
              
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Your story'),
            ),
          ],
        ),
      ),
     floatingActionButton:FloatingActionButton(onPressed: (){
      if ( titleController.text.isEmpty) {
        return;
        
      }
      if (bodyController.text.isEmpty) {
        return;
        
      }
      final note =Note(title: titleController.text, 
      body: bodyController.text);
      widget.onNewNoteCreated(note);
      Navigator.of(context).pop();
     },
     child: const Icon(Icons.save),backgroundColor: Colors.teal,) , 
    );
  }
}

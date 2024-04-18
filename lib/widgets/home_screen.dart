import 'package:flutter/material.dart';
import 'package:flutter_notes/models/note_model.dart';
import 'package:flutter_notes/widgets/create_notes.dart';
import 'package:flutter_notes/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {


  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Your notes"),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteCard(
              note: notes[index], index: index, onNoteDeleted: onNoteDeleted);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreateNote(
                    onNewNoteCreated: onNewNoteCreated,
                  )));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void onNewNoteCreated(Note note) {
    notes.add(note);
    setState(() {});
  }

  void onNoteDeleted(int index) {
    notes.removeAt(index);
    setState(() {});
  }
}

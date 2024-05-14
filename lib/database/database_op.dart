import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:noteboy/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NotedataBase extends ChangeNotifier {
  late Isar isar;
  List<Note> currentNotes = [];

  //I N I T I A L I S E

  Future<void> initialise() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );

    // C R E A T I N G
    Future<void> createNote(Note newNote) async {
      await isar.writeTxn(() => isar.notes.put(newNote));

      await fetchNotes();
    }
  }

  //R E A D I N G
  Future<void> fetchNotes() async {
    List<Note> fetchedote = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedote);
  }

  // U P D A T E
  Future<void> updateNote(int id, String? newTitle, String? newContent) async {
    final editingNote = await isar.notes.get(id);
    if (editingNote == null) {
      editingNote?.title = newTitle!;
    }
    // ignore: unnecessary_null_comparison
    else if (editingNote.content == null) {
      editingNote.content = newContent!;
    } else {
      await isar.writeTxn(() => isar.notes.put(
          Note(title: newTitle!, content: newContent!, time: DateTime.now())));
    }
    fetchNotes();
  }

  // D E L E T E
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    fetchNotes();
  }

  //  D E L E T E   ALL
  Future<void> deleteAll() async {
    isar.writeTxn(() => isar.notes.clear());
  }
}

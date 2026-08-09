import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_hti/screens/note.dart';
import 'package:project_hti/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(NoteAdapter());

  await Hive.openBox<Note>('notesBox');

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
}

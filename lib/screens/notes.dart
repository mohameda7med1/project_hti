import 'package:hive_flutter/hive_flutter.dart';
import 'note.dart';

final Box<Note> notesBox = Hive.box<Note>("notesBox");
List<Note> notes = notesBox.values.toList();

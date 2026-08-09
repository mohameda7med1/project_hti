import 'package:flutter/material.dart';
import 'note.dart';
import 'notes.dart';

class AddNoteScreen extends StatefulWidget {
  final Note? noteToEdit;
  final int? index;

  const AddNoteScreen({super.key, this.noteToEdit, this.index});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController subjectController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TextDirection getTextDirection(String text) {
    final arabic = RegExp(r'[\u0600-\u06FF]');
    final english = RegExp(r'[A-Za-z]');

    for (final char in text.characters) {
      if (arabic.hasMatch(char)) {
        return TextDirection.rtl;
      }

      if (english.hasMatch(char)) {
        return TextDirection.ltr;
      }
    }

    return TextDirection.ltr;
  }

  @override
  void initState() {
    super.initState();

    if (widget.noteToEdit != null) {
      subjectController.text = widget.noteToEdit!.subject;
      titleController.text = widget.noteToEdit!.title;
      descriptionController.text = widget.noteToEdit!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FC),

      appBar: AppBar(
        backgroundColor: const Color(0xFF4338CA),
        foregroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          "Add Note",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.all(7),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton.icon(
                onPressed: () {
                  Note newNote = Note(
                    subject: subjectController.text,
                    title: titleController.text,
                    description: descriptionController.text,
                    date: DateTime.now(),
                  );

                  if (widget.noteToEdit != null) {
                    notes[widget.index!] = newNote;
                    notesBox.putAt(widget.index!, newNote);
                  } else {
                    notes.add(newNote);
                    notesBox.add(newNote);
                  }

                  Navigator.pop(context);

                  print(subjectController.text);
                  print(titleController.text);
                  print(descriptionController.text);
                },
                icon: const Icon(
                  Icons.save_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                label: const Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Subject",
                style: TextStyle(
                  fontSize: 20,
                  color: const Color(0xFF111827),
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: subjectController,
                  textDirection: getTextDirection(subjectController.text),
                  textAlign:
                      getTextDirection(subjectController.text) ==
                          TextDirection.rtl
                      ? TextAlign.right
                      : TextAlign.left,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Subject",
                    hintStyle: const TextStyle(
                      fontSize: 17,
                      color: Color(0xFF9CA3AF),
                    ),
                    filled: true,
                    fillColor: Colors.white,

                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 16,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                        color: Color(0xFFE5E7EB),
                        width: 1.2,
                      ),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                        color: Color(0xFFE5E7EB),
                        width: 1.2,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                        color: Color(0xFF4338CA),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Text(
                "Title",
                style: TextStyle(
                  fontSize: 20,
                  color: const Color(0xFF111827),
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: titleController,
                  textDirection: getTextDirection(titleController.text),
                  textAlign:
                      getTextDirection(titleController.text) ==
                          TextDirection.rtl
                      ? TextAlign.right
                      : TextAlign.left,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: "Enter title",
                    hintStyle: const TextStyle(
                      fontSize: 17,
                      color: Color(0xFF9CA3AF),
                    ),
                    filled: true,
                    fillColor: Colors.white,

                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 16,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                        color: Color(0xFFE5E7EB),
                        width: 1.2,
                      ),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                        color: Color(0xFFE5E7EB),
                        width: 1.2,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                        color: Color(0xFF4338CA),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Text(
                "Description",
                style: TextStyle(
                  fontSize: 20,
                  color: const Color(0xFF111827),
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: descriptionController,
                  textDirection: getTextDirection(descriptionController.text),
                  textAlign:
                      getTextDirection(descriptionController.text) ==
                          TextDirection.rtl
                      ? TextAlign.right
                      : TextAlign.left,
                  onChanged: (value) {
                    setState(() {});
                  },
                  maxLength: 1000,
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: "Enter your note here",
                    hintStyle: const TextStyle(
                      fontSize: 17,
                      color: Color(0xFF9CA3AF),
                    ),
                    filled: true,
                    fillColor: Colors.white,

                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 16,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                        color: Color(0xFFE5E7EB),
                        width: 1.2,
                      ),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                        color: Color(0xFFE5E7EB),
                        width: 1.2,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                        color: Color(0xFF4338CA),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

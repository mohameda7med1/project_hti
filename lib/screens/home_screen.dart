import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_note_screen.dart';
import 'notes.dart';
import 'details_note.dart';
import 'about_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextDirection getTextDirection(String text) {
    final arabic = RegExp(r'[\u0600-\u06FF]');
    final english = RegExp(r'[A-Za-z]');

    for (final rune in text.runes) {
      final char = String.fromCharCode(rune);

      if (arabic.hasMatch(char)) {
        return TextDirection.rtl;
      }

      if (english.hasMatch(char)) {
        return TextDirection.ltr;
      }
    }

    return TextDirection.ltr;
  }

  TextAlign getTextAlign(String text) {
    return getTextDirection(text) == TextDirection.rtl
        ? TextAlign.right
        : TextAlign.left;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FC),

      appBar: AppBar(
        backgroundColor: const Color(0xFF4338CA),
        elevation: 0,
        centerTitle: false,

        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.school_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),

        title: Text(
          "Student Notes",
          style: GoogleFonts.poppins(
            fontSize: 23,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),

        actions: [
          PopupMenuButton(
            iconColor: Colors.white,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onSelected: (value) {
              if (value == "about") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutApp()),
                );
              }
            },
            itemBuilder: (context) {
              return [PopupMenuItem(value: "about", child: Text("About App"))];
            },
          ),
        ],
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddNoteScreen()),
            );

            setState(() {});
          },
          backgroundColor: const Color(0xFF4338CA),
          elevation: 5,
          shape: const CircleBorder(),
          child: const Icon(Icons.add_rounded, color: Colors.white, size: 32),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 95,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFEDE9FE), Color(0xFFF5F3FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(22),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x12000000),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(
                        Icons.light_mode_rounded,
                        color: Color(0xFF4338CA),
                        size: 38,
                      ),
                    ),

                    const SizedBox(width: 16),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Better notes. Better future,",
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF4338CA),
                            height: 1.2,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          "Keep learning, keep growing!",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: const Color(0xFF6B7280),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              "My Notes",
              style: GoogleFonts.poppins(
                fontSize: 23,
                color: const Color(0xFF111827),
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 5),

            Container(
              height: 4,
              width: 55,
              decoration: BoxDecoration(
                color: const Color(0xFF4338CA),
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 6,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NoteDetailsScreen(note: note),
                          ),
                        );
                      },

                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFE5E7EB),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x12000000),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),

                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 16,
                            top: 12,
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Expanded(
                                    child: Text(
                                      note.subject,
                                      textDirection: getTextDirection(
                                        note.subject,
                                      ),
                                      textAlign: getTextAlign(note.subject),
                                      style: GoogleFonts.poppins(
                                        fontSize: 21,
                                        color: const Color(0xFF111827),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),

                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AddNoteScreen(
                                                    noteToEdit: note,
                                                    index: index,
                                                  ),
                                            ),
                                          );

                                          setState(() {});
                                        },

                                        icon: const Icon(
                                          Icons.edit_outlined,
                                          size: 25,
                                          color: Color(0xFF4A3AFF),
                                        ),

                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                      ),

                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            notes.removeAt(index);
                                            notesBox.deleteAt(index);
                                          });
                                        },

                                        icon: const Icon(
                                          Icons.delete_forever_outlined,
                                          size: 25,
                                          color: Color(0xFFE53935),
                                        ),

                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  note.title,
                                  textDirection: getTextDirection(note.title),
                                  textAlign: getTextAlign(note.title),
                                  style: GoogleFonts.poppins(
                                    fontSize: 19,
                                    color: const Color(0xFF4338CA),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 4),

                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  note.description,
                                  textDirection: getTextDirection(
                                    note.description,
                                  ),
                                  textAlign: getTextAlign(note.description),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: const Color(0xFF6B7280),
                                    height: 1.4,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                "${note.date.day}/${note.date.month}/${note.date.year}",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: const Color(0xFF9CA3AF),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

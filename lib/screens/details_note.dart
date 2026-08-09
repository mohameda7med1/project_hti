import 'package:flutter/material.dart';
import 'note.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteDetailsScreen extends StatelessWidget {
  final Note note;

  const NoteDetailsScreen({super.key, required this.note});

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
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Note Details",
          style: GoogleFonts.poppins(
            fontSize: 23,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE5E7EB)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x12000000),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      note.subject,
                      textDirection: getTextDirection(note.subject),
                      textAlign: getTextAlign(note.subject),
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF111827),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    width: 55,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4338CA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      note.title,
                      textDirection: getTextDirection(note.title),
                      textAlign: getTextAlign(note.title),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4338CA),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F3FF),
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        note.description,
                        textDirection: getTextDirection(note.description),
                        textAlign: getTextAlign(note.description),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF374151),
                          fontWeight: FontWeight.w500,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

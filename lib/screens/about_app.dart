import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FC),

      appBar: AppBar(
        backgroundColor: const Color(0xFF4338CA),
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "About App",
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 95,
                height: 95,
                decoration: BoxDecoration(
                  color: const Color(0xFFEDE9FE),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x12000000),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.school_rounded,
                  color: Color(0xFF4338CA),
                  size: 55,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: Text(
                "Student Notes",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF4338CA),
                ),
              ),
            ),

            const SizedBox(height: 8),

            Center(
              child: Text(
                "Better notes. Better future.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: const Color(0xFF6B7280),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              "About the App",
              style: GoogleFonts.poppins(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF111827),
              ),
            ),

            const SizedBox(height: 8),

            Container(
              width: 55,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFF4338CA),
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            const SizedBox(height: 14),

            Text(
              "Student Notes is a simple and organized notes application "
              "designed to help students create, manage, and review their "
              "study notes easily.",
              style: GoogleFonts.poppins(
                fontSize: 15,
                height: 1.7,
                color: const Color(0xFF4B5563),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              "What You Can Do",
              style: GoogleFonts.poppins(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF111827),
              ),
            ),

            const SizedBox(height: 8),

            Container(
              width: 55,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFF4338CA),
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            const SizedBox(height: 14),

            Text(
              "• Create new notes with a subject, title, and description.\n\n"
              "• View your saved notes directly from the home screen.\n\n"
              "• Open a note to read the complete description.\n\n"
              "• Edit existing notes whenever you need to update them.\n\n"
              "• Delete notes that you no longer need.\n\n"
              "• Keep your study information organized in one simple place.",
              style: GoogleFonts.poppins(
                fontSize: 15,
                height: 1.7,
                color: const Color(0xFF4B5563),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              "Why Student Notes?",
              style: GoogleFonts.poppins(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF111827),
              ),
            ),

            const SizedBox(height: 8),

            Container(
              width: 55,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFF4338CA),
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            const SizedBox(height: 14),

            Text(
              "The application was created with simplicity and ease of use "
              "in mind. Students can quickly write down important information "
              "and come back to it whenever they need it. The clean interface "
              "helps keep notes easy to read and manage without unnecessary "
              "complications.",
              style: GoogleFonts.poppins(
                fontSize: 15,
                height: 1.7,
                color: const Color(0xFF4B5563),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              "Application Features",
              style: GoogleFonts.poppins(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF111827),
              ),
            ),

            const SizedBox(height: 8),

            Container(
              width: 55,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFF4338CA),
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            const SizedBox(height: 14),

            Text(
              "• Simple and clean user interface.\n\n"
              "• Easy note creation and management.\n\n"
              "• Edit and delete functionality.\n\n"
              "• Notes are displayed in an organized list.\n\n"
              "• Each note includes its creation date.\n\n"
              "• Designed to be simple and comfortable for students.",
              style: GoogleFonts.poppins(
                fontSize: 15,
                height: 1.7,
                color: const Color(0xFF4B5563),
              ),
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFEDE9FE),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFDDD6FE)),
              ),
              child: Column(
                children: [
                  Text(
                    "Version",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF4338CA),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "1.0.0",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Center(
              child: Text(
                "Made with Flutter",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: const Color(0xFF6B7280),
                ),
              ),
            ),

            const SizedBox(height: 5),

            Center(
              child: Text(
                "By Mohamed Ahmed",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF4338CA),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

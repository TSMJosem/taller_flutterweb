import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    children: [
                      if (constraints.maxWidth > 600)
                        NavigationPanel(),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Contenido principal',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class NavigationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.teal[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          navButton(Icons.home, 'Inicio', () {}),
          navButton(Icons.work, 'Proyectos', () {}),
          navButton(Icons.share, 'Compartido', () {}),
          const Spacer(),
          navButton(Icons.settings, 'Configuración', () {}),
          navButton(Icons.group, 'Invitar miembros', () {}),
        ],
      ),
    );
  }

  InkWell navButton(IconData icon, String text, Function onPressed) {
    return InkWell(
      onTap: () {
        onPressed();
        print(text);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue[400]),
            const SizedBox(width: 10),
            Text(text, style: TextStyle(color: Colors.teal[700], fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[300],
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Text(
          'Footer',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
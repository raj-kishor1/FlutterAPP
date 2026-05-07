import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  String note = "";

  final TextEditingController controller = TextEditingController();

  void increaseCounter() {
    setState(() {
      counter++;
    });
  }

  void saveNote() {
    setState(() {
      note = controller.text;
    });
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My First Flutter App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Text(
              "Counter: $counter",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: increaseCounter,
              child: const Text("Increase Counter"),
            ),

            const SizedBox(height: 40),

            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter a note",
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: saveNote,
              child: const Text("Save Note"),
            ),

            const SizedBox(height: 20),

            Text(
              "Saved Note:",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),

            const SizedBox(height: 10),

            Text(
              note,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
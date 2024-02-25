import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 205, 214, 227),
        appBar: AppBar(
          title: const Text('Database by vsrkvpolina'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Text(
              'This is a main screen',
              style: TextStyle(color: Color.fromARGB(255, 12, 28, 54)),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context,
                      '/vstrkvpolina'); // на одну страницу накладывается другая
                },
                child: const Text(
                  'Bar',
                  style: TextStyle(color: Color.fromARGB(255, 12, 28, 54)),
                )), // bar
          ],
        ));
  }
}

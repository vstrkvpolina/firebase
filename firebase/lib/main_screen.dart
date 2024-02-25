import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TODO by vsrkvpolina',
          style: TextStyle(fontFamily: 'Arial Black', color: Color.fromARGB(255, 224, 227, 232)),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 152, 172, 199),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://tr.rbxcdn.com/3a055c5dff44e4b37fa1d606f9d8ab19/420/420/Hat/Png',
            fit: BoxFit.contain,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'This is a main screen',
                  style: TextStyle(
                    color: Color.fromARGB(255, 12, 28, 54),
                    fontFamily: 'Arial Black',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/vstrkvpolina');
                  },
                  child: const Text(
                    'Bar',
                    style: TextStyle(
                      color: Color.fromARGB(255, 12, 28, 54),
                      fontFamily: 'Arial Black',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: MainScreen(),
    ),
  );
}




// import 'package:flutter/material.dart';

// class MainScreen extends StatelessWidget {
//   const MainScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color.fromARGB(255, 205, 214, 227),
//         appBar: AppBar(
//           title: const Text('Database by vsrkvpolina'),
//           centerTitle: true,
//         ),
//         body: Column(
//           children: [
//             const Text(
//               'This is a main screen',
//               style: TextStyle(color: Color.fromARGB(255, 12, 28, 54)),
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context,
//                       '/vstrkvpolina'); // на одну страницу накладывается другая
//                 },
//                 child: const Text(
//                   'Bar',
//                   style: TextStyle(color: Color.fromARGB(255, 12, 28, 54)),
//                 )), // bar
//           ],
//         ));
//   }
// }

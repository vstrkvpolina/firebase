import 'package:flutter/material.dart';
import 'package:firebase/home.dart';
import 'package:firebase/main_screen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 12, 28, 54),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/vstrkvpolina': (context) => const Home(),
      },
    ));

// void InitFirebase() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
// }

// void main() async {
//   InitFirebase();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color.fromARGB(255, 193, 197, 203),
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Database by vsrkvpolina',
//             style: TextStyle(fontFamily: 'Arial Black', fontSize: 35),
//           ),
//           centerTitle: true,
//         ),
//         body: Row(
//           children: [
            
//           ],
//         ),
//         //Container(
//           // child: Image( 
//           //   image: NetworkImage('https://tr.rbxcdn.com/3a055c5dff44e4b37fa1d606f9d8ab19/420/420/Hat/Png'),)
//           // child: IconButton(
//           //   iconSize: 72,
//           //   icon: const Icon(Icons.favorite, color: Color.fromARGB(255, 193, 197, 203),),
//           //   onPressed: () => const Color.fromARGB(255, 225, 151, 167),
//           // ),
//           //  child: Icon(Icons.heart_broken_rounded,
//           //       size: 40, color: const Color.fromARGB(255, 193, 197, 203)),)
//         floatingActionButton: FloatingActionButton(
//           child: const Text(
//             'Press',
//             style: TextStyle(color: Color.fromARGB(255, 11, 34, 58)),
//           ),
//           backgroundColor: Color.fromARGB(255, 193, 197, 203),
//           onPressed: () => print('Pressed'),
//         ),
//       ),
//     );
//   }
// }

//         //FirebaseFirestore.instance.collection('collectionPath')// база данных к которой мы подключились

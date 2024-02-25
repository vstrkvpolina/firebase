// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// // import 'pages/firebase_options.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
  
//   late String _userDatabase;
//   List vstrkvPolinaList = [];

// //   void InitFirebase() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp(
// //     //options: DefaultFirebaseOptions.currentPlatform,
// //   );
// // }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     // InitFirebase();

//     vstrkvPolinaList.addAll(['Sleep well', 'eat well', 'think very well']);
//   }

//   void _menuOpen() {
//     Navigator.of(context)
//         .push(MaterialPageRoute(builder: (BuildContext context) {
//       return Scaffold(
//           appBar: AppBar(
//             title: const Text('Bar'),
//           ),
//           body: Row(
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     Navigator.pushNamedAndRemoveUntil(
//                         context, '/', (route) => false);
//                   },
//                   child: const Text('Main Screen')),
//               const Padding(padding: EdgeInsets.only(left: 15)),
//               const Text('Simple bar')
//             ],
//           ));
//     }));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 205, 214, 227),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 122, 139, 163),
//         title: const Text('Database by vsrkvpolina'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: _menuOpen,
//             icon: const Icon(Icons.menu_rounded),
//           )
//         ],
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('items').snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) return const Text('No entries');
//           return ListView.builder(
//             itemCount: snapshot.data?.docs.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Dismissible(
//                 //чтобы удалять свайпом
//                 key: Key(snapshot.data!.docs[index].id), //те данные которые мы получаем - snapshot
//                 child: Card(
//                   child: ListTile(
//                     trailing: IconButton(
//                         onPressed: () {
//                           FirebaseFirestore.instance.collection('items').doc(snapshot.data?.docs[index].id).delete();
//                         },
//                         icon: const Icon(
//                           Icons.delete_sweep,
//                           color: Color.fromARGB(255, 12, 28, 54),
//                         )),
//                     title: Text(snapshot.data?.docs[index].get('item')),
//                   ),
//                 ),
//                 onDismissed: (direction) {
//                   FirebaseFirestore.instance.collection('items').doc(snapshot.data?.docs[index].id).delete();
//                 },
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color.fromARGB(255, 57, 76, 106),
//         onPressed: () {
//           showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: const  Text('Add new database'),
//                   content: TextField(
//                     onChanged: (String val) {
//                       setState(() {
//                         _userDatabase = val;
//                       });
//                     },
//                   ),
//                   actions: [
//                     ElevatedButton(
//                       onPressed: () {
//                         FirebaseFirestore.instance
//                             .collection('items')
//                             .add({'item': _userDatabase});
//                         Navigator.of(context).pop;
//                       },
//                       child: const Text('add')
//                     ),
//                   ],
//                 );
//               });
//         },
//         child: const Icon(
//           Icons.add_box,
//           color:  Color.fromARGB(255, 12, 28, 54),
//         ),
//       ),
//     );
//   }
// }

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';

// // class Home extends StatefulWidget {
// //   const Home({super.key});

// //   @override
// //   State<Home> createState() => _HomeState();
// // }

// // class _HomeState extends State<Home> {
// //   //тут

// //   late String _userToDO;
// //   List todoList = [];

// //   @override
// //   void initState() {
// //     super.initState();

// //     todoList.addAll(['Buy Milk', 'Wash dishes', 'Купить картошку']);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey[900],
// //       appBar: AppBar(
// //         backgroundColor: Colors.amber,
// //         title: const Text("Список важных дел"),
// //         centerTitle: true,
// //       ),
// //       body: StreamBuilder(
// //         stream: FirebaseFirestore.instance.collection('items').snapshots(),
// //         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// //           if (!snapshot.hasData) return const Text('Нет записей');
// //           return ListView.builder(
// //             itemCount: snapshot.data?.docs.length,
// //             itemBuilder: (BuildContext context, int index) {
// //               return Dismissible(
// //                 //чтобы удалять свайпом
// //                 key: Key(snapshot.data!.docs[index].id), //те данные которые мы получаем - snapshot
// //                 child: Card(
// //                   child: ListTile(
// //                     trailing: IconButton(
// //                         onPressed: () {
// //                           FirebaseFirestore.instance.collection('items').doc(snapshot.data?.docs[index].id).delete();
// //                         },
// //                         icon: const Icon(
// //                           Icons.delete_sweep,
// //                           color: Colors.amber,
// //                         )),
// //                     title: Text(snapshot.data?.docs[index].get('item')),
// //                   ),
// //                 ),
// //                 onDismissed: (direction) {
// //                   FirebaseFirestore.instance.collection('items').doc(snapshot.data?.docs[index].id).delete();
// //                 },
// //               );
// //             },
// //           );
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         backgroundColor: Colors.amber,
// //         onPressed: () {
// //           showDialog(
// //               context: context,
// //               builder: (BuildContext context) {
// //                 return AlertDialog(
// //                   title: const Text('Добавить элемент'),
// //                   content: TextField(
// //                     onChanged: (String value) {
// //                       _userToDO = value;
// //                     },
// //                   ),
// //                   actions: [
// //                     ElevatedButton(
// //                         onPressed: () {
// //                           FirebaseFirestore.instance.collection('items').add({
// //                             'item': _userToDO
// //                           }); //добавление в базу то что ввел юзер

// //                           Navigator.of(context).pop();
// //                         },
// //                         child: const Text('Добавить'))
// //                   ],
// //                 );
// //               });
// //         },
// //         child: const Icon(
// //           Icons.add_box,
// //           color: Colors.white,
// //         ),
// //       ),
// //     );
// //   }
// // }

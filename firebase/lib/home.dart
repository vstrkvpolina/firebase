
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _userDatabase;
  List vstrkvpolina = [];

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initFirebase();

    vstrkvpolina.addAll(['Born house', 'build tree', 'imprison son']);
  }

  void _menuOpen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Menu,bruhh'),
        ),
        body: Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                child: const Text('bruh')),
            const Padding(padding: EdgeInsets.only(left: 15)),
            const Text('Menu, bitch'),
          ],
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 214, 227),
      appBar: AppBar(
        title: const Text(
            'A list of important things if you think there\'s something important in your life, duhh',
            style: TextStyle(fontFamily: 'Arial Black', color: Color.fromARGB(255, 224, 227, 232)),
            ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: _menuOpen, icon: const Icon(Icons.menu_book_rounded))
        ],
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('MyCollection').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) return const Text('No entries');
          return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(snapshot.data!.docs[index].id),
                  child: Card(
                    child: ListTile(
                      title:
                          Text(snapshot.data!.docs[index].get('MyCollection')),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 12, 28, 54),
                        ),
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('MyCollection')
                              .doc(snapshot.data!.docs[index].id)
                              .delete();
                        },
                      ),
                    ),
                  ),
                  onDismissed: (direction) {
                    //if(direction == DismissDirection.endToStart)
                    FirebaseFirestore.instance
                        .collection('MyCollection')
                        .doc(snapshot.data!.docs[index].id)
                        .delete();
                  },
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 12, 28, 54),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Add'),
                  content: TextField(
                    onChanged: (String value) {
                      setState(() {
                        _userDatabase = value;
                      });
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('MyCollection')
                              .add({'Man': _userDatabase});

                          // setState(() {
                          //   vstrkvpolina.add(_userDatabase);
                          // });

                          Navigator.of(context).pop();
                        },
                        child: const Text('add some thing',
                        style: TextStyle(fontFamily: 'Arial Black', color: Color.fromARGB(255, 224, 227, 232)),
                        ))
                  ],
                );
              });
        },
        child: const Icon(
          Icons.heart_broken_rounded,
          color: Color.fromARGB(255, 131, 148, 171),
        ),
      ),
    );
  }
}


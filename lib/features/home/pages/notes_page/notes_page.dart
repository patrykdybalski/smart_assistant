import 'package:flutter/material.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/detailed_notes/detailed_notes.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/general_notes/general_notes.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/password_screen/password_screen.dart';

import 'package:primary_school/features/home/pages/notes_page/screens/private_notes/private_notes.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  bool isPasswordRequired = false;
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0c1020),
      appBar: AppBar(
        title: const Text('Notatnik'),
        centerTitle: true,
        backgroundColor: const Color(0xff0c1020),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_circle_outline_outlined,
              size: 35,
              color: Color(0xff2693f9),
            ),
            padding: const EdgeInsets.only(right: 5),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Utwórz hasło'),
                    content: TextField(
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      obscureText: true,
                      maxLength: 4,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: '****',
                        counterText: '',
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Anuluj'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            isPasswordRequired = true;
                          });
                        },
                        child: const Text('Zatwierdź'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.add_circle_outline_outlined,
              size: 35,
              color: Color(0xff2693f9),
            ),
            padding: const EdgeInsets.only(right: 5),
          ),
        ],
        bottom: TabBar(
            controller: tabController,
            labelPadding: const EdgeInsets.all(10),
            tabs: const [
              Text('Krótkie'),
              Text('Szczegółowe'),
              Text('Prywatne'),
            ],
            onTap: (index) {
              if (index == 2) {
                setState(() {
                  isPasswordRequired = true;
                });
              } else {
                setState(() {
                  isPasswordRequired = false;
                });
              }
            }),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          const GeneralNotes(),
          const DetailedNotesScreen(),
          isPasswordRequired
              ? const PasswordScreen()
              : const PrivateNotesScreen(),
        ],
      ),
    );
  }
}

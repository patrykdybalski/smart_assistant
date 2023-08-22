import 'package:flutter/material.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/features/home/pages/notes_page/add/add_note_page.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/general_notes/general_notes.dart';

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
    tabController = TabController(length: 2, vsync: this);
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
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text(
          'Notatki',
          style: TextStyle(
            color: AppColors.secondaryColor,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: AppColors.accentColor,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddNotePage(),
                fullscreenDialog: true,
              ));
            },
            icon: const Icon(
              Icons.add_circle_outline_outlined,
              size: 35,
              color: AppColors.redColor,
            ),
            padding: const EdgeInsets.only(right: 5),
          ),
        ],
      ),
      body: const GeneralNotes(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';
import 'package:primary_school/features/home/pages/notes_page/add/cubit/add_note_cubit.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

String? _title;
String? _subtitle;
Color pickerColor = Colors.transparent;
DateTime _createdDate = DateTime.now();

class _AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(NoteRepository()),
      child: BlocListener<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.errorMessage,
              ),
              backgroundColor: AppColors.redColor,
            ));
          }
        },
        child: BlocBuilder<AddNoteCubit, AddNoteState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColors.primaryColor,
              floatingActionButton: buildFabButtons(context),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniCenterFloat,
              body: _AddNotePageBody(
                onTitleChanged: (newValue) {
                  setState(() {
                    _title = newValue;
                  });
                },
                onSubtitleChange: (newValue) {
                  setState(() {
                    _subtitle = newValue;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Row buildFabButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildBackButton(context),
        buildColorPickerButton(context),
        buildSaveButton(context),
      ],
    );
  }

  FloatingActionButton buildBackButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      backgroundColor: AppColors.redColor2,
      mini: true,
      heroTag: null,
      child: const Icon(
        Icons.chevron_left_outlined,
        color: AppColors.secondaryColor,
        size: 25,
      ),
    );
  }

  FloatingActionButton buildColorPickerButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        return colorPickerDialog(context);
      },
      backgroundColor: AppColors.primaryColor,
      mini: true,
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.fabGradient,
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }

  FloatingActionButton buildSaveButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: _title == null || _subtitle == null
          ? null
          : () {
              context.read<AddNoteCubit>().add(
                    _title!,
                    _subtitle!,
                  );
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
      backgroundColor: AppColors.greenColor,
      heroTag: null,
      mini: true,
      child: const Icon(
        Icons.check_outlined,
        color: AppColors.secondaryColor,
      ),
    );
  }

  Widget buildColorPicekr() {
    return BlockPicker(
        pickerColor: pickerColor,
        availableColors: AppColors.availableColors,
        onColorChanged: (newColor) {
          setState(() {
            pickerColor = newColor;
          });
        });
  }

  void colorPickerDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: AppColors.primaryColor,
          elevation: 200,
          contentPadding: const EdgeInsets.all(5.0),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                  side: const BorderSide(
                    color: AppColors.greenColor,
                    width: 0.5,
                  ),
                ),
              ),
              child: const Text(
                'Wybierz',
                style: TextStyle(
                  color: AppColors.greenColor,
                  fontSize: 15,
                ),
              ),
              onPressed: () {
                setState(
                  () {
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ],
          content: buildColorPicekr(),
        ),
      );
}

class _AddNotePageBody extends StatelessWidget {
  const _AddNotePageBody({
    Key? key,
    required this.onTitleChanged,
    required this.onSubtitleChange,
  }) : super(key: key);

  final Function(String) onTitleChanged;
  final Function(String) onSubtitleChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            TextField(
              onChanged: onTitleChanged,
              minLines: 1,
              maxLines: 4,
              maxLength: 120,
              style: const TextStyle(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                counterText: '',
                hintText: 'Tytuł',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.redColor2,
                    width: 0.8,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.redColor2, width: 1.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.redColor2, width: 1.0),
                ),
                enabled: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: onSubtitleChange,
              minLines: 1,
              maxLines: 200,
              style: const TextStyle(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
              decoration: const InputDecoration(
                hintText: 'Wpisz treść notatki',
                border: InputBorder.none,
              ),
            )
          ],
        ),
      ),
    );
  }
}

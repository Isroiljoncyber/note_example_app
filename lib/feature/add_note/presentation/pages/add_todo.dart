import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_example_app/assets/constants/app_colors.dart';
import 'package:note_example_app/feature/home/domain/entities/note_entity.dart';
import 'package:note_example_app/feature/home/presentation/bloc/note_cubit.dart';
import 'package:note_example_app/feature/home/presentation/widgets/custom_button.dart';

class AddToDo extends StatefulWidget {
  const AddToDo({super.key, this.noteEntity, this.index});

  final NoteEntity? noteEntity;
  final int? index;

  @override
  State<AddToDo> createState() => _AddToDoPageState();
}

class _AddToDoPageState extends State<AddToDo> {
  late TextEditingController titleEditController;
  late TextEditingController contentEditingController;
  late String creationDateTime;

  final FocusNode focusNode = FocusNode();
  final FocusNode focusNodeContent = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.noteEntity != null) {
      titleEditController = TextEditingController(text: widget.noteEntity!.title);
      contentEditingController = TextEditingController(text: widget.noteEntity!.content);
      creationDateTime = DateFormat('MMM d, yyyy').format(DateTime.parse(widget.noteEntity!.createAt!));
    } else {
      titleEditController = TextEditingController();
      contentEditingController = TextEditingController();
      creationDateTime = DateFormat('MMM d, yyyy').format(DateTime.now());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (focusNode.hasFocus) {
          focusNode.unfocus();
        }
        if (focusNodeContent.hasFocus) {
          focusNodeContent.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: CustomButton(
            onTap: () {
              Navigator.of(context).pop();
            },
            icon: Icons.arrow_back_ios_new_rounded,
          ),
          actions: [
            if (widget.noteEntity != null)
              CustomButton(
                onTap: () {
                  if (widget.noteEntity != null) {
                    onDelete(context);
                  }
                },
                icon: Icons.delete_rounded,
                backGround: Colors.red.shade400,
              )
          ],
          elevation: 0,
        ),
        body: Scrollbar(
          thickness: 5,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  focusNode: focusNode,
                  controller: titleEditController,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                  // minLines: null,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: "Title of your ideas is here ...",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey.shade600,
                      )),
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    creationDateTime,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
                TextField(
                  focusNode: focusNodeContent,
                  controller: contentEditingController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      hintText: "Explain your idea in detail here...",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      )),
                ),
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
        floatingActionButton: CustomButton(
          onTap: () {
            if (widget.noteEntity != null) {
              widget.noteEntity!.title = titleEditController.text;
              widget.noteEntity!.content = contentEditingController.text;
              context
                  .read<NoteCubit>()
                  .updateNote(
                    widget.noteEntity!,
                    () => {},
                    (e) => {},
                    widget.index!,
                  )
                  .whenComplete(() {
                showSnack("Successfully saved", true);
                Navigator.of(context).pop();
              });
            } else if (titleEditController.text.isEmpty) {
              showSnack("Title is empty", false);
              focusNode.requestFocus();
            } else if (contentEditingController.text.length < 5) {
              showSnack("At least 5 characters", false);
              focusNodeContent.requestFocus();
            } else {
              final noteCubit = context.read<NoteCubit>();
              final noteEntity = NoteEntity(
                  title: titleEditController.text,
                  content: contentEditingController.text,
                  createAt: DateTime.now().toString());
              noteCubit.saveNote(
                noteEntity,
                () {
                  showSnack("Successfully saved", true);
                  Navigator.of(context).pop();
                },
                (e) {
                  showSnack("Error happened", false);
                },
              );
            }
          },
          icon: Icons.save_rounded,
          iconSize: 30,
          radius: 30,
          height: 60,
          width: 60,
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Future<dynamic> onDelete(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: AppColors.textGray,
          title: const Text("Do you want to delete ?"),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.of(_).pop();
              },
              child: const Text("No"),
            ),
            MaterialButton(
              onPressed: () {
                context.read<NoteCubit>().deleteNote(
                  widget.noteEntity!,
                  () {
                    showSnack("Successfully deleted", true);
                    Navigator.of(_).pop();
                    Navigator.of(context).pop();
                  },
                  (e) {},
                );
              },
              child: const Text("Yes"),
            )
          ],
        );
      },
    );
  }

  showSnack(String message, bool isSuccess) {
    final snackBar = SnackBar(
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      content: Text(message),
      showCloseIcon: true,
      closeIconColor: Colors.white,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

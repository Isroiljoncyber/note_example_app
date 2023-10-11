import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_example_app/assets/constants/app_colors.dart';
import 'package:note_example_app/feature/add_note/presentation/pages/add_todo.dart';
import 'package:note_example_app/feature/home/domain/entities/note_entity.dart';
import 'package:note_example_app/feature/home/presentation/bloc/note_cubit.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.item, required this.index}) : super(key: key);

  final NoteEntity item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddToDo(
                noteEntity: item,
                index: index,
              ),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title ?? "unknown",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainBlack,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    dateTime(item.createAt) ?? "unknown",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mainBlack.withOpacity(.6),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                if (item.isPinned ?? false) {
                  item.isPinned = false;
                } else {
                  item.isPinned = true;
                }
                context.read<NoteCubit>().updateNote(
                      item,
                      () => {},
                      (e) => {},
                      index,
                    );
              },
              icon: Icon(
                (item.isPinned ?? false) ? CupertinoIcons.pin_fill : CupertinoIcons.pin,
              ),
            )
          ],
        ),
      ),
    );
  }

  String dateTime(date) {
    try {
      return DateFormat('MMM d, yyyy hh:MM').format(DateTime.parse(date));
    } catch (e) {
      return "Error";
    }
  }
}

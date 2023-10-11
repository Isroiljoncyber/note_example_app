import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:formz/formz.dart';
import 'package:note_example_app/feature/add_note/presentation/pages/add_todo.dart';
import 'package:note_example_app/feature/home/presentation/bloc/note_cubit.dart';
import 'package:note_example_app/feature/home/presentation/widgets/custom_button.dart';
import 'package:note_example_app/feature/home/presentation/widgets/note_item.dart';
import 'package:note_example_app/feature/home/presentation/widgets/weather_info_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notes",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const WeatherInfoPart(),
            const SizedBox(height: 16),
            BlocBuilder<NoteCubit, NoteState>(
              builder: (context, state) {
                if (state.status.isInitial) {
                  context.read<NoteCubit>().getNotes();
                  return const SizedBox.shrink();
                } else if (state.status.isInProgress) {
                  return const Center(child: CupertinoActivityIndicator());
                } else if (state.status.isSuccess) {
                  if (state.notes.isNotEmpty) {
                    return Expanded(
                      child: AnimationLimiter(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.notes.length,
                          itemBuilder: (context, index) {
                            final item = state.notes[index];
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: FadeInAnimation(
                                // verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: NoteItem(
                                    item: item,
                                    index: index,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text(
                        "There is no any notes here :( ",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    );
                  }
                } else {
                  return const Center(
                    child: Text(
                      "Something went wrong",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: CustomButton(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AddToDo(),
              ));
        },
        icon: Icons.add_rounded,
        iconSize: 32,
        radius: 30,
        height: 60,
        width: 60,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_example_app/assets/theme/theme.dart';
import 'package:note_example_app/core/singleton/service.dart';
import 'package:note_example_app/feature/home/domain/entitys/note_entity.dart';
import 'package:note_example_app/feature/home/presentation/bloc/note_cubit.dart';
import 'package:note_example_app/feature/home/presentation/page/home.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final path = await getApplicationDocumentsDirectory();
  Hive
    ..init(path.absolute.path)
    ..registerAdapter<NoteEntity>(NoteEntityAdapter());
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NoteCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark(),
        home: const MyHomePage(),
      ),
    );
  }
}

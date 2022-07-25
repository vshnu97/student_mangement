import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:student_app/infrastucture/add_image.dart';
import 'package:student_app/infrastucture/funtions.dart';
import 'package:student_app/presentation/home/screen_home.dart';

import 'domain/model/model_class.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<DbFuntions>(create: (context) => DbFuntions()),
    ChangeNotifierProvider<AddPRovImg>(create: (context) => AddPRovImg())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.brown,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          scaffoldBackgroundColor: const Color.fromARGB(255, 85, 86, 101),
          backgroundColor: const Color.fromARGB(255, 82, 80, 101),
          fontFamily: GoogleFonts.dmSans().fontFamily,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          )),
      home: const ScreenHome(),
    );
  }
}

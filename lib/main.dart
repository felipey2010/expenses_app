import 'package:expenses/data/colors.data.dart';
import 'package:expenses/providers/transaction_provider.dart';
import 'package:expenses/screens/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child: ExpenseApp(),
    ),
  );
}

class ExpenseApp extends StatelessWidget {
  final FlutterLocalization localization = FlutterLocalization.instance;
  ExpenseApp({super.key});

  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expenses',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: accentColor,
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: bgColor,
          foregroundColor: foregroundColor,
        ),
      ),
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate
      // ],
      supportedLocales: [const Locale('pt-br'), const Locale('en')],
      home: HomePage(),
    );
  }
}

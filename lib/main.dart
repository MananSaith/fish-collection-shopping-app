import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/cardprovider.dart';
import 'package:shoping_app/navigator_page.dart';
void main() =>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => CardProvider (),
      child: MaterialApp(
        title: 'Fish Collection',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
                  fontFamily:'lato',
      
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: const Color.fromRGBO(254, 206, 1, 1),
                    primary: const Color.fromRGBO(254, 206, 1, 1),
                    ),
      
      
                    inputDecorationTheme: const InputDecorationTheme(
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                    color:Color.fromARGB(220, 104, 102, 102),
                      ),
                      prefixIconColor: Color.fromARGB(220, 104, 102, 102),
                      
                    ),
      
      
                    textTheme: const TextTheme(
                      bodyMedium: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                      bodySmall: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      )
                    ),
      
                    appBarTheme:const AppBarTheme(
                      titleTextStyle: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                      )
                    ),
                    
         useMaterial3: true,
        ),
      
      
        home: const NavegatorPage() ,
      ),
    );
  }
}

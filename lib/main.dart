import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tridheetest/view/screen/home_screen.dart';
import 'package:tridheetest/view_model/map_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MapsViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tridhee Test',
        theme: ThemeData(
          appBarTheme: AppBarTheme(),
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
        },
      ),
    );
  }
}

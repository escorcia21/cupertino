import 'package:flutter/cupertino.dart';
import 'ui/home.screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

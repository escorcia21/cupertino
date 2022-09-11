import 'pages/hello_dialog.dart';
import 'pages/action_sheet.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search),
          label: 'Action Sheet',
        ),
      ]),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return HelloDialogPage();
          case 1:
            return const ActionSheetPage();
          default:
            return HelloDialogPage();
        }
      },
    );
  }
}

import 'package:cupertino/ui/pages/characters/characters.screen.dart';
import 'package:cupertino/ui/pages/date/date.screen.dart';
import 'package:flutter/cupertino.dart';

class ActionSheetPage extends StatelessWidget {
  const ActionSheetPage({super.key});

  // This shows a CupertinoModalPopup which hosts a CupertinoActionSheet.
  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Choose an option'),
        message: const Text('Please choose one of the following options'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute<void>(
                  builder: (BuildContext context) {
                    return const CharactersScreen();
                  },
                ),
              );
            },
            child: const Text('Fetch some data'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute<void>(
                  builder: (BuildContext context) {
                    return const MyDatePicker();
                  },
                ),
              );
            },
            child: const Text('Show date picker'),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Choose an action'),
      ),
      child: Center(
        child: CupertinoButton.filled(
          onPressed: () => _showActionSheet(context),
          child: const Text('Click me'),
        ),
      ),
    );
  }
}

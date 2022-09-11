import 'package:flutter/cupertino.dart';

class ActionSheetPage extends StatelessWidget {
  const ActionSheetPage({super.key});

  // This shows a CupertinoModalPopup which hosts a CupertinoActionSheet.
  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Cupertino sheet'),
        message: const Text('IOS style sheet'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Send message'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Delete'),
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
        middle: Text('Action sheet page'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () => _showActionSheet(context),
          child: const Text('Click me'),
        ),
      ),
    );
  }
}

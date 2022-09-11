import 'package:flutter/cupertino.dart';

class HelloDialogPage extends StatefulWidget {
  final myController = TextEditingController();

  HelloDialogPage({Key? key}) : super(key: key);

  @override
  State<HelloDialogPage> createState() => _HelloDialogPageState();
}

class _HelloDialogPageState extends State<HelloDialogPage> {
  void _showAlertDialog(BuildContext context, String message) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Home'),
        ),
        child: Column(
          children: [
            CupertinoTextField(
              controller: widget.myController,
              placeholder: 'Enter your name',
            ),
            const SizedBox(
              height: 30,
            ),
            CupertinoButton(
              child: const Text('Show Alert'),
              onPressed: () {
                if (widget.myController.text.isNotEmpty) {
                  _showAlertDialog(
                      context, 'Hello World, ${widget.myController.text}');
                } else {
                  _showAlertDialog(context, 'Please enter your name');
                }
              },
            ),
          ],
        ));
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DismissibleWidget<T> extends StatelessWidget {
  const DismissibleWidget(
      {Key? key,
      required this.item,
      required this.child,
      required this.onDelete,
      required this.onUpdate,
        this.isDismissible = true,
      })
      : super(key: key);

  final bool isDismissible;
  final T item;
  final Widget child;
  final Function onDelete;
  final Function onUpdate;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ObjectKey(item),
        direction: isDismissible? DismissDirection.horizontal : DismissDirection.none,
        background: _swipeActionLeft(),
        secondaryBackground: _swipeActionRight(),
        onDismissed: (DismissDirection direction) => _onDismiss(direction),
        confirmDismiss: (DismissDirection direction) => _confirmDismiss(context, direction),
        child: child);
  }

  Widget _swipeActionLeft() => Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        color: Colors.blue,
        child: const Icon(Icons.edit),
      );

  Widget _swipeActionRight() => Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        color: Colors.red,
        child: const Icon(Icons.delete),
      );

  _onDismiss(DismissDirection direction) {
    switch (direction) {
      case DismissDirection.startToEnd:
        if (kDebugMode) print('onDismiss DismissDirection.startToEnd');
        break;
      case DismissDirection.endToStart:
        // from right to left (delete)
        if (kDebugMode) print('onDismiss DismissDirection.endToStart');
        break;
      default:
        break;
    }
  }

  Future<bool?> _confirmDismiss(BuildContext context, DismissDirection direction) async {
    switch (direction) {
      case DismissDirection.startToEnd:
        String text = 'Do you want to edit?';
        if (kDebugMode) print('_confirmDismiss DismissDirection.startToEnd');
        return await _customAlert(context, text);
      case DismissDirection.endToStart:
        // from right to left (delete)
        String text = 'Are you sure you want to delete?';
        if (kDebugMode) print('_confirmDismiss DismissDirection.endToStart');
        return await _customAlert(context, text);
      default:
        return false;
    }
  }

  Future<bool?> _customAlert(BuildContext context, String text) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Yes'),
            )
          ],
        );
      },
    );
  }
}

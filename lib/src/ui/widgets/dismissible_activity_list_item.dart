import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/ui/widgets/activity_card.dart';
import 'package:mat2414/utils/show_confirmation_dialog.dart' as utils_alert;

class DismissibleActivityListItem extends StatefulWidget {
  const DismissibleActivityListItem({
    Key? key,
    required this.item,
    required this.onDelete,
    required this.onUpdate,
  }) : super(key: key);

  final Activity item;
  final Function onDelete;
  final Future<Activity?> Function() onUpdate;

  @override
  State<DismissibleActivityListItem> createState() => _DismissibleActivityListItemState();
}

class _DismissibleActivityListItemState extends State<DismissibleActivityListItem> {
  late Activity _activity;

  @override
  void initState() {
    _activity = widget.item;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('DismissibleActivityListItem id: ${widget.item.id}');
    return Dismissible(
      // key: ObjectKey(widget.item),
      key:  widget.key ?? ObjectKey(widget.item),
      direction: DismissDirection.horizontal,
      background: _swipeActionLeft(),
      secondaryBackground: _swipeActionRight(),
      onDismissed: (DismissDirection direction) => _onDismiss(context, direction),
      confirmDismiss: (DismissDirection direction) => _confirmDismiss(context, direction),
      child: ActivityCard(key: Key('${_activity.createdAt}_${_activity.hashCode}'), activity: Future<Activity>.value(_activity)),
    );
  }

  Widget _swipeActionLeft() => Container(
        decoration: ShapeDecoration(
          shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20.0)),
          ),
          color: Colors.blue[300],
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        margin: const EdgeInsets.only(left: 10.0),
        // color: Colors.blue,
        child: _buildSwipeHint(Icons.edit, 'Edit'),
      );

  Widget _swipeActionRight() => Container(
        decoration: ShapeDecoration(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), bottomRight: Radius.circular(20.0)),
          ),
          color: Colors.red[300],
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        margin: const EdgeInsets.only(right: 10.0),
        // color: Colors.red,
        child: _buildSwipeHint(Icons.delete, 'Delete'),
      );

  Widget _buildSwipeHint(IconData iconData, String text) {
    return Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [Icon(iconData), Text(text)]);
  }

  _onDismiss(BuildContext context, DismissDirection direction) async {
    switch (direction) {
      case DismissDirection.startToEnd:
        // from left to right (edit)
        if (kDebugMode) print('onDismiss DismissDirection.startToEnd');
        // await _openEditModalBottomSheet(context);
        break;
      case DismissDirection.endToStart:
        // from right to left (delete)
        if (kDebugMode) print('onDismiss DismissDirection.endToStart');
        // delete
        await widget.onDelete();
        break;
      default:
        break;
    }
  }

  // if returns true triggers _onDismiss
  Future<bool?> _confirmDismiss(BuildContext context, DismissDirection direction) async {
    switch (direction) {
      case DismissDirection.startToEnd:
        String text = 'Do you want to change something?';
        if (kDebugMode) print('_confirmDismiss DismissDirection.startToEnd');
        if (await _showConfirmationAlert(context, text) ?? false) {
          // final Activity? aa = await _openEditModalBottomSheet(context);
          final Activity? aa = await widget.onUpdate();
          if (aa != null) {
            setState(() {
              _activity = aa;
            });
          }
          //print('_confirmDismiss from NAVIGATOR: $aa');
          return false;
        } else {
          return false;
        }
      // return await _customAlert(context, text);
      case DismissDirection.endToStart:
        // from right to left (delete)
        String text = 'Are you sure you want to delete it?';
        if (kDebugMode) print('_confirmDismiss DismissDirection.endToStart');
        return await _showConfirmationAlert(context, text);
      default:
        return false;
    }
  }

  Future<bool?> _showConfirmationAlert(BuildContext context, String text) {
    return utils_alert.showConfirmationDialog(context, text);
  }
}

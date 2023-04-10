import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mat2414/src/data/models/models.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
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

  String _editTxt = 'Edit';
  String _deleteTxt = 'Delete';

  @override
  void initState() {
    _activity = widget.item;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _editTxt = context.loc.generalEdit;
    _deleteTxt = context.loc.generalDelete;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      // key: ObjectKey(widget.item),
      key: widget.key ?? ObjectKey(widget.item),
      direction: DismissDirection.horizontal,
      background: _swipeActionLeft(),
      secondaryBackground: _swipeActionRight(),
      onDismissed: (DismissDirection direction) => _onDismiss(context, direction),
      confirmDismiss: (DismissDirection direction) => _confirmDismiss(context, direction),
      child: ActivityCard(
          key: Key('${_activity.createdAt}_${_activity.hashCode}'),
          activity: Future<Activity>.value(_activity)),
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
        child: _buildSwipeHint(Icons.edit, _editTxt),
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
        child: _buildSwipeHint(Icons.delete, _deleteTxt),
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
        // from left to right (edit). Always need to turn the item back in place.
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
    String wantToChangeDialog = 'Do you want to change something?';
    String wantToDeleteDialog = 'Are you sure you want to delete it?';

    switch (direction) {
      case DismissDirection.startToEnd:
        wantToChangeDialog = context.loc.dialogMakeChanges;
        if (kDebugMode) print('_confirmDismiss DismissDirection.startToEnd');
        if (await _showConfirmationAlert(context, wantToChangeDialog) ?? false) {
          // final Activity? aa = await _openEditModalBottomSheet(context);
          final Activity? updateResponse = await widget.onUpdate();
          if (updateResponse != null) {
            setState(() {
              _activity = updateResponse;
            });
          }
          //print('_confirmDismiss from NAVIGATOR: $aa');
          return false;
        } else {
          return false;
        }
      case DismissDirection.endToStart:
        // from right to left (delete)
        wantToDeleteDialog = context.loc.dialogWantToDelete;
        if (kDebugMode) print('_confirmDismiss DismissDirection.endToStart');
        return await _showConfirmationAlert(context, wantToDeleteDialog);
      default:
        return false;
    }
  }

  Future<bool?> _showConfirmationAlert(BuildContext context, String text) {
    return utils_alert.showConfirmationDialog(context, text);
  }
}

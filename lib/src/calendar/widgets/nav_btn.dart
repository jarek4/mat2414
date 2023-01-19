import 'package:flutter/material.dart';

class NavBtn extends StatelessWidget {
  const NavBtn({this.isForward = false, required this.midYear, required this.onTap, Key? key})
      : super(key: key);

  final bool isForward;
  final int midYear;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Icon(isForward ? Icons.arrow_forward_ios : Icons.arrow_back_ios),
    );
  }
}

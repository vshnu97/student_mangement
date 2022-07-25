
import 'package:flutter/material.dart';

class AppBAr extends StatelessWidget {
  const AppBAr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 13,
      shape: const RoundedRectangleBorder(borderRadius:BorderRadius.vertical(bottom: Radius.circular(50))),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text('Student Details',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25)));
  }
}

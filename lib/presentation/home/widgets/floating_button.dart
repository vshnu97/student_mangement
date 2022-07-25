import 'package:flutter/material.dart';
import 'package:student_app/presentation/add_screen/screen_add.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  AddScreen(pageType: PageType.addScreen,)));
      },
      child: const Icon(
        Icons.add,
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
    );
  }
}
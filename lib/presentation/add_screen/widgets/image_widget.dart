import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/domain/model/model_class.dart';
import 'package:student_app/infrastucture/add_image.dart';
import 'package:student_app/presentation/add_screen/screen_add.dart';

class ImageWidget extends StatelessWidget {
  final PageType? pageType;
  final StudentModel? data;
  const ImageWidget({
    Key? key,
    this.pageType,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: () {
        Provider.of<AddPRovImg>(context, listen: false).pickIAge();
      },
      child: Consumer<AddPRovImg>(
        builder: (context, value, child) {
          return value.imageAvtr.trim().isEmpty
              ? const CircleAvatar(
                  radius: 60,
                )
              : CircleAvatar(
                  backgroundImage: MemoryImage(
                      const Base64Decoder().convert(value.imageAvtr)),
                  radius: 60,
                );
        },
      ),
    );
  }
}
class ImageWidgetEdit extends StatelessWidget {
  final PageType? pageType;
  final StudentModel? data;
  const ImageWidgetEdit({
    Key? key,
    this.pageType,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: () {
        Provider.of<AddPRovImg>(context, listen: false).pickIAge();
      },
      child: Consumer<AddPRovImg>(
        builder: (context, value, child) {
          return value.imageAvtr.trim().isEmpty
              ?  CircleAvatar(backgroundImage: MemoryImage(
                      const Base64Decoder().convert(data!.image)),
                  radius: 60,
                )
              : CircleAvatar(
                  backgroundImage: MemoryImage(
                      const Base64Decoder().convert(value.imageAvtr)),
                  radius: 60,
                );
        },
      ),
    );
  }
}
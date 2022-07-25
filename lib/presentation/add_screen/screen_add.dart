import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:student_app/domain/model/model_class.dart';
import 'package:student_app/infrastucture/add_image.dart';
import 'package:student_app/infrastucture/funtions.dart';
import 'package:student_app/presentation/add_screen/widgets/image_widget.dart';

import 'package:student_app/presentation/add_screen/widgets/textfield_container.dart';

enum PageType { addScreen, editScreen }

// String imageShow = '';

class AddScreen extends StatelessWidget {
  final PageType pageType;
  final StudentModel? object;
  AddScreen({
    Key? key,
    required this.pageType,
    this.object,
  }) : super(key: key);
  final nameTextController = TextEditingController();
  final ageTextControler = TextEditingController();
  final batchTextController = TextEditingController();
  final domainTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (pageType == PageType.editScreen) {
      nameTextController.text = object!.name.toString();
      ageTextControler.text = object!.age.toString();
      domainTextController.text = object!.domain.toString();
      batchTextController.text = object!.domain.toString();
      final imgHive = object!.image;
    }
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 25,
          ),
          pageType == PageType.addScreen
              ? ImageWidget(data: object)
              : ImageWidgetEdit(data: object),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                child: Container(
                  width: 350.0,
                  height: 450.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey.shade200.withOpacity(0.5)),
                  child: Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFieldWidget(
                              controllr: nameTextController, name: 'UserName'),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldWidget(
                              controllr: ageTextControler, name: 'Age'),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldWidget(
                              controllr: batchTextController, name: 'Batch'),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldWidget(
                              controllr: domainTextController, name: 'Domain')
                        ],
                      )),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Back',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                color: Colors.grey,
              ),
              MaterialButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9)),
                  onPressed: () {
                    pageType == PageType.addScreen
                        ? addData(context)
                        : updateData(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: pageType == PageType.addScreen
                        ? const Text(
                            'Add +',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        : const Text(
                            'Update',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                  )),
            ],
          )
        ],
      ),
    );
  }

  addData(BuildContext context) async {
    final userName = nameTextController.text;
    final userAge = ageTextControler.text;
    final batch = batchTextController.text;
    final userDomain = domainTextController.text;
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    if (userName.isEmpty ||
        userAge.isEmpty ||
        batch.isEmpty ||
        userDomain.isEmpty|| Provider.of<AddPRovImg>(context, listen: false).imageAvtr.isEmpty) {
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Enter all details')));
    }
    final studentProfileData = StudentModel(
        name: userName,
        age: userAge,
        batch: batch,
        domain: userDomain,
        id: id,
        image: Provider.of<AddPRovImg>(context, listen: false).imageAvtr);

    DbFuntions().addStudentDetails(studentProfileData);
    Provider.of<DbFuntions>(context, listen: false).getStudentDetails();
    Provider.of<AddPRovImg>(context, listen: false).imageAvtr = '';
    Navigator.of(context).pop();
    nameTextController.text = '';
    ageTextControler.text = '';
    batchTextController.text = '';
    domainTextController.text = "";
  }

  updateData(BuildContext context)async {
    final userName = nameTextController.text;
    final userAge = ageTextControler.text;
    final batch = batchTextController.text;
    final userDomain = domainTextController.text;
    

    final studentProfileDataEdited = StudentModel(
      name: userName,
      age: userAge,
      batch: batch,
      domain: userDomain,
      id: object!.id,
      image: Provider.of<AddPRovImg>(context, listen: false)
              .imageAvtr
              .trim()
              .isEmpty
          ? object!.image
          : Provider.of<AddPRovImg>(context, listen: false).imageAvtr,
    );
    DbFuntions().editStudentDetails( studentProfileDataEdited);
   await Provider.of<DbFuntions>(context, listen: false).getStudentDetails();
    Provider.of<AddPRovImg>(context, listen: false).imageAvtr = '';
    Navigator.of(context).pop();
  }
}

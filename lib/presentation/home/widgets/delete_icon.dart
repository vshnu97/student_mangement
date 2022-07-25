
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/infrastucture/funtions.dart';

class DeleteIcon extends StatelessWidget {
  String id;
   DeleteIcon( {
    Key? key,required this.id
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<DbFuntions>(context,listen: false).getStudentDetails();
    return GestureDetector(
      onTap: (){
     Provider.of<DbFuntions>(context,listen: false).deleteStudentDetals(id);
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Icon(Icons.delete_outlined,color: Colors.red,),
      ),
    );
  }

  
}
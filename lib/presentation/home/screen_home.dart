import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_app/infrastucture/funtions.dart';
import 'package:student_app/presentation/add_screen/screen_add.dart';
import 'package:student_app/presentation/home/widgets/app_bar_home.dart';
import 'package:student_app/presentation/home/widgets/floating_button.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<DbFuntions>(context, listen: false).getStudentDetails();
    });
    print('scenee');
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBAr(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const FloatingButton(),
        body: Consumer<DbFuntions>(builder: (_, value, __) {
          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListView.separated(
                //physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final data = value.allStudentList[index];
                  print('DArkkkkkkkkk');
                  return Row(
                    children: [
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) => AddScreen(
                      //         pageType: PageType.editScreen,
                      //         object: data,
                      //       ),
                      //     ));
                      //   },
                      //   child: Container(
                      //     height: 100,
                      //     decoration: const BoxDecoration(
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(12)),
                      //       color: Color.fromARGB(255, 52, 48, 79),
                      //     ),
                      //     margin: const EdgeInsets.symmetric(
                      //         vertical: 10, horizontal: 30),
                      //     child: Row(
                      //       children: [
                      //         Expanded(
                      //           child: Container(
                      //             margin: const EdgeInsets.fromLTRB(
                      //                 0, 16, 16, 16),
                      //             constraints:
                      //                 const BoxConstraints.expand(),
                      //             child: Column(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.start,
                      //               children: [
                      //                 Text(
                      //                   data.name.toString(),
                      //                   style: TextStyle(
                      //                       color: Colors.white,
                      //                       fontFamily:
                      //                           GoogleFonts.poppins()
                      //                               .fontFamily,
                      //                       fontWeight: FontWeight.w600,
                      //                       letterSpacing: 1,
                      //                       fontSize: 22),
                      //                 ),
                      //                 const SizedBox(height: 10.0),
                      //                 Text(
                      //                   data.domain.toString(),
                      //                   style: TextStyle(
                      //                       color:
                      //                           const Color(0xffb6b2df),
                      //                       fontFamily:
                      //                           GoogleFonts.poppins()
                      //                               .fontFamily,
                      //                       fontWeight: FontWeight.w400,
                      //                       letterSpacing: .5,
                      //                       fontSize: 14),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         DeleteIcon(id: data.id.toString())
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 20),
                        child: CircleAvatar(
                          backgroundImage: MemoryImage(
                              const Base64Decoder().convert(data.image)),
                          radius: 40,
                        ),
                      ),

                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddScreen(
                              pageType: PageType.editScreen,
                              object: data,
                            ),
                          ));
                        },
                        child: Container(
                          height: 100,
                          width: 250,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 52, 48, 79),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          // ,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 45,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    data.name.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                        fontSize: 22),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    data.domain.toString(),
                                    style: TextStyle(
                                        color: const Color(0xffb6b2df),
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: .5,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Provider.of<DbFuntions>(context,
                                          listen: false)
                                      .deleteStudentDetals(data.id.toString());
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Icon(
                                    Icons.delete_outlined,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, value) {
                  return const SizedBox(
                    height: 1,
                  );
                },
                itemCount: value.allStudentList.length),
          );
        }));
  }
}

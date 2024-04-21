import 'package:elmatgr/helpers/media_query.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_drawer_controller.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.screenWidth * 70,
      backgroundColor: Colors.white,
      child: SizedBox(
        height: context.screenHeight * 70,
        child: SingleChildScrollView(
          child: GetBuilder<MyDrawerController>(
            init: MyDrawerController(),
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      DrawerHeader(
                        child: Icon(
                          CupertinoIcons.person,
                          color: Colors.black,
                          size: 85,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      MyListTile(
                        text: "",
                        onTap: controller.goToInterest,
                      ),
                      MyListTile(
                        text: "late payments",
                        onTap: controller.goToPaylate,
                      ),
                      MyListTile(
                        text: "analyze individual",
                        onTap: controller.goToAnalyzeIndividual,
                      ),
                      Row(
                        children: [
                          const Spacer(
                            flex: 1,
                          ),
                          const Icon(
                            Icons.logout,
                            size: 50,
                            color: Colors.black,
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: GestureDetector(
                              child: Text(
                                "L O G O U T",
                                style: TextStyle(
                                  color: Colors.amber.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(
                            flex: 8,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  IconData? icon;
  final String text;
  final void Function()? onTap;

  MyListTile({super.key, this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            text,
            style: const TextStyle(
              fontSize: 17,
              letterSpacing: 2,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: onTap,
        ),
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}

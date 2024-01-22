import 'package:flutter/material.dart';
import 'package:sgcards/pages/menu_items.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final controller = MenuItems();
  int currentIndex = 0;
  bool selectedMenu = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          background(
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 40),
                  child: Image.asset("assets/images/logo.png"),
                ),
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                    itemCount: controller.items.length,
                    itemBuilder: (context, index) {
                      selectedMenu = currentIndex == index;
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedMenu
                              ? Colors.blueAccent.shade100.withOpacity(.2)
                              : Colors.transparent,
                        ),
                        child: ListTile(
                          title: Text(controller.items[index].title),
                          leading: Icon(controller.items[index].icon),
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("Çıxış"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: controller.items.length,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemBuilder: ((context, index) {
                return SizedBox(
                  child: controller.items[currentIndex].page,
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

Widget background(Widget child) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    width: 200,
    height: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(.8), blurRadius: 1, spreadRadius: 0)
      ],
      color: Colors.white,
    ),
    child: child,
  );
}

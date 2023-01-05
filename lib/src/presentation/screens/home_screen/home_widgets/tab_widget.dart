import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({Key? key}) : super(key: key);

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> listName = [S.of(context).allCodes, S.of(context).favorite, S.of(context).cars, S.of(context).add, S.of(context).start];

    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
        listName.length,
            (index) => GestureDetector(
              onTap: () {
                setState((){
                  selectedIndex = index;
                });
              },
              child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(left: selectedIndex == index ? 20 : 0, right: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selectedIndex == index
                  ? Colors.black87
                  : const Color(0xFFE0E0E0),
          ),
          child: Center(
              child: Text(
                listName[index],
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: selectedIndex == index ? Colors.white : Colors.black, fontSize: 14),
              ),
          ),
        ),
            ),
      ),
    );
  }
}

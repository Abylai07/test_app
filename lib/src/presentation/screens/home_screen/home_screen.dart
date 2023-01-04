import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import 'home_widgets/my_button_widget.dart';
import 'home_widgets/tab_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
                height: 30,
                child: TabWidget(),
            ),
          ),
          Expanded(child: MyButtonWidget()),
        ],
      ),
    );
  }
}

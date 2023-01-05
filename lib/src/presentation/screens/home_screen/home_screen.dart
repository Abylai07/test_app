import 'package:flutter/material.dart';

import 'home_widgets/my_button_widget.dart';
import 'home_widgets/tab_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
                height: 30,
                child: TabWidget(),
            ),
          ),
          Expanded(child: MyButtonWidget()),
         // const Expanded(child: MyButtonWithBloc()),
        ],
      ),
    );
  }
}

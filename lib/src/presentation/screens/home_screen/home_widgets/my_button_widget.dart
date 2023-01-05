import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

//Attention
//Attention
//Attention (Этот виджет только для демонстраций чтобы увидеть мок для этого виджета зайдите в my_button_with_bloc)

class MyButtonWidget extends StatelessWidget {

  MyButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> buttonNameList = [S.of(context).myCar, S.of(context).myChild, S.of(context).myHome, S.of(context).myWallet, S.of(context).myPhone];
    List<Color> buttonColorList = const [Color(0xFF4D8EFF), Color(0xFFCDC1FF),Color(0xFF7AE582),Color(0xFF81CCF2),Color(0xFF77EDD9), ];

    return ListView.builder(
        itemCount: buttonNameList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: buttonColorList[index].withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: ListTile(
                  title: Text(buttonNameList[index], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: buttonColorList[index],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.qr_code, color: Colors.black),
                  ),
                ),
              ),
            ),
          );
        });
  }
}



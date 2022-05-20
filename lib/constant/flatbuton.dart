// ignore_for_file: use_key_in_widget_constructors

import 'package:coffee_shop/constant/styles.dart';
import 'package:flutter/material.dart';
class Buton extends StatelessWidget {
 final String text;
 final Function onTap;
  const Buton(this.text,{required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () =>onTap(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15,
          ),
          height: sizeFromHeight(context, 13),
          width: sizeFromWidth(context, 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: brownheigth,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            style: buttonStyle,
          ),
        ));
  }
}

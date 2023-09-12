import 'package:flutter/material.dart';

Widget greatday(BuildContext context, String title, Color titlecolor) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: RichText(
      text: TextSpan(
          text: 'It\'s Great ',
          style: Theme
              .of(context)
              .textTheme
              .headline5
              ?.copyWith(letterSpacing: 2.0, fontSize: 36.0),
          children: [
            TextSpan(
              text: 'Day For ${title}.',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(
                color: titlecolor,
                letterSpacing: 2.0,
                fontSize: 36.0,
              ),
            ),
          ]),
    ),
  );
}

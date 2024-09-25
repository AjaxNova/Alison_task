import 'package:flutter/material.dart';

navigateMePush({required BuildContext context, required Widget screen}) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => screen,
  ));
}

navigateMeReplace({required BuildContext context, required Widget screen}) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => screen,
  ));
}

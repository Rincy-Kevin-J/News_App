import 'package:flutter/material.dart';

     errorSnackBar(context) =>
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("data went wrong"),
      backgroundColor: Colors.red,
    ));

    sucessSnackBar(context) =>
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Sucess"),
      backgroundColor: Colors.green,
    ));

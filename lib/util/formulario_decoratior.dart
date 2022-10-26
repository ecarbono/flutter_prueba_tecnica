import 'package:flutter/material.dart';
import 'package:flutter_prueba_tecnica/provider/variables.dart';

InputDecoration formDeco = InputDecoration(
  errorMaxLines: 2,
  isDense: true,
  labelStyle: TextStyle(color: colorTheme),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(
      color: colorTheme,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(
      color: colorTheme,
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(
      color: colorTheme,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(
      color: colorTheme,
    ),
  ),
);

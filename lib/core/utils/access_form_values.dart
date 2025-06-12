import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

T? getFormFieldValue<T>(GlobalKey<FormBuilderState> key, String fieldName) {
  return key.currentState?.fields[fieldName]?.value as T?;
}

void setFormFieldValue<T>(
    GlobalKey<FormBuilderState> key, String fieldName, T value) {
  key.currentState?.fields[fieldName]?.didChange(value);
}

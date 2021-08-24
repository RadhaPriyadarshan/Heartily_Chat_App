import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Color(0xFF880E4F),
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  fillColor: Color(0xFF880E4F),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Color(0xFF880E4F), width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'use copywith feature to add hint text',
  hintStyle: TextStyle(color:Color(0xFF880E4F)),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Color(0xFF880E4F), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Color(0xFF880E4F), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

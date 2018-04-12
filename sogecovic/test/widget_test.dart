// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sogecovic/objetos.dart';

import 'package:sogecovic/cashier/main.dart';
import 'package:sogecovic/central/main.dart';
import 'package:sogecovic/cusine/main.dart';
import 'package:sogecovic/customer/main.dart';
import 'package:sogecovic/cupbearer/main.dart';
import 'package:sqljocky5/constants.dart';
import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/utils.dart';


void main() {
    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(new CustomerApp());

        Restaurante rest = new Restaurante();

        rest.saguao[1] = new Mesa(1);
        rest.saguao[2] = new Mesa(2);
        rest.saguao[3] = new Mesa(3);

        print(rest.saguao);
    });
}

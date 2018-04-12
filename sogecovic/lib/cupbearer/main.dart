import 'package:flutter/material.dart';
//import 'package:sogecovic/objetos.dart';

void main() => runApp(new CupbearerApp());

class CupbearerApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new MaterialApp(
			title: 'Welcome to Flutter',
			home: new Scaffold(
				appBar: new AppBar(
					title: new Text('Welcome to Flutter'),
				),
				body: new Center(
					child: new Text('AHSJAHSJAHSJAHSJAHSJAHSJH'),
				),
			),
		);
	}
}
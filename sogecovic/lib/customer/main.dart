import 'package:flutter/material.dart';
import 'package:sogecovic/objetos.dart';

void main() => runApp(new CustomerApp());

class CustomerApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new MaterialApp(
			title: "Cardápio Victório's",
			home: new Scaffold(
				appBar: new AppBar(
					title: new Text("Cardápio Victório's"),
				),
				body: new Center(
					child: new Populator()._construtorLista(),
				)
			),
		);
	}
}

class Populator {
	Restaurante restaur;

	Populator() {
		restaur = new Restaurante();
	}

	Widget _construtorLista() {
		return new ListView.builder(
			itemBuilder: (context, i) {
				if (i.isOdd) return new Divider();
				final index = i ~/ 2;
				if (index<restaur.cardapio.length)
					return _construtorItemLista(index);
			}
		);
	}

	Widget _construtorItemLista(int index) {
		return new ListTile(
			title: new Text(restaur.cardapio[index].nome),
			trailing: new Text("R\$" + restaur.cardapio[index].valor.toStringAsFixed(2))
		);
	}
}
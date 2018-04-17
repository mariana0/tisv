import 'package:flutter/material.dart';
import 'package:sogecovic/objetos.dart';
import 'package:http/http.dart';



void main() => runApp(new MyApp());

List<Mesa> saguao = new List<Mesa>();
List<Item> cardapio = new List<Item>();

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new MaterialApp(
			title: 'Mesas do Restaurante',
			home: new ConjuntoMesas(),
		);
	}
}

class ConjuntoMesas extends StatefulWidget {
	@override
	createState() => new ConjuntoMesasState();
}

class ConjuntoMesasState extends State<ConjuntoMesas> {
	// final TextStyle _biggerFont = new TextStyle(fontSize: 18.0);

	// Future<Response> fetchPost() {
  	// 	return http.get('https://jsonplaceholder.typicode.com/posts/1');
	// }

	void startBD() {

		Item parmegsiana = new Item(
			1,
			"Parmegsiana de Frango",
			"endereco_da_foto.png",
			"endereco_do_icone.png",
			49.99
		);
		Item lasagna = new Item(
			1,
			"Lasagna",
			"endereco_da_foto.png",
			"endereco_do_icone.png",
			29.99
		);
		Item bife = new Item(
			1,
			"Bife a Cavalo",
			"endereco_da_foto.png",
			"endereco_do_icone.png",
			39.99
		);

		saguao.add(
			new Mesa(1)
				..novoPedido(parmegsiana)
				..novoPedido(bife)
		);

		saguao.add(
			new Mesa(2)
				..novoPedido(bife)
				..fechaMesa()
		);

		saguao.add(
			new Mesa(3)
				..novoPedido(lasagna)
				..novoPedido(lasagna)
		);

		saguao.add(
			new Mesa(4)
				..novoPedido(bife)
				..novoPedido(lasagna)
		);
	}

	@override
	Widget build(BuildContext context) {
		saguao = new List<Mesa>();
		startBD(); 
			return new Scaffold(
				appBar: new AppBar(
					title: new Text('Mesas do Restaurante'),
				),
				body: _buildListaMesas(),
			);
	}

	Widget _buildListaMesas() {
			return new ListView.builder(
				padding: const EdgeInsets.all(16.0),
				itemBuilder: (context, i) {
					if (i<saguao.length)
					return _buildMesa(saguao[i]);
				},
			);
	}

	Widget _buildMesa(Mesa mesa) {
		return new ListTile(
			title: new Card(
				child: new Column(
					mainAxisSize: MainAxisSize.min,
					children: <Widget>[
						new ListTile(
							title: new Text("Mesa ${mesa.numeroMesa}"),
							subtitle: new Text(mesa.abertura.toString()),
						),
						new Divider(),
						new ListView.builder(
							itemBuilder: (context, i) {
								if (i<mesa.pedidos.length)
								return _buildPedido(mesa.pedidos[i]);
							},
							shrinkWrap: true,
						)
					],
				),
				color: _setColor(mesa)
			),
		);
	}

	Color _setColor(Mesa mesa) {
		if (mesa.fechamento!=null) return Colors.blueGrey;
		else return null;
	}

	Widget _buildPedido(Pedido p) {
		return new ListTile(
			title: new Text(p.item.nome)
		);
	}

	Widget _buildMesaFechada() {
		return new ListTile(
			title: new FlatButton(
				child: new Text("Abrir Mesa!"),
				onPressed: null,
			)
		);
	}
}

import 'package:sqljocky5/sqljocky.dart';
import 'dart:io';

void main() async {

	var banco = new ConnectionPool(
		host: 'localhost', port: 3306,
		user: 'root', password: 'toor',
		db: 'sogecovic', max: 5
	);

	var results = await banco.query("select * from tbl_itens");

	results.forEach( (resultado) {
		print("${resultado[1]} custa ${resultado[4]}");
	});

	Map Json = new Map();
	Json["um"] = "oi";
	Json["dois"] = "ola";
	Json["tres"] = new Map();
	print(Json);
	print(Json.toString());

	var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
	print("Servidor iniciado em ${server.address}:${server.port}!");

	await for (var request in server){
		switch(request.method){
			case 'GET':
				handleGet(request);
				break;

			case 'POST':
				handlePost(request);
				break;

			case 'PUT':
				handlePut(request);
				break;

			case 'DELETE':
				handleDelete(request);
				break;

			default:
				request.response
					..statusCode = HttpStatus.METHOD_NOT_ALLOWED
					..write("Metodo não identificado! Por favor, use métodos RESTful!")
					..close();
				break;
		}

		print(request.uri);

		List<String> path = request.uri.path.split("/");
		print(path);

		request.response
			..headers.contentType = new ContentType("text", "plain", charset: "utf-8")
			..write("Hello World!")
			..close();
	}
}

void handleGet(HttpRequest request){
	request.response
		..statusCode = HttpStatus.OK
		..headers.contentType = ContentType.JSON
		..close();
}

void handlePost(HttpRequest request){

	request.response
		..statusCode = HttpStatus.OK
		..headers.contentType = ContentType.JSON
		..close();
}

void handlePut(HttpRequest request){

}

void handleDelete(HttpRequest request){

}
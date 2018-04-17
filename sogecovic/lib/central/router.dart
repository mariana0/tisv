import 'package:sqljocky5/sqljocky.dart';
import 'dart:io';
import 'dart:convert';
import '../objetos.dart';

import '../dao.dart';

var banco = new ConnectionPool(
    host: 'localhost', port: 3306,
    user: 'root', password: 'toor',
    db: 'sogecovic', max: 5
);

void main() async {
    var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080);
	print("Servidor iniciado em ${server.address}:${server.port}!");

    await for (var request in server){
        print(request.uri.path.split("/"));
        switch (request.uri.path.split("/")[1]) {
            case "mesas": 
                mesasController(request);
            break;
            case "itens": 
                itensController(request);
            break;
            case "pedidos":
                pedidosController(request);
            break;
            case "usuarios":
                usuariosController(request);
            break;
            default: 
                request.response.statusCode = HttpStatus.NOT_FOUND;
                request.response.write("Path ${request.uri.path} não encontrado!");
            break;
        }
    }
}

void mesasController(HttpRequest request) {
    request.response.headers.contentType = ContentType.JSON;
    Map resp = new Map();
    Map header = new Map();
    Map content = new Map();
    resp["header"] = header;
    resp["content"] = content;
    switch (request.method) {
        case "GET": 
            header["status"] = 2;
            header["status_desc"] = "GET MESAS feito com sucesso!";
            MesaDAO.mesasAbertas().then( (obj) {
                    content["mesas"] = JSON.decode(obj);
                    request.response
                        ..write(JSON.encode(resp))
                        ..close();
            } );
            break;
        default:
            
            break;
    }
}

void itensController(HttpRequest request) {
    switch (request.uri.path.split("/")[2])
}

void pedidosController(HttpRequest request) {
    switch (request.uri.path.split("/")[2])
}

void usuariosController(HttpRequest request) {
    switch (request.uri.path.split("/")[2])
}
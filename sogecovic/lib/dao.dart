import 'dart:convert';
import 'package:sqljocky5/sqljocky.dart';
import 'package:sogecovic/objetos.dart';
import 'dart:async';

var _banco = new ConnectionPool(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'toor',
    db: 'sogecovic',
    max: 5
);

void main() {
    print(new DateTime.now().millisecondsSinceEpoch);
    // Mesa mesa = new Mesa(1);
    // mesa.id = 1;
    // mesa.abertura = new DateTime.now();
    // mesa.fechamento = null;
    // MesaDAO.updateMesa(mesa);
}

abstract class MesaDAO {
    static Future<bool> updateMesa(Mesa mesa) async {

        var result = await _banco.query("INSERT INTO tbl_mesas ('id_mesa', 'num_mesa', 'abertura', 'fechamento', 'fechada') "
            + "VALUES (${mesa.id}, '${mesa.numeroMesa}', '${mesa.abertura.millisecondsSinceEpoch}', '${mesa.fechamento?.millisecondsSinceEpoch}', 1)");

        return result.isEmpty;
            
    }

    static Future<List<Mesa>> allMesas() async {
        List<Mesa> resp = new List<Mesa>();
        var mesasQuery = await _banco.query("SELECT * FROM sogecovic.tbl_mesas");
        mesasQuery.forEach(
            (mesa) {
                Mesa temp = new Mesa(0);
                temp.id = mesa[0];
                temp.numeroMesa = mesa[1];
                temp.abertura = mesa[2];
                temp.fechamento = mesa[3];
                temp.pedidos = PedidoDAO.pedidosMesa(temp.id) as List<Pedido>;
                resp.add(temp);
            }
        );
        return resp;
    }

    static Future<String> mesasAbertas() async {
        List<dynamic> resp = new List<dynamic>();
        var query = await _banco.query("SELECT * FROM sogecovic.tbl_mesas WHERE fechamento is not null;");
        await query.forEach( (mesa) {
            Map<String, dynamic> row = new Map();
            row["id"] = mesa[0];
            row["abertura"] = new DateTime.now().toIso8601String();
            row["fechamento"] = null;
            resp.add(row);
        } );
        return JSON.encode(resp);
    }

    static Future<List<Mesa>> mesasFechadas() async {
        List<Mesa> resp = new List<Mesa>();
        await _banco.query("SELECT * FROM sogecovic.tbl_mesas WHERE fechamento is null;");
        return resp;
    }
}

class PedidoDAO {
    static Future<List<Pedido>> allPedidos() async {
        List<Pedido> resp = new List<Pedido>();

        return resp;
    }

    static Future<List<Pedido>> pedidosMesa(int mesa) async {
        List<Pedido> resp = new List<Pedido>();
        
        return resp;
    }

    static Future<List<Pedido>> pedidosEmAbertoMesa(int mesa) async {
        List<Pedido> resp = new List<Pedido>();
        
        return resp;
    }

}
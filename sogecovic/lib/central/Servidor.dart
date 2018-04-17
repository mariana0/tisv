import 'package:rpc/rpc.dart';
import 'dart:convert';

@ApiClass(
    name: "sogecovic",
    title: "SOGECOVIC",
    version: "v1",
    description: "Software Gerenciador de Comandas do Victorio's"
)
class Servidor {
    
    @ApiMethod(
        method: "GET",
        path: "/cardapio",
        name: "GET Cardápio",
        description: "Usado para solicitar o cardápio ao sistema"
    )
    String getCardapio() {
        return "Cardapio";
    }
}
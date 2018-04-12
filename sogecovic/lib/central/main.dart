import 'package:sqljocky5/sqljocky.dart';

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
}

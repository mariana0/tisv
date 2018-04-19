package tis.server;

import java.time.LocalDateTime;
import java.util.ArrayList;

public class Mesa {
	int id;
	int numero;
	int formaPgto;
	LocalDateTime abertura;
	LocalDateTime fechamento;
	float total;
	boolean aberta;
	ArrayList<Pedido> pedidos;

	void addPedido(Pedido p) {
		pedidos.add(p);
		p.id=pedidos.size();
	}

	Mesa(int numero, int id) {
		this.numero = numero;
		this.id = id;
		abertura = LocalDateTime.now();
		total = 0.0F;
		if (numero !=0) aberta = true;
		else aberta=false;
		pedidos = new ArrayList<Pedido>();
	}

	public int getId() {
		return id;
	}

	public int getNumero() {
		return numero;
	}

	public int getFormaPgto() {
		return formaPgto;
	}

	public LocalDateTime getAbertura() {
		return abertura;
	}

	public LocalDateTime getFechamento() {
		return fechamento;
	}

	public float getTotal() {
		return total;
	}

	public boolean getAberta() {
		return aberta;
	}
	
	public ArrayList<Pedido> getPedidos() {
		return pedidos;
	}

}

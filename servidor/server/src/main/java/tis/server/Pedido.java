package tis.server;

import java.time.LocalDateTime;

public class Pedido {
	// Mesa mesa;
	// Item item;
	int mesa;
	int status;
	String obs;
	int item;
	int id;
	LocalDateTime hora;

	Pedido(int mesa, int item, String o) {

		this.mesa = mesa;
		this.status = 0;
		this.obs = o;
		this.item = item;
		this.hora = LocalDateTime.now();

	}

	public void setStatus(int x) {
		status=x;
	}

	public int getMesa() {
		return mesa;
	}

	public int getItem() {
		return item;
	}

	public int getStatus() {
		return status;
	}

	public String getObs() {
		return obs;
	}

	public LocalDateTime getHora() {
		return hora;
	}

	public int getId() {
		return id;
	}

}

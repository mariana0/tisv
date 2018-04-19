package tis.server;

import java.util.concurrent.atomic.AtomicLong;

import java.util.ArrayList;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

@RestController
public class MesaController {
	private final AtomicLong counter = new AtomicLong();
	ArrayList<Mesa> abertas = new ArrayList<Mesa>();

	@RequestMapping(value = "/mesas", method = RequestMethod.POST)
	public Mesa addMesa(@RequestBody ObjectNode o) {
		JsonNode numero = o.get("mesa");
		Mesa m = new Mesa(numero.asInt(), (int) counter.incrementAndGet());
		abertas.add(m);
		return m;
	}

	@RequestMapping(value = "pedido", method = RequestMethod.POST)
	public Pedido addPedido(@RequestBody ObjectNode o) {

		JsonNode mesa = o.get("mesa");
		JsonNode item = o.get("item");
		JsonNode obs = o.get("obs");

		Mesa procurada = new Mesa(0, 0);

		for (Mesa m : abertas) {
			if (m.numero == mesa.asInt()) {
				procurada = m;
			}
		}

		if (procurada.numero != 0) {
			String observacao=obs.asText();
			if (observacao=="") {			
				observacao=new String("Mesa " + procurada.numero + " pediu o item " + item.asInt());
			}
			Pedido p = new Pedido(procurada.numero, item.asInt(),
					observacao);
			procurada.addPedido(p);
			return p;
		}
		return new Pedido(0, 0, "Mesa não encontrada");

	}

	@RequestMapping(value = "/mesas", method = RequestMethod.GET)
	public ArrayList listarMesas() {
		return abertas;
	}

	@RequestMapping(value = "/mesa/{num}", method = RequestMethod.GET)
	public Mesa verMesa(@PathVariable("num") int mesa) {
		for (Mesa m : abertas) {
			if (m.numero == mesa) {
				return m;
			}
		}
		return new Mesa(0, 0);
	}

	// Alterar o pedido recebe mesa, nº do pedido (1,2,3,4) e não do item
	// pode alterar o status ou adicionar observações ao pedido.
	@RequestMapping(value = "pedido", method = RequestMethod.PUT)
	public Pedido alterarPedido(@RequestBody ObjectNode o) {

		JsonNode mesa = o.get("mesa");
		JsonNode pedido = o.get("pedido");
		JsonNode status = o.get("status");
		JsonNode obs = o.get("obs");

		for (Mesa m : abertas) {
			if (m.numero == mesa.asInt()) {
				for (Pedido p : m.pedidos) {
					if (p.id == pedido.asInt()) {
					
							p.setStatus(status.asInt());
						
						if (obs.toString()!="") {
							p.obs += (" " + obs.asText());
						}
						return p;
					}
				}
			}
		}

		return new Pedido(0, 0, "Pedido não encontrado");

	}

}
import java.util.List;

import com.finanest.DAO.ContatoDAO;
import com.finanest.DAO.ContatoHome;
import com.finanest.annotations.Contato;

public class TestaLista {

	public static void main(String[] args) {
		
		@SuppressWarnings("unchecked")
		List<Contato> listaContatos = (new ContatoDAO()).listar();
		for (Contato contato : listaContatos) {
			System.out.println(contato.toString());
		}	
	}
}

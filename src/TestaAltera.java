

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Date;

import com.finanest.DAO.ContatoDAO;
import com.finanest.annotations.Contato;

public class TestaAltera {

	public static void main(String[] args) throws SQLException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, InstantiationException, NoSuchMethodException, SecurityException {

		// pronto para alterar
		Contato contato = new Contato("Fulano",
				"fulano.silva@beltrano.com",
				"Nenhuma",
				"Reclamação",
				"Site demorado!",
				new Date());
		contato.setIdContato(5);
		System.out.println(contato.toString());
				
		// método de alteração
		(new ContatoDAO()).altera(contato);
		System.out.println("Alteração feita.");
	}
}

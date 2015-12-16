

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Date;

import com.finanest.DAO.ContatoDAO;
import com.finanest.annotations.Contato;

public class TestaInsere {

	public static void main(String[] args) throws SQLException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, InstantiationException, NoSuchMethodException, SecurityException {

		// pronto para gravar
		Contato contato = new Contato("Fulano", "fulano@silva.com", "Rua Tal", "Serviço", "Prestar serviço", new Date());
		System.out.println(contato.toString());
		
		(new ContatoDAO()).salvar(contato);
	}
}

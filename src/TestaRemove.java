

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;

import com.finanest.DAO.ContatoDAO;
import com.finanest.annotations.Contato;

public class TestaRemove {

	public static void main(String[] args) throws SQLException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, InstantiationException, NoSuchMethodException, SecurityException {

		// pronto para remover
		Contato contato = new Contato();
		contato.setIdContato(2);
		System.out.println(contato.toString());
				
		(new ContatoDAO()).remover(contato);
	}
}

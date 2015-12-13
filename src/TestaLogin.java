import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;

import com.finanest.DAO.UsuarioDAO;

public class TestaLogin {

	public static void main(String[] args) throws SQLException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, InstantiationException,
			NoSuchMethodException, SecurityException {

		// pronto para remover
		/*
		 * Usuario usuario = new Usuario();
		 * usuario.setEmail("dnhutos@hotmail.com"); usuario.setSenha("ufersa");
		 * System.out.println(usuario.toString());
		 */
		System.out.print((new UsuarioDAO()).verificarLogin(
				"dnhutos@hotmail.com", "ufersa"));
	}
}

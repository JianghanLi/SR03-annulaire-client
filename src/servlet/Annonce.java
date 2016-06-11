package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionProxy;

/**
 * Servlet implementation class Annonce
 */
@WebServlet("/Annonce")
public class Annonce extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Annonce() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = (String)request.getParameter("action");
		if(action.equals("delete")) {
			int id_annonce = Integer.parseInt(request.getParameter("id"));
			ActionProxy actionProxy = new ActionProxy();
			actionProxy.deleteAnnonce(id_annonce);
			System.out.println("delete annonce by id " + id_annonce);			
		}
		response.sendRedirect("/SR03-annulaire-client/index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionProxy ap = new ActionProxy();
		String action = request.getParameter("action");
		int id_annonce = Integer.parseInt(request.getParameter("id_annonce"));
		if(action.equals("modify")) {
			String categorie = request.getParameter("categorie");
			String code_postal = request.getParameter("code_postal");
			String nom = request.getParameter("nom");
			String rue = request.getParameter("rue");
			String telephone = request.getParameter("telephone");
			String text = request.getParameter("text");
			String ville = request.getParameter("ville");
			ap.modifyAnnonce(categorie, nom, rue, ville, code_postal, telephone, text, id_annonce);
		}
		response.sendRedirect("/SR03-annulaire-client/annonceDetail.jsp?id_annonce="+id_annonce);
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

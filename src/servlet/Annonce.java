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
		request.setCharacterEncoding("UTF-8");
		String action = (String)request.getParameter("action");
		String message = "";
		if(action.equals("delete")) {
			int id_annonce = Integer.parseInt(request.getParameter("id"));
			ActionProxy actionProxy = new ActionProxy();
			message = actionProxy.deleteAnnonce(id_annonce);
			System.out.println("delete annonce by id " + id_annonce);			
		}
		response.sendRedirect("/SR03-annulaire-client/index.jsp?message=" + message);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ActionProxy ap = new ActionProxy();
		String action = request.getParameter("action");		
		if(action.equals("modify")) {
			int id_annonce = Integer.parseInt(request.getParameter("id_annonce"));
			String categorie = request.getParameter("categorie");
			String code_postal = request.getParameter("code_postal");
			String nom = request.getParameter("nom");
			String rue = request.getParameter("rue");
			String telephone = request.getParameter("telephone");
			String text = request.getParameter("text");
			String ville = request.getParameter("ville");
			String message = ap.modifyAnnonce(categorie, nom, rue, ville, code_postal, telephone, text, id_annonce);
			response.sendRedirect("/SR03-annulaire-client/annonceDetail.jsp?id_annonce="+id_annonce + "&message=" + message);
		} else if (action.equals("add")) {
			String query = (String)request.getParameter("query");
			String categorie = (String)request.getParameter("categorie");
			String message = ap.newAnnonce(categorie, query, "", "", "", "", "");
			response.sendRedirect("/SR03-annulaire-client/index.jsp?message=" + message);
		}
		
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

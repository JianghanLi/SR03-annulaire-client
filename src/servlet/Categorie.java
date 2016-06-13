package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import action.ActionProxy;
import java.rmi.RemoteException;



/**
 * Servlet implementation class Categorie
 */
@WebServlet("/Categorie")
public class Categorie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Categorie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = (String)request.getParameter("action");
		ActionProxy actionProxy = new ActionProxy();
		if(action.equals("delete")) {
			String title = (String)request.getParameter("title");			
			actionProxy.deleteCategorie(title);
			System.out.println("delete categorie by title " + title);			
		}
		response.sendRedirect("/SR03-annulaire-client/index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String query = (String)request.getParameter("query");
		System.out.println(query);
		ActionProxy actionProxy = new ActionProxy();
		actionProxy.newCategorie(query);
		response.sendRedirect("/SR03-annulaire-client/index.jsp");
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}

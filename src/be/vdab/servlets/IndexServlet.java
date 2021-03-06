package be.vdab.servlets;

import java.io.IOException;
import java.util.Calendar;
import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import be.vdab.entities.Adres;
import be.vdab.entities.Begroeting;
import be.vdab.entities.Persoon;


@WebServlet("/index.htm")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String INDEX_REQUESTS = "indexRequests";
	private static final String VIEW = "/WEB-INF/JSP/index.jsp";

	@Override
	public void init() throws ServletException {
		this.getServletContext().setAttribute(INDEX_REQUESTS, new AtomicInteger());
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		((AtomicInteger) this.getServletContext().getAttribute(INDEX_REQUESTS))
		.incrementAndGet();
		request.setAttribute("nu", Calendar.getInstance().getTime());
		request.setAttribute("aantalPizzasVerkocht", 23000);
		request.setAttribute("zaakvoerder",
				new Persoon("Luigi", "Peperone", 7, true, new Adres("Grote markt", "3", 9700, "Oudenaarde")));
		request.setAttribute("begroeting", new Begroeting());
		request.setAttribute("emailAdresWebMaster", this.getServletContext().getInitParameter("emailAdresWebMaster"));
		request.getRequestDispatcher(VIEW).forward(request, response);
	}
}

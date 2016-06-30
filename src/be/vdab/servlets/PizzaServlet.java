package be.vdab.servlets;

import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import be.vdab.dao.PizzaDAO;

/**
 * Servlet implementation class PizzaServlet
 */
@WebServlet("/pizzas.htm")
public class PizzaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String PIZZAS_REQUESTS = "pizzasRequests";
	private final PizzaDAO pizzaDAO = new PizzaDAO();
	private static final String VIEW = "/WEB-INF/JSP/pizzas.jsp";

	@Override
	public void init() throws ServletException {
		this.getServletContext().setAttribute(PIZZAS_REQUESTS, new AtomicInteger());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		((AtomicInteger) this.getServletContext().getAttribute(PIZZAS_REQUESTS))
		.incrementAndGet();
		request.setAttribute("pizzas", pizzaDAO.findAll());
		request.getRequestDispatcher(VIEW).forward(request, response);

	}

}

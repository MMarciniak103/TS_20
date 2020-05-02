package com.mmarciniak.servlets;

import com.mmarciniak.models.reservation.Reservation;
import com.mmarciniak.repository.GenericRepository;
import com.mmarciniak.repository.Repository;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {

    GenericRepository genericRepository = new GenericRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String command = req.getParameter("command");

            if (command == null)
                command = "LIST";

            switch (command) {
                case "LIST":
                    showPanel(req, resp);
                    break;
                case "DELETE":
                    cancelReservation(req,resp);
                    break;
                default:break;

            }


        }catch (Exception ex){
            throw new ServletException(ex);
        }


    }

    private void showPanel(HttpServletRequest request,HttpServletResponse response) throws Exception{

        HttpSession httpSession = request.getSession();
        RequestDispatcher dispatcher= request.getRequestDispatcher("/reservation-form.jsp");

        if (httpSession.getAttribute("isAdmin") != null) {

            genericRepository.setClazz(Reservation.class);

            List<Reservation> reservations = genericRepository.findAll();

            request.setAttribute("reservations", reservations);
             dispatcher = request.getRequestDispatcher("/reservationsPanel.jsp");

        }
        else{
            request.setAttribute("error","You don't have admin permissions");
        }

        dispatcher.forward(request,response);


    }

    private void cancelReservation(HttpServletRequest request, HttpServletResponse response) throws Exception {


        // odczytanie danych z formularza
        int id = Integer.parseInt(request.getParameter("reservationId"));

        // usuniecie telefonu z BD
        genericRepository.setClazz(Reservation.class);

        Reservation reservation = (Reservation) genericRepository.findById(id);

        genericRepository.delete(reservation);

        List<Reservation> reservations = genericRepository.findAll();

        request.setAttribute("reservations",reservations);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/reservationsPanel.jsp");

        dispatcher.forward(request,response);

    }


}

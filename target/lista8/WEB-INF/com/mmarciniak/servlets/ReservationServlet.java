package com.mmarciniak.servlets;

import com.mmarciniak.models.reservation.Reservation;
import com.mmarciniak.models.reservation.RoomType;
import com.mmarciniak.models.user.User;

import com.mmarciniak.repository.GenericRepository;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;

@WebServlet("/ReservationServlet")
public class ReservationServlet  extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    { }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        GenericRepository genericRepository = new GenericRepository();

        User user;
        LocalDate dateFrom;
        LocalDate dateTo;
        float price = 0;
        RoomType room = null;
        float totalPrice;

        try
        {
            String firstName = req.getParameter("firstName");
            String lastName = req.getParameter("lastName");
            String email = req.getParameter("email");

            if(firstName.isEmpty() || lastName.isEmpty() || email.isEmpty()){
                throw new IllegalArgumentException("You must provide all user's information!");
            }
            user = new User(firstName,lastName,email);

            dateFrom = LocalDate.parse(req.getParameter("dateFrom"));
            dateTo = LocalDate.parse(req.getParameter("dateTo"));

            if(dateFrom.isAfter(dateTo)){
                throw new IllegalArgumentException("Booking period cannot end before start date!");
            }

            String roomType = req.getParameter("roomType");

            genericRepository.setClazz(RoomType.class);
            switch (roomType) {
                case "Exclusive":
                    room = (RoomType) genericRepository.findById(1);
                    price = room.getRoomPrice();
                    break;
                case "Normal":
                    room = (RoomType) genericRepository.findById(2);
                    price = room.getRoomPrice();
                    break;
                case "Budget":
                    room = (RoomType) genericRepository.findById(3);
                    price = room.getRoomPrice();
                    break;
            }

            int period = Period.between(dateFrom, dateTo).getDays();
            totalPrice = price * period;

            HttpSession httpSession = req.getSession();
            Object sessionPrice = httpSession.getAttribute("totalPrice");
            if(sessionPrice == null){
                httpSession.setAttribute("totalPrice",totalPrice);
            }
            else{
               float currentPrice = (float) sessionPrice;
               httpSession.setAttribute("totalPrice",currentPrice+totalPrice);
            }

            Reservation reservation = new Reservation(user,dateFrom,dateTo,room,totalPrice);

            genericRepository.setClazz(Reservation.class);
            genericRepository.save(reservation);

//            genericRepository.setClazz(User.class);
//            genericRepository.save(user);


            req.setAttribute("reservationData",reservation);
        }catch (IllegalArgumentException ex){
            req.setAttribute("error",ex.getMessage());
        }



        RequestDispatcher dispatcher = req.getRequestDispatcher("/reservationInfo.jsp");

        dispatcher.forward(req,resp);

    }
}

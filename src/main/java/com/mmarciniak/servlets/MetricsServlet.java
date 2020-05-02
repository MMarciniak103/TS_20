package com.mmarciniak.servlets;

import com.mmarciniak.models.metrics.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/MetricsServlet")
public class MetricsServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        double meanRoomPrice;
        int totalRoomsCount;
        int occupiedRoomsCount;
        int daysCount;
        Metric metric;
        double metricScore;

        try {

            meanRoomPrice = Double.parseDouble(req.getParameter("roomMeanPrice"));
            System.out.println(req.getParameter("roomsCount"));
            totalRoomsCount = Integer.parseInt(req.getParameter("roomsCount"));
            occupiedRoomsCount = Integer.parseInt(req.getParameter("roomsOccupied"));
            daysCount = Integer.parseInt(req.getParameter("daysCount"));
            String metricName = req.getParameter("metricsList");
            double totalIncome;

            if(totalRoomsCount < 0 || occupiedRoomsCount < 0 || meanRoomPrice < 0 ){
                throw new IllegalArgumentException("Input data cannot have value less than 0!");

            }
            if(totalRoomsCount < occupiedRoomsCount){
                throw new IllegalArgumentException("Occupied rooms number cannot be bigger than total number of rooms");
            }


            switch (metricName) {
                case "RevPAR":
                    double takenRoomsPct = 1. * totalRoomsCount / occupiedRoomsCount;
                    metric = new RevPAR(meanRoomPrice, takenRoomsPct, daysCount);
                    metricScore = metric.calculateMetric();
                    break;

                case "TRevPAR":
                    totalIncome = occupiedRoomsCount * meanRoomPrice * daysCount * 0.92;
                    metric = new TRevPAR(totalIncome, totalRoomsCount);
                    metricScore = metric.calculateMetric();
                    break;

                case "RevPOR":
                    totalIncome = occupiedRoomsCount * meanRoomPrice * daysCount * 0.92;
                    metric = new RevPOR(occupiedRoomsCount, totalIncome);
                    metricScore = metric.calculateMetric();
                    break;

                default:
                    metricScore = -420;
                    break;

            }

            req.setAttribute("metricScore",metricScore);
        } catch (NumberFormatException e) {
            req.setAttribute("error","Error: Illegal Number Exception!");
        } catch (IllegalArgumentException e){
            req.setAttribute("error",e.getMessage());
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/metricScore.jsp");

        dispatcher.forward(req,resp);


    }


}

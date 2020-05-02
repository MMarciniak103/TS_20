package com.mmarciniak.models.metrics;

public class TRevPAR implements Metric {

    private double totalIncome;
    private int totalRoomCount;


    public TRevPAR(double totalIncome, int totalRoomCount) {
        this.totalIncome = totalIncome;
        this.totalRoomCount = totalRoomCount;
    }

    @Override
    public double calculateMetric() {
        return totalIncome/totalRoomCount;
    }


}

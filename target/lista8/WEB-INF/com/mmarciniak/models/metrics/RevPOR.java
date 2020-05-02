package com.mmarciniak.models.metrics;

public class RevPOR implements Metric {

    private int totalOccupiedCount;
    private double totalIncome;

    public RevPOR(int totalOccupiedCount, double totalIncome) {
        this.totalOccupiedCount = totalOccupiedCount;
        this.totalIncome = totalIncome;
    }

    @Override
    public double calculateMetric() {
        return totalOccupiedCount/totalIncome;
    }
}

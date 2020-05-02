package com.mmarciniak.models.metrics;

public class RevPAR implements Metric {

    private double meanPricePerNight;
    private double takenRoomsPct;
    private int daysCount;

    public RevPAR(double meanPricePerNight, double takenRoomsPct, int daysCount) {
        this.meanPricePerNight = meanPricePerNight;
        this.takenRoomsPct = takenRoomsPct;
        this.daysCount = daysCount;
    }

    public RevPAR(double meanPricePerNight, double takenRoomsPct) {
        this.meanPricePerNight = meanPricePerNight;
        this.takenRoomsPct = takenRoomsPct;
        this.daysCount = 1;
    }

    @Override
    public double calculateMetric() {
        return meanPricePerNight * takenRoomsPct * daysCount;
    }
}

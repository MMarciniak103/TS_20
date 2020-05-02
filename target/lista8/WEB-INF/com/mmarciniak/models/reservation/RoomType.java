package com.mmarciniak.models.reservation;

import javax.persistence.*;

@Entity
@Table(name="room_types")
public class RoomType {


        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private int id;

        @Column(name = "room_price")
        private float roomPrice;
        @Column(name = "name")
        private String name;


    public RoomType() {
    }

    RoomType(float roomPrice, String name) {
            this.roomPrice = roomPrice;
            this.name = name;

        }

        public void setRoomPrice(float roomPrice) {
            this.roomPrice = roomPrice;
        }

        public void setName(String name) {
            this.name = name;
        }

        public float getRoomPrice() {
            return roomPrice;
        }

        public String getName() {
            return name;
        }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return name;
    }
}
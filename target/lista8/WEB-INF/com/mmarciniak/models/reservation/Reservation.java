package com.mmarciniak.models.reservation;

import com.mmarciniak.models.user.User;
import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "reservations")
public class Reservation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne()
    @JoinColumn(name = "user_id")
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private User user;

//    @Column(name="user_id")
//    private int userId;

    @Column(name = "start_date")
    private LocalDate startDate;

    @Column(name = "end_date")
    private LocalDate endDate;

    @ManyToOne
    @JoinColumn(name = "room_id")
    private RoomType roomType;

//    @Column(name = "room_id")
//    private int roomId;

    @Column(name = "price")
    private float price;

//    public int getUserId() {
//        return userId;
//    }
//
//    public void setUserId(int userId) {
//        this.userId = userId;
//    }

//    public int getRoomId() {
//        return roomId;
//    }
//
//    public void setRoomId(int roomId) {
//        this.roomId = roomId;
//    }

    public Reservation() {
    }

    public Reservation(User user, LocalDate startDate, LocalDate endDate, RoomType roomType, float price) {
        this.user = user;
        this.startDate = startDate;
        this.endDate = endDate;
        this.roomType = roomType;
        this.price = price;
    }

    public float getPrice() {
        return price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public RoomType getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomType roomType) {
        this.roomType = roomType;
    }



    @Override
    public String toString() {
        return "Reservation{" +
                "user=" + user +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", roomType=" + roomType +
                ", price=" + price +
                '}';
    }
}

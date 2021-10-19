package com.company.shoe_store.data.entity;

//import jakarta.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name = "products")
public class Product {
    // Data
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    //@Basic
    //@Column(name = "subproduct_id", nullable = false)
    //private Integer subproductId;

    @JsonBackReference
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "subproduct_id", nullable = false)
    private Subproduct subproductObject;

    @Basic
    @Column(name = "size", nullable = false, columnDefinition = "DECIMAL", precision = 3, scale = 1)
    private Double size;

    @Basic
    @Column(name = "price", nullable = false, columnDefinition = "DECIMAL", precision = 10, scale = 2)
    private Double price;

    @Basic
    @Column(name = "availability", nullable = false)
    private Integer availability;

    //@ManyToMany(mappedBy = "productsInOrder")
    //List<Order> orders;

    @JsonManagedReference
    @OneToMany(mappedBy = "productObject", fetch = FetchType.LAZY)
    private List<OrderDetail> orderDetails;

    @JsonManagedReference
    @OneToMany(mappedBy = "productObjectCart", fetch = FetchType.LAZY)
    private List<CartItem> cartItems;

    // Constructors
    public Product() {
    }

    //// Getters and Setters
    //public Integer getId() {
    //    return id;
    //}
    //
    //public void setId(Integer id) {
    //    this.id = id;
    //}
    //
    //public Integer getItemId() {
    //    return itemId;
    //}
    //
    //public void setItemId(Integer itemId) {
    //    this.itemId = itemId;
    //}
    //
    //public String getColor() {
    //    return color;
    //}
    //
    //public void setColor(String color) {
    //    this.color = color;
    //}
    //
    //public Double getSize() {
    //    return size;
    //}
    //
    //public void setSize(Double size) {
    //    this.size = size;
    //}
    //
    //public Double getPrice() {
    //    return price;
    //}
    //
    //public void setPrice(Double price) {
    //    this.price = price;
    //}
    //
    //public Integer getAvailability() {
    //    return availability;
    //}
    //
    //public void setAvailability(Integer availability) {
    //    this.availability = availability;
    //}
    //
    //public List<OrderDetail> getOrderDetails() {
    //    return orderDetails;
    //}
    //
    //public void setOrderDetails(List<OrderDetail> orderDetails) {
    //    this.orderDetails = orderDetails;
    //}

    // Methods
    //@Override
    //public String toString() {
    //    return ReflectionToStringBuilder.toString(this, ToStringStyle.MULTI_LINE_STYLE);
    //}
    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                //", subproductObject=" + subproductObject +
                ", subproductId=" + subproductObject.getId() +
                ", size=" + size +
                ", price=" + price +
                ", availability=" + availability +
                ", orderDetails=" + orderDetails +
                ", cartItems=" + cartItems +
                '}';
    }

}

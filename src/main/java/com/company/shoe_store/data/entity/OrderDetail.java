package com.company.shoe_store.data.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "order_details")
public class OrderDetail {
    // Data
    //@Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id")
    //private Integer id;
    @EmbeddedId
    private OrderDetailKey key;

    //@Column(name = "orderId")
    //private Integer orderId;
    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("orderIdKey")
    @JoinColumn(name = "order_id", nullable = false)
    private Order orderObject;

    //@Column(name = "productId")
    //private Integer productId;
    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("productIdKey")
    @JoinColumn(name = "product_id", nullable = false)
    private Product productObject;

    @Column(name = "quantity_ordered", nullable = false)
    private Integer quantityOrdered;

    // Constructors
    public OrderDetail() {
    }

    //// Getters and Setters
    ////public Integer getId() {
    ////    return id;
    ////}
    ////
    ////public void setId(Integer id) {
    ////    this.id = id;
    ////}
    //
    ////public Integer getOrderId() {
    ////    return orderId;
    ////}
    ////
    ////public void setOrderId(Integer orderId) {
    ////    this.orderId = orderId;
    ////}
    ////
    ////public Integer getProductId() {
    ////    return productId;
    ////}
    ////
    ////public void setProductId(Integer productId) {
    ////    this.productId = productId;
    ////}
    //
    //public OrderDetailKey getKey() {
    //    return key;
    //}
    //
    //public void setKey(OrderDetailKey key) {
    //    this.key = key;
    //}
    //
    //public Order getOrderObject() {
    //    return orderObject;
    //}
    //
    //public void setOrderObject(Order orderObject) {
    //    this.orderObject = orderObject;
    //}
    //
    //public Product getProductObject() {
    //    return productObject;
    //}
    //
    //public void setProductObject(Product productObject) {
    //    this.productObject = productObject;
    //}
    //
    //public Integer getQuantityOrdered() {
    //    return quantityOrdered;
    //}
    //
    //public void setQuantityOrdered(Integer quantityOrdered) {
    //    this.quantityOrdered = quantityOrdered;
    //}

    // Methods
    //@Override
    //public String toString() {
    //    return "OrderDetail{" +
    //            "key=" + key +
    //            //", orderId=" + orderId +
    //            ", orderId=" + orderObject.getId() +
    //            //", productId=" + productId +
    //            ", productId=" + productObject.getId() +
    //            ", quantityOrdered=" + quantityOrdered +
    //            '}';
    //}
    //@Override
    //public String toString() {
    //    return ReflectionToStringBuilder.toString(this, ToStringStyle.MULTI_LINE_STYLE);
    //}
    @Override
    public String toString() {
        return "OrderDetail{" +
                "key=" + key +
                //", orderObject=" + orderObject +
                ", orderId=" + orderObject.getId() +
                //", productObject=" + productObject +
                ", productId=" + productObject.getId() +
                ", quantityOrdered=" + quantityOrdered +
                '}';
    }

}

package com.company.shoe_store.data.entity;

//import jakarta.persistence.Column;
//import jakarta.persistence.Embeddable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class OrderDetailKey implements Serializable {

    @Column(name = "order_id")
    private Integer orderIdKey;

    @Column(name = "product_id")
    private Integer productIdKey;

    public OrderDetailKey() {
    }

    public Integer getOrderIdKey() {
        return orderIdKey;
    }

    public void setOrderIdKey(Integer orderIdKey) {
        this.orderIdKey = orderIdKey;
    }

    public Integer getProductIdKey() {
        return productIdKey;
    }

    public void setProductIdKey(Integer productIdKey) {
        this.productIdKey = productIdKey;
    }

    @Override
    public String toString() {
        return "OrderDetailKey{" +
                "orderIdKey=" + orderIdKey +
                ", productIdKey=" + productIdKey +
                '}';
    }

}

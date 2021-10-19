package com.company.shoe_store.data.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class CartItemKey implements Serializable {

    @Column(name = "user_id")
    private Integer userIdKey;

    @Column(name = "product_id")
    private Integer productIdKey;

    public CartItemKey() {
    }

    public Integer getUserIdKey() {
        return userIdKey;
    }

    public void setUserIdKey(Integer userIdKey) {
        this.userIdKey = userIdKey;
    }

    public Integer getProductIdKey() {
        return productIdKey;
    }

    public void setProductIdKey(Integer productIdKey) {
        this.productIdKey = productIdKey;
    }

    @Override
    public String toString() {
        return "CartItemKey{" +
                "userIdKey=" + userIdKey +
                ", productIdKey=" + productIdKey +
                '}';
    }

}

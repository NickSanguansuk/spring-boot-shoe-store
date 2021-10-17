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

    @Override
    public String toString() {
        return "CartItemKey{" +
                "userIdKey=" + userIdKey +
                ", productIdKey=" + productIdKey +
                '}';
    }

}

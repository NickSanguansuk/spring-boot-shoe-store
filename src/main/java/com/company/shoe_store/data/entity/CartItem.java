package com.company.shoe_store.data.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "cart_items")
public class CartItem {
    // Data
    @EmbeddedId
    private CartItemKey key;

    @JsonBackReference
    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("userIdKey")
    @JoinColumn(name = "user_id", nullable = false)
    private User userObjectCart;

    @JsonBackReference
    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("productIdKey")
    @JoinColumn(name = "product_id", nullable = false)
    private Product productObjectCart;

    @Basic
    @Column(name = "quantity", nullable = false)
    private Integer quantity;

    // Constructors
    public CartItem() {
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "key=" + key +
                //", userObjectCart=" + userObjectCart +
                ", userId=" + userObjectCart.getId() +
                //", productObjectCart=" + productObjectCart +
                ", productId=" + productObjectCart.getId() +
                ", quantity=" + quantity +
                '}';
    }

}

package com.company.shoe_store.data.repository;

import com.company.shoe_store.data.entity.CartItem;
import com.company.shoe_store.data.entity.CartItemKey;
import com.company.shoe_store.data.entity.Product;
import com.company.shoe_store.data.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, CartItemKey> {

    CartItem findCartItemByUserObjectCartAndProductObjectCart(@Param("userObjectCart")User userObjectCart, @Param("productObjectCart")Product productObjectCart);

    List<CartItem> findCartItemsByUserObjectCart(@Param("userObjectCart")User userObjectCart);



}

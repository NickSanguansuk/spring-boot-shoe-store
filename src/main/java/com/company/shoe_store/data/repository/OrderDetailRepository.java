package com.company.shoe_store.data.repository;

import com.company.shoe_store.data.entity.Order;
import com.company.shoe_store.data.entity.OrderDetail;
import com.company.shoe_store.data.entity.OrderDetailKey;
import com.company.shoe_store.data.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, OrderDetailKey> {

    OrderDetail findOrderDetailByOrderObjectAndProductObject(@Param("orderObject")Order orderObject, @Param("productObject") Product productObject);

    List<OrderDetail> findOrderDetailsByOrderObject(@Param("orderObject")Order orderObject);

}

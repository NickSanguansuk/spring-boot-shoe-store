package com.company.shoe_store.data.repository;

import com.company.shoe_store.data.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    Order findOrderById(@Param("id") Integer id);

}

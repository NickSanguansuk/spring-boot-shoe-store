package com.company.shoe_store.data.repository;

import com.company.shoe_store.data.entity.Item;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ItemRepository extends JpaRepository<Item, Long> {

    Item findItemById(@Param("id") Integer id);

    @Query("SELECT i FROM Item i WHERE lower(i.name) like lower(concat('%', :name, '%'))")
    List<Item> findItemsByNameContains(@Param("name") String name);

}

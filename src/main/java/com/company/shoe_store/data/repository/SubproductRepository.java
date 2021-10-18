package com.company.shoe_store.data.repository;

import com.company.shoe_store.data.entity.Subproduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SubproductRepository extends JpaRepository<Subproduct, Long> {

    Subproduct findSubproductById(@Param("id") Integer id);

}

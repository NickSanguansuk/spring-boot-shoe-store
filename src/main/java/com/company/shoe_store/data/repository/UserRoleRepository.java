package com.company.shoe_store.data.repository;

import com.company.shoe_store.data.entity.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

public interface UserRoleRepository extends JpaRepository<UserRole, Long> {

    UserRole findUserRoleById(@Param("id") Integer id);



}

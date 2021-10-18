package com.company.shoe_store.data.entity;

//import jakarta.persistence.*;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name = "items")
public class Item {

    public enum Gender {
        MEN, WOMEN, UNISEX, KIDS
    }

    public enum Category {
        CASUAL, RUNNING, HIKING, TRAINING, BASKETBALL, BOOTS, SANDALS
    }

    // Data
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @Basic
    @Column(name = "brand", nullable = false)
    private String brand;

    @Basic
    @Column(name = "gender", nullable = false)
    @Enumerated(EnumType.STRING)
    private Gender gender;

    @Basic
    @Column(name = "category", nullable = false)
    @Enumerated(EnumType.STRING)
    private Category category;

    @Basic
    @Column(name = "star_rating", columnDefinition = "DECIMAL", precision = 9, scale = 8)
    private Double starRating;

    @Basic
    @Column(name = "review_count")
    private Integer reviewCount;

    @Basic
    @Column(name = "description")
    private String description;

    @JsonManagedReference
    @OneToMany(mappedBy = "itemObject", fetch = FetchType.LAZY)
    private List<Subproduct> subproducts = new ArrayList<>();

    // Constructors
    public Item() {
    }

    //// Getters and Setters
    //public Integer getId() {
    //    return id;
    //}
    //
    //public void setId(Integer id) {
    //    this.id = id;
    //}
    //
    //public String getBrand() {
    //    return brand;
    //}
    //
    //public void setBrand(String brand) {
    //    this.brand = brand;
    //}
    //
    //public String getName() {
    //    return name;
    //}
    //
    //public void setName(String name) {
    //    this.name = name;
    //}
    //
    //public Gender getGender() {
    //    return gender;
    //}
    //
    //public void setGender(Gender gender) {
    //    this.gender = gender;
    //}
    //
    //public Category getCategory() {
    //    return category;
    //}
    //
    //public void setCategory(Category category) {
    //    this.category = category;
    //}
    //
    //public Double getStarRating() {
    //    return starRating;
    //}
    //
    //public void setStarRating(Double starRating) {
    //    this.starRating = starRating;
    //}
    //
    //public Integer getReviewCount() {
    //    return reviewCount;
    //}
    //
    //public void setReviewCount(Integer reviewCount) {
    //    this.reviewCount = reviewCount;
    //}
    //
    //public String getDescription() {
    //    return description;
    //}
    //
    //public void setDescription(String description) {
    //    this.description = description;
    //}

    // Methods
    //@Override
    //public String toString() {
    //    return ReflectionToStringBuilder.toString(this, ToStringStyle.MULTI_LINE_STYLE);
    //}
    @Override
    public String toString() {
        return "Item{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", brand='" + brand + '\'' +
                ", gender=" + gender +
                ", category=" + category +
                ", starRating=" + starRating +
                ", reviewCount=" + reviewCount +
                ", description='" + description + '\'' +
                '}';
    }

}

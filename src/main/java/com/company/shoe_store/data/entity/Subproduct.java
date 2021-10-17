package com.company.shoe_store.data.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "subproducts")
public class Subproduct {
    // Data
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Basic
    @Column(name = "item_id", nullable = false)
    private Integer itemId;

    @Basic
    @Column(name = "color", nullable = false)
    private String color;

    @Basic
    @Column(name = "image_1", nullable = false)
    private String image1;

    @Basic
    @Column(name = "image_2")
    private String image2;

    @Basic
    @Column(name = "image_3")
    private String image3;

    @Basic
    @Column(name = "image_4")
    private String image4;

    @Basic
    @Column(name = "image_5")
    private String image5;

    @Basic
    @Column(name = "image_6")
    private String image6;

    // Constructors
    public Subproduct() {
    }

    @Override
    public String toString() {
        return "Subproduct{" +
                "id=" + id +
                ", itemId=" + itemId +
                ", color='" + color + '\'' +
                ", image1='" + image1 + '\'' +
                ", image2='" + image2 + '\'' +
                ", image3='" + image3 + '\'' +
                ", image4='" + image4 + '\'' +
                ", image5='" + image5 + '\'' +
                ", image6='" + image6 + '\'' +
                '}';
    }

}

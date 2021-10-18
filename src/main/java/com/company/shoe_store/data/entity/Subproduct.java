package com.company.shoe_store.data.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

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

    //@Basic
    //@Column(name = "item_id", nullable = false)
    //private Integer itemId;

    @JsonBackReference
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "item_id", nullable = false)
    private Item itemObject;

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

    @JsonManagedReference
    @OneToMany(mappedBy = "subproductObject", fetch = FetchType.LAZY)
    private List<Product> products = new ArrayList<>();

    // Constructors
    public Subproduct() {
    }

    @Override
    public String toString() {
        return "Subproduct{" +
                "id=" + id +
                //", itemObject=" + itemObject +
                ", itemId=" + itemObject.getId() +
                ", color='" + color + '\'' +
                ", image1='" + image1 + '\'' +
                ", image2='" + image2 + '\'' +
                ", image3='" + image3 + '\'' +
                ", image4='" + image4 + '\'' +
                ", image5='" + image5 + '\'' +
                ", image6='" + image6 + '\'' +
                ", products=" + products +
                '}';
    }

}

package com.cdw.store.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "group_product")
public class GroupProduct {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Long id;
    private String name;
    private Long price;
    private String description;
    private Integer discount; // % giam
    private Integer status; //0 hidden 1:show
    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private Category category;
    @JsonIgnore
    @OneToMany(mappedBy = "groupProduct", cascade = CascadeType.ALL)
    private List<Image> images = new ArrayList<>();
    @JsonIgnore
    @OneToMany(mappedBy = "groupProduct", cascade = CascadeType.ALL)
    private List<Product> products = new ArrayList<>();

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;
        GroupProduct groupProduct = (GroupProduct) o;
        return Objects.equals(id, groupProduct.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}

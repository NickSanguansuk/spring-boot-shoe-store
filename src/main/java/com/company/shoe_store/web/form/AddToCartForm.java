package com.company.shoe_store.web.form;

import javax.validation.constraints.Min;

public class AddToCartForm {

    @Min(value = 0, message = "The product quantity value must be positive.")
    private Integer productQuantity;

    public AddToCartForm() {
    }

    public Integer getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(Integer productQuantity) {
        this.productQuantity = productQuantity;
    }

    @Override
    public String toString() {
        return "AddToCartForm{" +
                "productQuantity=" + productQuantity +
                '}';
    }
}

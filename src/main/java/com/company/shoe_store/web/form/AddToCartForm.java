package com.company.shoe_store.web.form;

import javax.validation.constraints.Min;

public class AddToCartForm {

    private Integer productQuantity;

    @Min(value = 0L, message = "The product quantity value must be positive.")
    public AddToCartForm() {
    }

    public Integer getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(Integer productQuantity) {
        this.productQuantity = productQuantity;
    }

}

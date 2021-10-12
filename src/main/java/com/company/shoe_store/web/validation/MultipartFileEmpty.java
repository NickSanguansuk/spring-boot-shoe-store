package com.company.shoe_store.web.validation;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = MultipartFileEmptyImpl.class)
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface MultipartFileEmpty {

    String message() default "{MultipartFileEmpty}";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

}
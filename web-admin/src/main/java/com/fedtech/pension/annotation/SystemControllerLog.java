package com.fedtech.pension.annotation;

import java.lang.annotation.*;

/**
 * Created by CoderQiang on 2017/1/16.
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SystemControllerLog {
    String description()  default "";
}

module org.springframework.petclinic.main {
    exports org.springframework.samples.petclinic;

    requires cache.api;

    requires java.activation;
    requires java.instrument;
    requires java.persistence;
    requires java.sql;
    requires java.transaction;
    requires java.validation;
    requires java.xml.bind;

    requires org.hibernate.validator;

    requires spring.beans;
    requires spring.core;
    requires spring.context;
    requires spring.tx;
    requires spring.web;
    requires spring.webmvc;
    requires spring.data.commons;
    requires spring.data.jpa;
    requires spring.boot;
    requires spring.boot.autoconfigure;

}

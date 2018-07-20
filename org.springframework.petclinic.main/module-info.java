module org.springframework.petclinic.main {
    exports org.springframework.samples.petclinic;

    requires java.xml.bind;

    requires javax.inject;
    requires javax.transaction.api;

    requires validation.api;

    requires hibernate.validator;
    requires hibernate.core;
    requires hibernate.jpa;

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
    requires cache.api;
    requires spring.context;
    requires spring.tx;


}

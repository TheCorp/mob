package com.mob.model.flag;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;


@Entity
@Table(name = "flaggedhelp")
public class Flag {

    private long id;
    private String key;
    private String value;

    @Id
    @GeneratedValue(strategy = IDENTITY)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Column(name="flagkey")
    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    @Column(name="flagValue")
    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}

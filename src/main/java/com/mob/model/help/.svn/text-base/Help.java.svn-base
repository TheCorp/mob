package com.mob.model.help;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Oct 2, 2009
 * Time: 4:56:23 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "helpcenter")
public class Help {

    private long id;
    private String pageName;
    private String value;

    @Id
    @GeneratedValue(strategy = IDENTITY)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Column(name="helpvalue")
    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
    @Column(name="helpkey")
	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
}

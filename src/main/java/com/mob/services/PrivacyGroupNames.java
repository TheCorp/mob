package com.mob.services;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Apr 17, 2009
 * Time: 6:18:53 AM
 * To change this template use File | Settings | File Templates.
 */
public enum PrivacyGroupNames {
	Public("Public"),Private("Private"),Contact("Contact"),Friend("Friend"),Colleague("Colleague"),Superior("Superior"),
    Potential_Employer("Potential Employer"),Trusted_Potential_Employer("Trusted Potential Employer"),
    Employee("Employee"),Manager("Manager"),Executive("Executive"),Potential_Employee("Potential Employee"),
    Trusted_Potential_Employee("Trusted Potential Employee");

    String name;
    PrivacyGroupNames(String name){
        this.name = name;
    }

    public String toString(){
        return name;
    }
}

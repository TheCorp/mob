package com.mob.dao.hibernate;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mob.dao.PrivacyGroupDao;
import com.mob.model.PrivacyGroup;
import com.mob.model.PrivateItems;

public class HibernatePrivacyGroupDao extends HibernateDaoSupport implements PrivacyGroupDao {

    public List loadAllPrivacyGroupsOfUser(long id) {

        String queryString = "from PrivacyGroup p where p.profile.id= :id ";
        return getHibernateTemplate().findByNamedParam(queryString, "id", id);
    }

    public List getPrivacyGroups(long id) {
        String queryString = "select distinct(pg) from PrivacyGroup pg left join fetch pg.privateItems items where pg.profile.id=:id";
        return getHibernateTemplate().findByNamedParam(queryString, "id", id);
    }

    public List getPrivacyItems(long id) {

        String queryString = "select distinct(items) from PrivateItems items join fetch items.privacyGroup pg where pg.profile.id=:id";
        return getHibernateTemplate().findByNamedParam(queryString, "id", id);
    }

    public List getPrivacyGroupNameForPrivateItem(String itemName, long id) {
        String groupName = null;
        String queryString = "select distinct(pg) from PrivacyGroup pg left join fetch pg.privateItems items where pg.profile.id=:id and items.name=:itemName";
        return getHibernateTemplate().findByNamedParam(queryString, new String[]{"id", "itemName"}, new Object[]{id, itemName});

    }

    public PrivateItems getPrivateItemWithPrivacyGroups(String name, long id) {
        String queryString = "from PrivateItems item join fetch item.privacyGroup pg where item.name like :name and pg.profile.id=:id";
        Query query = getSession().createQuery(queryString);
        query.setLong("id", id);
        query.setString("name", name);
        PrivateItems privateItem = (PrivateItems) query.uniqueResult();
        return privateItem;
    }

    public Set<PrivacyGroup> getExistingPrivacyGroups(long profileId, long privateItemId) {

        String queryString = "from PrivacyGroup pg  join fetch pg.privateItems pi where pg.profile.id " +
                "like :id";//and pi.id like :privateItemId";
        Query query = getSession().createQuery(queryString);
        query.setLong("id", profileId);
//        query.setLong("privateItemId", privateItemId);

        Set<PrivacyGroup> pg = new HashSet<PrivacyGroup>();
        List l = query.list();
        System.out.println("l:--" + l.size());
        Iterator it = l.iterator();
        while (it.hasNext()) {
            try {
                PrivacyGroup p = (PrivacyGroup) it.next();
                pg.add(p);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return pg;
    }

    public PrivacyGroup getPrivacyGroup(Long groupid) {
        String queryString = "from PrivacyGroup pg join fetch pg.privateItems pi where pg.id like :id";
        Query query = getSession().createQuery(queryString);
        query.setLong("id", groupid);
        PrivacyGroup PrivacyGroup = (PrivacyGroup) query.uniqueResult();
        return PrivacyGroup;
    }

}

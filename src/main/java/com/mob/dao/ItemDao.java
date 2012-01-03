package com.mob.dao;

import java.util.List;
import com.mob.model.profile.Item;
import com.mob.model.profile.Profile;

public interface ItemDao {

	public void addItem(Item item, Profile user);

	public List findItems(long id);
	 public List findItemsForViewProfileSearch(long id,String contactType);
	public Item findByPrimaryKey(Item item,long id);
	
	public void updateItem(Item item);
	public void delete(Item item);

}

package com.mob.services;

import java.util.List;

import com.mob.model.profile.Item;
import com.mob.model.profile.Profile;

public interface ItemService {
	
	public void addItem(Item item, Profile user,String itemFileContentType);
	public void addAudioVideoItem(Item item,Profile user,String itemFileContentType,String videoUrl);
	public void addItemURL(Item item, Profile user,String itemFileContentType,String Url);
	public void addEmployerItemURL(Item item, Profile user,String Url);
	public List findItems(long id);
	public void updateItem(Item item);
	public void delete(Item item);
	public List findItemsForViewProfileSearch(long id,String contactType);
}

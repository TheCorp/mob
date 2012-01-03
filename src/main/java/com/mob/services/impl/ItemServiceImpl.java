package com.mob.services.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;

import javax.imageio.ImageIO;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mob.dao.ItemDao;
import com.mob.model.profile.Item;
import com.mob.model.profile.Profile;
import com.mob.service.amazon.AmazonFile;
import com.mob.service.amazon.AmazonService;
import com.mob.service.group.impl.ResizedImageUtil;
import com.mob.services.ItemService;
import com.mob.util.MOBLogger;

public class ItemServiceImpl implements ItemService {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ItemServiceImpl.class);

    private ItemDao itemDao;
    private AmazonService amazonService;


    @Transactional(propagation = Propagation.REQUIRED,
            readOnly = false)
     public void addItem(Item item, Profile user, String itemFileContentType) {
    	List<AmazonFile> fileList = new ArrayList<AmazonFile>();
    	GregorianCalendar calendar = new  GregorianCalendar();
    	String strFilename = item.getItemFileName();
    	System.out.println("file being uploaded is"+strFilename);
    	int index = strFilename.lastIndexOf(".");
    	String temp = strFilename.substring(0, index);
		String ext = strFilename.substring(index);
		strFilename = temp+"_"+user.getId()+"_"+calendar.getTimeInMillis()+ext;
		System.out.println("unique name for file"+strFilename);
		File renamedFile = new File(strFilename);
		boolean isRenamed = item.getItemFile().renameTo(renamedFile);
    	LOGGER.info("content type in impl : " + itemFileContentType);
    	
    	//create amazon file object to upload the file
        AmazonFile awsFile = new AmazonFile();
        awsFile.setBucketName("mob_audio");
        if(isRenamed){
        System.out.println("renamed successfully");
        awsFile.setFileObject(renamedFile);
        awsFile.setFileName(strFilename);
        fileList.add(awsFile);
        }
       
        List keys = amazonService.storeFiles(fileList);
        
        if (keys.size() != 0) {
            if (itemFileContentType.contains("image")) {
            	
            	//Added code for saving thumb nail and original images to Amazon

				try {
					File minsizeFile = new File("min_" + strFilename);
					BufferedImage image = ImageIO.read(renamedFile);
					BufferedImage resizedImage = ResizedImageUtil.resizeToVerySamllImage(image);
					ImageIO.write(resizedImage, "png", minsizeFile);

					AmazonFile awsFile2 = new AmazonFile();
					awsFile2.setBucketName("mob_audio");
					awsFile2.setFileObject(minsizeFile);
					awsFile2.setFileName("min_" + strFilename);
					fileList.add(awsFile2);
					keys=amazonService.updateFiles(fileList);

				} catch (Exception e) {
					LOGGER.error(e.toString());
				}

				item.setImageUrl(keys.get(0).toString());
                item.setResizedImageURL(keys.get(1).toString());
            	
                //End of code for saving thumb nail and original images to Amazon
                
            } else if (itemFileContentType.contains("application") || itemFileContentType.contains("msword") ||
                    itemFileContentType.contains("text") || itemFileContentType.contains("plain")) {
            	LOGGER.info("document");
                item.setTextFileurl(keys.get(0).toString());
            } else {
                item.setVideourl(keys.get(0).toString());
            }
            LOGGER.info("key name" + keys.get(0).toString());
            itemDao.addItem(item, user); 
        }

    }

    @Transactional(propagation = Propagation.REQUIRED,
            readOnly = false)
    public void addAudioVideoItem(Item item, Profile user, String itemFileContentType, String videoUrl) {

        //System.out.println("itemFileContentType"+itemFileContentType);
        if (videoUrl != null && !videoUrl.matches("")) {
            itemDao.addItem(item, user);
        } else {
        	List<AmazonFile> fileList = new ArrayList<AmazonFile>();
        	GregorianCalendar calendar = new  GregorianCalendar();
        	String strFilename = item.getItemFileName();
        	System.out.println("file being uploaded is"+strFilename);
        	int index = strFilename.lastIndexOf(".");
        	String temp = strFilename.substring(0, index);
    		String ext = strFilename.substring(index);
    		strFilename = temp+"_"+user.getId()+"_"+calendar.getTimeInMillis()+ext;
    		System.out.println("unique name for file"+strFilename);
    		File renamedFile = new File(strFilename);
    		boolean isRenamed = item.getItemFile().renameTo(renamedFile);
        	LOGGER.info("content type in impl : " + itemFileContentType);
        	
        	//create amazon file object to upload the file
            AmazonFile awsFile = new AmazonFile();
            awsFile.setBucketName("mob_audio");
            if(isRenamed){
            System.out.println("renamed successfully");
            awsFile.setFileObject(renamedFile);
            awsFile.setFileName(strFilename);
            fileList.add(awsFile);
            }
            System.out.println("file list size" + fileList.size());
            List keys = amazonService.storeFiles(fileList);

            if (keys.size() != 0) {
                if (itemFileContentType.contains("audio") || itemFileContentType.contains("mpeg") || itemFileContentType.contains("octet-stream")) {
                    item.setAudiourl(keys.get(0).toString());//right now storing image in video url column
                }

                itemDao.addItem(item, user);
            }

        }
    }

    @Transactional(propagation = Propagation.REQUIRED,
            readOnly = false)

    public void updateItem(Item newItem) {

    	LOGGER.info("Inside updateItem");
        Item item = new Item();
        Item existingItem = itemDao.findByPrimaryKey(item, newItem.getId());

        existingItem.setId(newItem.getId());
        existingItem.setName(newItem.getName());
        existingItem.setCategory(newItem.getCategory());
        existingItem.setPrivacySetting(newItem.getPrivacySetting());

        itemDao.updateItem(existingItem);

    }
    
    @Transactional(propagation = Propagation.REQUIRED,
            readOnly = false)
    public void addItemURL(Item item, Profile user, String itemFileContentType, String Url) {
		// TODO Auto-generated method stub
        if (Url != null && !Url.matches("")) {
            itemDao.addItem(item, user);
        } 
	}

    @Transactional(propagation = Propagation.REQUIRED,
            readOnly = false)
    public void addEmployerItemURL(Item item, Profile user,  String Url) {
		// TODO Auto-generated method stub
        if (Url != null && !Url.matches("")) {
            itemDao.addItem(item, user);
        } 
	}

    public ItemDao getItemDao() {
        return itemDao;
    }

    public void setItemDao(ItemDao itemDao) {
        this.itemDao = itemDao;
    }

    public AmazonService getAmazonService() {
        return amazonService;
    }

    public void setAmazonService(AmazonService amazonService) {
        this.amazonService = amazonService;
    }

    public List findItems(long id) {
        return itemDao.findItems(id);
    }
    public List findItemsForViewProfileSearch(long id,String contactType) {
        return itemDao.findItemsForViewProfileSearch(id,contactType);
    }
 

    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void delete(Item item) {
        itemDao.delete(item);
    }


	
	

}

package com.mob.services.impl;

import com.mob.dao.BaseDao;
import com.mob.integration.IntegrationPoint;
import com.mob.integration.IntegrationPointListener;
import com.mob.integration.UserDataIntegrator;
import com.mob.model.Contact;
import com.mob.model.Role;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.group.Group;
import com.mob.model.profile.Item;
import com.mob.model.profile.Profile;
import com.mob.service.amazon.AmazonFile;
import com.mob.service.amazon.AmazonService;
import com.mob.service.group.impl.ResizedImageUtil;
import com.mob.services.UserManagement;
import com.mob.util.FileUtil;
import com.mob.util.MOBLogger;
import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;

/**
 * Created by IntelliJ IDEA. User: ezone Date: Feb 4, 2009 Time: 1:36:11 PM To
 * change this template use File | Settings | File Templates.
 */
public class UserManagementServiceImpl implements UserManagement {

	/**
	 * Logger for logging messages.
	 */
	private static final MOBLogger LOGGER = new MOBLogger(
			UserManagementServiceImpl.class);

	private BaseDao<User> userDao;
	private BaseDao<Profile> profileDao;
	private BaseDao<Group> groupDao;
	private AmazonService  amazonService;
	private BaseDao<Employer> employerDao;
	

	public void setUserDao(BaseDao<User> userDao) {
		this.userDao = userDao;
	}

	private IntegrationPoint integrationPoint;

	public void setIntegrationPoint(IntegrationPoint integrationPoint) {
		this.integrationPoint = integrationPoint;
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void registerUser(User user) {
		LOGGER.info("Inside registerUser");
		// To change body of implemented methods use File | Settings | File
		// Templates.
		this.userDao.save(user);
		informIntegrationPoint(user);
	}

	@Transactional(readOnly = false, propagation = Propagation.NEVER)
	private void informIntegrationPoint(User user) {
		LOGGER.info("Inside informIntegrationPoint");
		List<IntegrationPointListener> listeners = this.integrationPoint
				.getListeners();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		for (IntegrationPointListener listener : listeners) {
			UserDataIntegrator userIntegrator = listener
					.getUserDataIntegrator();
			if (user instanceof Employer) {
				userIntegrator.employerRegistered((Employer) user, request,
						response);
			} else {
				userIntegrator.employeeRegistered(user, request, response);
			}
		}
	}

	public void deleteUser(User user) {
		// To change body of implemented methods use File | Settings | File
		// Templates.
	}

	public List<User> listAllUsers() {
		return null; // To change body of implemented methods use File |
						// Settings | File Templates.
	}

	public List<User> listAllUsersInRole(Role role) {
		return null; // To change body of implemented methods use File |
						// Settings | File Templates.
	}

	public void addAsFriend(User user, User friend) {
		// To change body of implemented methods use File | Settings | File
		// Templates.
	}

	public void subscribeToUser(User subscriber, User target) {
		// To change body of implemented methods use File | Settings | File
		// Templates.
	}

	public List<Contact> returnFriends(User user) {
		return null; // To change body of implemented methods use File |
						// Settings | File Templates.
	}

	@Transactional(readOnly = false, propagation = Propagation.NEVER)
	public void updatePicture(Profile profile, String picture,
			String uploadFileName) {
		// TODO Auto-generated method stub
		if (picture != null) {
			File upload = new File(picture);
			try {

				BufferedImage image = ImageIO.read(new File(picture));
				BufferedImage resizedImage = ResizedImageUtil.resizeImage(image);
				String profileDir = ServletActionContext.getServletContext()
						.getRealPath("/profile/");
				File userProfileDir = new File(profileDir, "mid_"
						+ new Long(profile.getId()).toString());
				if (!userProfileDir.exists()) {
					userProfileDir.mkdir();
				}
				File theFile = new File(userProfileDir, uploadFileName);
				ImageIO.write(resizedImage, "png", theFile);

				profile.setResizedMidPicture("/profile/" + "mid_"
						+ new Long(profile.getId()).toString() + "/"
						+ uploadFileName);

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			try {

				BufferedImage image = ImageIO.read(new File(picture));
				BufferedImage resizedToSmallImage = ResizedImageUtil.resizeToSamllImage(image);
				String profileDir = ServletActionContext.getServletContext()
						.getRealPath("/profile/");
				File userProfileDir = new File(profileDir, "min_"
						+ new Long(profile.getId()).toString());
				if (!userProfileDir.exists()) {
					userProfileDir.mkdir();
				}
				File theFile = new File(userProfileDir, uploadFileName);
				ImageIO.write(resizedToSmallImage, "png", theFile);

				profile.setResizedMinPicture("/profile/" + "min_"
						+ new Long(profile.getId()).toString() + "/"
						+ uploadFileName);

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			String profileDir = ServletActionContext.getServletContext()
					.getRealPath("/profile/");
			File userProfileDir = new File(profileDir, "max_"
					+ new Long(profile.getId()).toString());
			if (!userProfileDir.exists()) {
				userProfileDir.mkdir();
			}
			File theFile = new File(userProfileDir, uploadFileName);

			try {
				FileUtil.saveFile(upload, theFile.getAbsolutePath());
			} catch (Exception e) {
				if (userProfileDir.exists()) {
					userProfileDir.delete();
				}
				throw new RuntimeException(e);

			}

			profile.setPicture("/profile/" + "max_"
					+ new Long(profile.getId()).toString() + "/"
					+ uploadFileName);
			this.profileDao.update(profile);
		}
	}

	@Transactional(readOnly = false, propagation = Propagation.NEVER)
	public void updateUserPicture(User user, String picture,
			String uploadFileName) {
		System.out.println("user magmt");
		if (picture != null) {
			System.out.println("picture not null");
			File upload = new File(picture);

			String userDir = ServletActionContext.getServletContext()
					.getRealPath("/profile/");
			File userDirectory = new File(userDir, new Long(user.getId())
					.toString());
			if (!userDirectory.exists()) {
				System.out.println("user dir exists");
				userDirectory.mkdir();
			}
			File theFile = new File(userDirectory, uploadFileName);

			try {
				FileUtil.saveFile(upload, theFile.getAbsolutePath());
			} catch (Exception e) {
				if (userDirectory.exists()) {
					userDirectory.delete();
				}
				throw new RuntimeException(e);

			}
			System.out.println("update user");
			user.setPicture("/profile/" + new Long(user.getId()).toString()
					+ "/" + uploadFileName);
			this.userDao.update(user);
		}
	}

	public BaseDao<Profile> getProfileDao() {
		return profileDao;
	}

	public void setProfileDao(BaseDao<Profile> profileDao) {
		this.profileDao = profileDao;
	}

	@Transactional(readOnly = false, propagation = Propagation.NEVER)
	public void updateGroupPicture(Group group, String picture,
			String uploadFileName) {
		if (picture != null) {
			File upload = new File(picture);
			try {

				BufferedImage image = ImageIO.read(new File(picture));
				BufferedImage resizedImage = ResizedImageUtil.resizeImage(image);
				String profileDir = ServletActionContext.getServletContext()
						.getRealPath("/profile/group/");
				File userProfileDir = new File(profileDir, "min_"
						+ new Long(group.getId()).toString());
				if (!userProfileDir.exists()) {
					userProfileDir.mkdir();
				}
				File theFile = new File(userProfileDir, uploadFileName);
				ImageIO.write(resizedImage, "png", theFile);
				group.setResizedPicture("/profile/group/" + "min_"
						+ new Long(group.getId()).toString() + "/"
						+ uploadFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}

			String profileDir = ServletActionContext.getServletContext()
					.getRealPath("/profile/group/");
			File userProfileDir = new File(profileDir, "max_"
					+ new Long(group.getId()).toString());
			if (!userProfileDir.exists()) {
				userProfileDir.mkdir();
			}
			File theFile = new File(userProfileDir, uploadFileName);

			try {
				FileUtil.saveFile(upload, theFile.getAbsolutePath());
			} catch (Exception e) {
				if (userProfileDir.exists()) {
					userProfileDir.delete();
				}
				

			}

			group.setIcon("/profile/group/" + "max_"
							+ new Long(group.getId()).toString() + "/"
							+ uploadFileName);
			groupDao.update(group);
		}

	}

	
	
	/*  @Transactional(propagation = Propagation.REQUIRED,
	            readOnly = false)
	     public void addProfilePicture(Profile profile, String picture,
	    		 String uploadFileName, String itemFileContentType) {
		  File upload = new File(picture);
		  System.out.println("profile" +profile.getUpload());
		  List<AmazonFile> fileList = new ArrayList<AmazonFile>();
		  String strFilename = uploadFileName;
		  String  resizedMidImage=uploadFileName;
		  String  resizedMinImage=uploadFileName;
		  System.out.println("file being uploaded is"+strFilename);
		  int index = strFilename.lastIndexOf(".");
		  String temp = strFilename.substring(0, index);
		  String ext = strFilename.substring(index);
		  strFilename = temp+"_"+profile.getId()+ext;
		  resizedMidImage=temp+"_"+"mid"+"_"+profile.getId()+ext;
		  resizedMinImage=temp+"_"+"min"+"_"+profile.getId()+ext;

		  System.out.println("unique name for file"+strFilename);
		  System.out.println("unique name for file"+resizedMidImage);
		  System.out.println("unique name for file"+resizedMinImage);

		  File renamedFile = new File(strFilename);
		  File  renamedResizedMidImage =  new File(resizedMidImage);
		  File  renamedResizedMinImage =  new File(resizedMinImage);

		  boolean isRenamed = false;
		  try {
			  isRenamed = upload.renameTo(renamedFile);
			  isRenamed=upload.renameTo(renamedResizedMidImage);
			  isRenamed=upload.renameTo(renamedResizedMinImage);
		  } catch (RuntimeException e) {
			  // TODO Auto-generated catch block
			  e.printStackTrace();
			  System.out.println("e.getMessage" +e.getMessage());
		  }
		  LOGGER.info("content type in impl : " + itemFileContentType);
		  System.out.println("content type in impl : " + itemFileContentType);
		  //create amazon file object to upload the file
		  AmazonFile awsFile = new AmazonFile();
		  AmazonFile awsFileMid = new AmazonFile();
		  AmazonFile awsFileMin = new AmazonFile();

		  awsFile.setBucketName("mob_profile");
		  if(isRenamed){
			  awsFile.setFileObject(renamedFile);
			  awsFile.setFileName(strFilename);
			  fileList.add(awsFile);
		  }
		  System.out.println("file list size" + fileList.size());
		  List keys = amazonService.storeFiles(fileList);

		  if (keys.size() != 0) {
			  if (itemFileContentType.contains("image")) {
				  System.out.println("keys.get(0).toString()" +keys.get(0).toString());
				  try {
					  BufferedImage image = ImageIO.read(new File(keys.get(0).toString()));
					  BufferedImage resizedImage = ResizedImageUtil.resizeImage(image);
					  ImageIO.write(resizedImage, "png", renamedFile);
					  profile.setResizedMidPicture(keys.get(0).toString());
				  } catch (Exception e) {
					  e.printStackTrace();
				  }
				  try {
					  BufferedImage image = ImageIO.read(new File(keys.get(0).toString()));
					  BufferedImage resizedToSmallImage = ResizedImageUtil.resizeToSamllImage(image);
					  ImageIO.write(resizedToSmallImage, "png", renamedFile);
					  profile.setResizedMinPicture(keys.get(0).toString());
				  } catch (Exception e) {
					  e.printStackTrace();
				  }
				  profile.setPicture(keys.get(0).toString());//right now storing image in picture column
			  } 


		  }

		  this.profileDao.update(profile);
	  }*/
	
/*	@Override
	public void addGroupPicture(Group group, String picture,
			String uploadFileName, String itemFileContentType) {
		// TODO Auto-generated method stub
		
}	*/
	
	@Transactional(propagation = Propagation.REQUIRED,
            readOnly = false)
     public void addGroupPicture(Group group, String picture,
 			String uploadFileName, String itemFileContentType) {
		File upload = new File(picture);
//		System.out.println("profile" +group.getUpload());
		List<AmazonFile> fileList = new ArrayList<AmazonFile>();
		//List keys; = amazonService.storeFiles(fileList);
		GregorianCalendar calendar = new  GregorianCalendar();
		String strFilename = uploadFileName;
//		System.out.println("file being uploaded is"+strFilename);
		int index = strFilename.lastIndexOf(".");
		String temp = strFilename.substring(0, index);
		String ext = strFilename.substring(index);

		strFilename = temp+"_"+group.getId()+ext;
//		System.out.println("unique name for file"+strFilename);
		File renamedFile = new File(strFilename);
		boolean isRenamed = false;
		try {
			isRenamed = upload.renameTo(renamedFile);
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
//			System.out.println("e.getMessage" +e.getMessage());
		}
		LOGGER.info("content type in impl : " + itemFileContentType);
//		System.out.println("content type in impl : " + itemFileContentType);
		//create amazon file object to upload the file
		AmazonFile awsFile = new AmazonFile();
		
		awsFile.setBucketName("mob_group");
		
		if(isRenamed){
			awsFile.setFileObject(renamedFile);
			awsFile.setFileName(strFilename);
			fileList.add(awsFile);
		}
		 List keys = amazonService.storeFiles(fileList);
//		System.out.println("file list size" + fileList.size());
		
		if (keys.size() != 0) {
			if (itemFileContentType.contains("image")) {
//				System.out.println("keys.get(0).toString()" +keys.get(0).toString());

				try {
					File midsizeFile = new File("mid_" + strFilename);
					BufferedImage image = ImageIO.read(renamedFile);
					BufferedImage resizedImage = ResizedImageUtil.resizeImage(image);
					ImageIO.write(resizedImage, "png", midsizeFile);

					AmazonFile awsFile1 = new AmazonFile();
					awsFile1.setBucketName("mob_group");
					awsFile1.setFileObject(midsizeFile);
					awsFile1.setFileName("mid_" + strFilename);
					fileList.add(awsFile1);
					keys=amazonService.storeFiles(fileList);

				} catch (Exception e) {
					e.printStackTrace();
				}

					} 

			group.setIcon(keys.get(0).toString());
			group.setResizedPicture(keys.get(1).toString());
			this.groupDao.update(group);
		}
	}	
	
	
	@Transactional(propagation = Propagation.REQUIRED,
            readOnly = false)
     public void addProfilePicture(Profile profile, String picture,
    		 String uploadFileName, String itemFileContentType) {
		File upload = new File(picture);
		System.out.println("profile" +profile.getUpload());
		List<AmazonFile> fileList = new ArrayList<AmazonFile>();
		//List keys; = amazonService.storeFiles(fileList);
		GregorianCalendar calendar = new  GregorianCalendar();
		String strFilename = uploadFileName;
		System.out.println("file being uploaded is"+strFilename);
		int index = strFilename.lastIndexOf(".");
		String temp = strFilename.substring(0, index);
		String ext = strFilename.substring(index);

		strFilename = temp+"_"+profile.getId()+ext;
		System.out.println("unique name for file"+strFilename);
		File renamedFile = new File(strFilename);
		boolean isRenamed = false;
		try {
			isRenamed = upload.renameTo(renamedFile);
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("e.getMessage" +e.getMessage());
		}
		LOGGER.info("content type in impl : " + itemFileContentType);
		System.out.println("content type in impl : " + itemFileContentType);
		//create amazon file object to upload the file
		AmazonFile awsFile = new AmazonFile();
		
		awsFile.setBucketName("mob_profile");
		
		if(isRenamed){
			awsFile.setFileObject(renamedFile);
			awsFile.setFileName(strFilename);
			fileList.add(awsFile);
		}
		 List keys = amazonService.storeFiles(fileList);
		System.out.println("file list size" + fileList.size());
		
		if (keys.size() != 0) {
			if (itemFileContentType.contains("image")) {
				System.out.println("keys.get(0).toString()" +keys.get(0).toString());

				try {
					File midsizeFile = new File("mid_" + strFilename);
					BufferedImage image = ImageIO.read(renamedFile);
					BufferedImage resizedImage = ResizedImageUtil.resizeImage(image);
					ImageIO.write(resizedImage, "png", midsizeFile);

					AmazonFile awsFile1 = new AmazonFile();
					awsFile1.setBucketName("mob_profile");
					awsFile1.setFileObject(midsizeFile);
					awsFile1.setFileName("mid_" + strFilename);
					fileList.add(awsFile1);
					keys=amazonService.storeFiles(fileList);

				} catch (Exception e) {
					e.printStackTrace();
				}

				try {
					File minsizeFile = new File("min_" + strFilename);
					BufferedImage image = ImageIO.read(renamedFile);
					BufferedImage resizedImage = ResizedImageUtil.resizeToSamllImage(image);
					ImageIO.write(resizedImage, "png", minsizeFile);

					AmazonFile awsFile2 = new AmazonFile();
					awsFile2.setBucketName("mob_profile");
					awsFile2.setFileObject(minsizeFile);
					awsFile2.setFileName("min_" + strFilename);
					fileList.add(awsFile2);
					keys=amazonService.storeFiles(fileList);

				} catch (Exception e) {
					e.printStackTrace();
				}



				//profile.setPicture(keys.get(0).toString());//right now storing image in picture column
			} 

			profile.setPicture(keys.get(0).toString());
			profile.setResizedMidPicture(keys.get(1).toString());
			profile.setResizedMinPicture(keys.get(2).toString());


			this.profileDao.update(profile);
		}
	}	
	@Transactional(propagation = Propagation.REQUIRED,
            readOnly = false)
     public void addEmployerPicture(Employer employer, String picture,
    		 String uploadFileName, String itemFileContentType) {
		File upload = new File(picture);
		System.out.println("profile" +employer.getUpload());
		List<AmazonFile> fileList = new ArrayList<AmazonFile>();
		//List keys; = amazonService.storeFiles(fileList);
		GregorianCalendar calendar = new  GregorianCalendar();
		String strFilename = uploadFileName;
		System.out.println("file being uploaded is"+strFilename);
		int index = strFilename.lastIndexOf(".");
		String temp = strFilename.substring(0, index);
		String ext = strFilename.substring(index);

		strFilename = temp+"_"+employer.getId()+ext;
		System.out.println("unique name for file"+strFilename);
		File renamedFile = new File(strFilename);
		boolean isRenamed = false;
		try {
			isRenamed = upload.renameTo(renamedFile);
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("e.getMessage" +e.getMessage());
		}
		LOGGER.info("content type in impl : " + itemFileContentType);
		System.out.println("content type in impl : " + itemFileContentType);
		//create amazon file object to upload the file
		AmazonFile awsFile = new AmazonFile();
		
		awsFile.setBucketName("mob_EmployerProfile");
		
		if(isRenamed){
			awsFile.setFileObject(renamedFile);
			awsFile.setFileName(strFilename);
			fileList.add(awsFile);
		}
		 List keys = amazonService.storeFiles(fileList);
		System.out.println("file list size" + fileList.size());
		
		if (keys.size() != 0) {
			if (itemFileContentType.contains("image")) {
				System.out.println("keys.get(0).toString()" +keys.get(0).toString());

				try {
					File midsizeFile = new File("mid_" + strFilename);
					BufferedImage image = ImageIO.read(renamedFile);
					BufferedImage resizedImage = ResizedImageUtil.resizeImage(image);
					ImageIO.write(resizedImage, "png", midsizeFile);

					AmazonFile awsFile1 = new AmazonFile();
					awsFile1.setBucketName("mob_EmployerProfile");
					awsFile1.setFileObject(midsizeFile);
					awsFile1.setFileName("mid_" + strFilename);
					fileList.add(awsFile1);
					keys=amazonService.storeFiles(fileList);

				} catch (Exception e) {
					e.printStackTrace();
				}

				try {
					File minsizeFile = new File("min_" + strFilename);
					BufferedImage image = ImageIO.read(renamedFile);
					BufferedImage resizedImage = ResizedImageUtil.resizeToSamllImage(image);
					ImageIO.write(resizedImage, "png", minsizeFile);

					AmazonFile awsFile2 = new AmazonFile();
					awsFile2.setBucketName("mob_EmployerProfile");
					awsFile2.setFileObject(minsizeFile);
					awsFile2.setFileName("min_" + strFilename);
					fileList.add(awsFile2);
					keys=amazonService.storeFiles(fileList);

				} catch (Exception e) {
					e.printStackTrace();
				}



				//profile.setPicture(keys.get(0).toString());//right now storing image in picture column
			} 

			employer.setPicture(keys.get(0).toString());
			employer.setResizedMidPicture(keys.get(1).toString());
			employer.setResizedMinPicture(keys.get(2).toString());

			this.employerDao.update(employer);
		}
	}	
	
	public BaseDao<Group> getGroupDao() {
		return groupDao;
	}

	public void setGroupDao(BaseDao<Group> groupDao) {
		this.groupDao = groupDao;
	}

	public AmazonService getAmazonService() {
		return amazonService;
	}

	public void setAmazonService(AmazonService amazonService) {
		this.amazonService = amazonService;
	}

	public BaseDao<Employer> getEmployerDao() {
		return employerDao;
	}

	public void setEmployerDao(BaseDao<Employer> employerDao) {
		this.employerDao = employerDao;
	}

	

	
	
}

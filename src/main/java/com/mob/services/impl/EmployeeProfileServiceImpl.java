package com.mob.services.impl;

import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Date;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import javax.imageio.ImageIO;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.apache.struts2.ServletActionContext;

import com.mob.dao.EmployeeProfileDao;
import com.mob.model.profile.Education;
import com.mob.model.profile.Industry;
import com.mob.model.profile.PhysicalTraits;
import com.mob.model.profile.Profile;
import com.mob.model.profile.SkillsDetails;
import com.mob.model.profile.Training;
import com.mob.model.profile.WorkExperience;
import com.mob.service.amazon.AmazonFile;
import com.mob.service.amazon.AmazonService;
import com.mob.service.group.impl.ResizedImageUtil;
import com.mob.services.EmployeeProfileService;
import com.mob.services.BaseService;
import com.mob.util.MOBLogger;
import com.mob.util.FileUtil;

public class EmployeeProfileServiceImpl implements EmployeeProfileService {

	private BaseService<Education> educationService;
	private BaseService<Training> trainingService;
	private BaseService<Profile> profileService;
	private BaseService<WorkExperience> workExperienceService;
	private AmazonService  amazonService;
	public void setEducationService(BaseService<Education> educationService) {
		this.educationService = educationService;
	}

	public void setProfileService(BaseService<Profile> profileService) {
		this.profileService = profileService;
	}

	public void setTrainingService(BaseService<Training> trainingService) {
		this.trainingService = trainingService;
	}

	/**
	 * Logger for logging messages.
	 */
	private static final MOBLogger LOGGER = new MOBLogger(
			EmployeeProfileServiceImpl.class);

	private EmployeeProfileDao employeeProfileDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List<Profile> findByUserProfiles(Profile t, long id) {
		return employeeProfileDao.findByUserProfiles(t, id);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List<Education> findEducationList(Education t, long id) {
		return employeeProfileDao.findEducationList(t, id);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List<WorkExperience> findExperienceList(WorkExperience t, long id) {
		return employeeProfileDao.findExperienceList(t, id);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List<Training> findTrainingList(Training t, long id) {
		return employeeProfileDao.findTrainingList(t, id);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List findUserSkillsList(SkillsDetails t, long id) {

		return employeeProfileDao.findUserSkillsList(t, id);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List findUserPhysicalTraits(PhysicalTraits t, long id) {
		return employeeProfileDao.findUserPhysicalTraits(t, id);
	}

	
	public EmployeeProfileDao getEmployeeProfileDao() {
		return employeeProfileDao;
	}

	public void setEmployeeProfileDao(EmployeeProfileDao employeeProfileDao) {
		this.employeeProfileDao = employeeProfileDao;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public Profile viewProfileCount(Profile newProfile, long id) {
		/*LOGGER.info("in side viewprofile");
		LOGGER.info("id:--"+newProfile.getId());
		long count=0;
		Profile existingProfile = new Profile();
		existingProfile = employeeProfileDao.viewProfileCount(existingProfile,id);
		LOGGER.info("existingProfile"+existingProfile.getViewCount());	
		count = existingProfile.getViewCount();
		count =count+1;
		LOGGER.info("count:--"+count);		
		existingProfile.setViewCount(count);
		employeeProfileDao.updateProfile(existingProfile);*/
		return employeeProfileDao.viewProfileCount(newProfile, id);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void delete(Profile profile) {
		employeeProfileDao.delete(profile);

	}

	/*public List findAllIndustryList() {
		return employeeProfileDao.findIndustryList();
	}*/

	public List getCategories(long id) {
		return employeeProfileDao.getCategories(id);
	}

	public List getSkillsList(long id) {
		return employeeProfileDao.getSkillsList(id);
	}

	public Industry getIndustryForCategories(String industryName) {

		return employeeProfileDao.getIndustryForCategories(industryName);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void modifyProfileEducationDetails(Profile profile,
			long[] education_id, String[] schoolName, String[] degree,
			java.sql.Date[] courseStart, java.sql.Date[] courseEnd,
			String[] concentration, String[] gpa, String[] honors,
			long[] deleteeducationrow, String[] newSchoolName,
			String[] newDegree, java.sql.Date[] newEducationStart,
			java.sql.Date[] newEducationEnd, String[] newConcentration,
			  long[] year,String[] major,String[] minor,
			String[] newGpa, String[] newHonors, String[] newTrainingName,
			long[] deltrainingrow, String picturePath, String pictureName) {

		profile = profileService.findByPrimaryKey(profile, profile.getId());

		if (schoolName != null) {
			for (int i = 0; i < schoolName.length; i++) {
				Education education = new Education();
				LOGGER.info("educ list" + education_id[i]);
				education.setId(education_id[i]);
				education.setSchoolName(schoolName[i]);
				education.setDegree(degree[i]);
				//education.setCourseStart(courseStart[i]);
				//education.setCourseEnd(courseEnd[i]);
			//	education.setConcentration(concentration[i]);
				education.setGpa(gpa[i]);
				education.setHonors(honors[i]);

				education.setOwningProfile(profile);
				educationService.update(education);

			}
		}
		if (deleteeducationrow != null) {
			for (int i = 0; i < deleteeducationrow.length; i++) {
				Education education = new Education();
				education.setId(deleteeducationrow[i]);
				education.setOwningProfile(profile);
				educationService.delete(education);
			}

		}

		if (newSchoolName != null) {
			for (int i = 0; i < newSchoolName.length; i++) {
				Education education = new Education();
				education.setSchoolName(newSchoolName[i]);
				education.setDegree(newDegree[i]);
			//	education.setCourseStart(newEducationStart[i]);
			//	education.setCourseEnd(newEducationEnd[i]);
				education.setYear(year[i]);
				education.setMajor(major[i]);
				education.setMinor(minor[i]);
				//education.setConcentration(newConcentration[i]);
				education.setGpa(newGpa[i]);
			//	education.setHonors(newHonors[i]);

				education.setOwningProfile(profile);
				educationService.create(education);

			}
		}
		/* Added for editing training details */

		if (newTrainingName != null) {
			for (int i = 0; i < newTrainingName.length; i++) {
				Training training = new Training();
				training.setName(newTrainingName[i]);
				training.setTrainingProfile(profile);
				trainingService.create(training);

			}
			newTrainingName = null;
		}
		if (deltrainingrow != null) {
			for (int i = 0; i < deltrainingrow.length; i++) {
				Training training = new Training();
				training.setId(deltrainingrow[i]);
				training.setTrainingProfile(profile);
				trainingService.delete(training);

			}
		}

		/*  LOGGER.info("picture in edit profile:---" + profile.getPicture());
		  if (!pictureName.equals("")) {
		   updatePicture(profile, picturePath, pictureName);
		  } else {
		   LOGGER.info("Picture name is null!");
		  }*/

	}



	@Transactional(propagation = Propagation.REQUIRED,
			readOnly = false)
			public void updateProfilePicture(Profile profile, String picture,
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
		List keys = amazonService.updateFiles(fileList);
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
					keys=amazonService.updateFiles(fileList);

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
					keys=amazonService.updateFiles(fileList);

				} catch (Exception e) {
					e.printStackTrace();
				}



				//profile.setPicture(keys.get(0).toString());//right now storing image in picture column
			} 

			profile.setPicture(keys.get(0).toString());
			profile.setResizedMidPicture(keys.get(1).toString());
			profile.setResizedMinPicture(keys.get(2).toString());


			this.profileService.update(profile);
		}
	}	






	public void updatePicture(Profile profile, String picture,
			String uploadFileName) {
		// TODO Auto-generated method stub
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
			BufferedImage resizedToSmallImage = ResizedImageUtil
			.resizeToSamllImage(image);
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
				+ new Long(profile.getId()).toString() + "/" + uploadFileName);
		this.profileService.update(profile);

	}

	public Profile getDefaultProfileForUser(long id) {

		return this.employeeProfileDao.getDefaultProfileForUser(id);
	}
	
	public PhysicalTraits getphysicalTraitsForUser(long id) {
		return this.employeeProfileDao.getphysicalTraitsForUser(id);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void modifyProfileDetails(Profile profile, String profileName,
			String days1, String jobcategory1, String worktimeframe1,
			String range1, String salarytype1, long[] id,
			String[] employerName, String[] description,
			java.sql.Date[] workStart, java.sql.Date[] workEnd,
			String[] newEmployerName, String[] newDescription,
			java.sql.Date[] newWorkStart, java.sql.Date[] newWorkEnd,
			long[] delexperiencerow, String picturePath, String pictureName,
			String uploadContentType,String personalStatement) {

		profile = profileService.findByPrimaryKey(profile, profile.getId());
		profile.setName(profileName);
		profile.setDays(days1);
		profile.setJobcategory(jobcategory1);
		profile.setWorkTimeframe(worktimeframe1);
		profile.setRange(range1);
		profile.setSalaryType(salarytype1);
		profile.setPersonalStatement(personalStatement);
		System.out.println("after edited profile name:--" + profile.getName());
		profileService.update(profile);

		if (employerName != null) {
			for (int i = 0; i < employerName.length; i++) {
				WorkExperience workExperience = new WorkExperience();
				workExperience.setId(id[i]);
				workExperience.setEmployerName(employerName[i]);
				workExperience.setDescription(description[i]);
				workExperience.setWorkStart(workStart[i]);
				workExperience.setWorkEnd(workEnd[i]);
				workExperience.setWorkExperienceProfile(profile);
				workExperienceService.update(workExperience);
			}
		}

		if (newEmployerName != null) {

			for (int i = 0; i < newEmployerName.length; i++) {
				WorkExperience workExperience = new WorkExperience();
				workExperience.setEmployerName(newEmployerName[i]);
				workExperience.setDescription(newDescription[i]);
				workExperience.setWorkStart(newWorkStart[i]);
				workExperience.setWorkEnd(newWorkEnd[i]);
				workExperience.setWorkExperienceProfile(profile);
				workExperienceService.create(workExperience);
			}
		}

		if (delexperiencerow != null) {
			for (int i = 0; i < delexperiencerow.length; i++) {
				WorkExperience workExperience = new WorkExperience();
				workExperience.setId(delexperiencerow[i]);
				workExperience.setWorkExperienceProfile(profile);
				workExperienceService.delete(workExperience);
			}
			delexperiencerow = null;
		}

		LOGGER.info("picture in edit profile:---" + profile.getPicture());
		if (!pictureName.equals("")) {
			updateProfilePicture(profile, picturePath, pictureName, uploadContentType);
		} else {
			LOGGER.info("Picture name is null!");
		}

	}

	public BaseService<WorkExperience> getWorkExperienceService() {
		return workExperienceService;
	}

	public void setWorkExperienceService(
			BaseService<WorkExperience> workExperienceService) {
		this.workExperienceService = workExperienceService;
	}

	public AmazonService getAmazonService() {
		return amazonService;
	}

	public void setAmazonService(AmazonService amazonService) {
		this.amazonService = amazonService;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void savePhysicalTraits(PhysicalTraits physicalTraits) {
		employeeProfileDao.savePhysicalTraits(physicalTraits);
		
	}


	public List findSkillListBySearchKey(String skillName) {
		return employeeProfileDao.findSkillListBySearchKey(skillName);
	}

	


	

	
	/*private static BufferedImage resize(BufferedImage image, int width, int height) {
		BufferedImage resizedImage = new BufferedImage(width, height,
		BufferedImage.TYPE_INT_ARGB);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(image, 0, 0, width, height, null);
		g.dispose();
		return resizedImage;
		} 
	 */

}

package com.mob.services.impl;

import java.io.File;
import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mob.dao.SW3Dao;
import com.mob.model.profile.BriefCase;
import com.mob.services.SW3Sevice;

public class SW3ServiceImpl implements SW3Sevice {
	
	private SW3Dao sW3Dao;
	
	@Transactional (propagation=Propagation.REQUIRED,
			readOnly=false)
	public void deleteFile(String key) {
		// TODO Auto-generated method stub
         sW3Dao.deleteFile(key);
	}
	@Transactional (propagation=Propagation.REQUIRED,
			readOnly=false)
	public File getFile(String key) {
		// TODO Auto-generated method stub
		return sW3Dao.getFile(key);
	}
	@Transactional (propagation=Propagation.REQUIRED,
			readOnly=false)
	public List<File> getFiles(List<String> keys) {
		// TODO Auto-generated method stub
		return sW3Dao.getFiles(keys);
	}
	@Transactional (propagation=Propagation.REQUIRED,
			readOnly=false)
	public String modifyFile(String key, File file) {
		// TODO Auto-generated method stub
		return sW3Dao.modifyFile(key, file);
	}
	@Transactional (propagation=Propagation.REQUIRED,
			readOnly=false)
	public String storeFile(BriefCase fileForBriefcase, File file) {
		// TODO Auto-generated method stub
		return sW3Dao.storeFile(fileForBriefcase, file);
	}
	@Transactional (propagation=Propagation.REQUIRED,
			readOnly=false) 
	public List<String> storeFiles(BriefCase fileForBriefcase, List<File> files) {
		// TODO Auto-generated method stub
		return sW3Dao.storeFiles(fileForBriefcase, files);
	}

	public SW3Dao getSW3Dao() {
		return sW3Dao;
	}

	public void setSW3Dao(SW3Dao dao) {
		sW3Dao = dao;
	}

	

}

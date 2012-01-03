package com.mob.services;

import java.io.File;
import java.util.List;

import com.mob.model.profile.BriefCase;



public interface SW3Sevice {
	
	/**
	* This method will store a file for a given Briefcase
	* The key related to the file in SW3 will be returned
	*/
	public String storeFile(BriefCase fileForBriefcase,File file);
	
	/**
	* This method will store the files for a given Briefcase
	* The keys related to the files in SW3 will be returned
	*/
	public List<String> storeFiles(BriefCase fileForBriefcase,
			List<File> files);

	/**
	* This method will return the files corresponding to the 
	* keys that are passed in
	*/
	public List<File> getFiles(List<String> keys);

	/**
	* This method will return the file corresponding to the 
	* key that is passed in
	*/
	public File getFile(String key);

	/**
	* This method will modify the file on amazon for the key
	*/
	public String modifyFile(String key, File file);
	
	/**
	* This method will delete the file on amazon for the key
	*/
	public void deleteFile(String key);


}

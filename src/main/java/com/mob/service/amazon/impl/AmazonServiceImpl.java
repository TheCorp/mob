package com.mob.service.amazon.impl;

//import com.amazonaws.s3.doc._2006_03_01.CreateBucketDocument;
//import com.amazonaws.s3.doc._2006_03_01.ListAllMyBucketsDocument;
//import com.amazonaws.s3.doc._2006_03_01.ListAllMyBucketsEntry;
//import com.amazonaws.s3.doc._2006_03_01.ListAllMyBucketsResponseDocument;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jets3t.service.S3Service;
import org.jets3t.service.S3ServiceException;
import org.jets3t.service.impl.rest.httpclient.RestS3Service;
import org.jets3t.service.model.S3Bucket;
import org.jets3t.service.model.S3Object;
import org.jets3t.service.security.AWSCredentials;

import com.mob.service.amazon.AmazonFile;
import com.mob.service.amazon.AmazonService;
import com.mob.util.MOBLogger;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Dec 1, 2008
 * Time: 2:06:12 PM
 * To change this template use File | Settings | File Templates.
 */
public class AmazonServiceImpl implements AmazonService {
    //    private AmazonS3Stub amazon;
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(AmazonServiceImpl.class);

    private S3Service amazon;
    private static final String SERVICE_NAME = "AmazonS3";
    private static final String LIST_ALL_MY_BUCKETS_OP = "ListAllMyBuckets";
    private static final String CREATE_BUCKET_OP = "CreateBucket";
    private static final String ACCESS_KEY = "0W86ZDYG5F0JN9RN8JR2";
    private static final String PRIVATE_KEY = "RkYnsJeVfzQrS6NtwvlZW0+j1KAx1llfMY24mpf1";
    private Map<String, S3Bucket> bucketMap = new HashMap<String, S3Bucket>();
    private static AWSCredentials cred;

    public void init() {
        cred = new AWSCredentials(ACCESS_KEY, PRIVATE_KEY);
        try {
        	LOGGER.info("Inside init");
        	System.out.println("init:---");
            this.amazon = new RestS3Service(cred);
            S3Bucket[] buckets = this.amazon.listAllBuckets();
            if (buckets == null || buckets.length < 10) {
                bucketMap.put("mob_videos", amazon.createBucket("mob_videos"));
                bucketMap.put("mob_audio", amazon.createBucket("mob_audio"));
                bucketMap.put("mob_text", amazon.createBucket("mob_text"));
                bucketMap.put("mob_profile", amazon.createBucket("mob_profile"));
                bucketMap.put("mob_group", amazon.createBucket("mob_group"));
                bucketMap.put("mob_group", amazon.createBucket("mob_EmployerProfile"));
                LOGGER.info("Buckets created");
            } else {
                for (S3Bucket bucket : buckets) {
                    bucketMap.put(bucket.getName(), bucket);
                    System.out.println("(bucket.getName()" +bucket.getName());
                }
            }
            LOGGER.info("Amazon initialized");
        } catch (S3ServiceException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }

    public List<String> storeFiles(List<AmazonFile> files) {
        List<String> keys = new ArrayList<String>();
        int i=0;
        for (AmazonFile file : files) {
            try {
            	LOGGER.info("Inside storeFiles");
                S3Bucket bucket = bucketMap.get(file.getBucketName());
                S3Object fileObject = new S3Object(bucket, file.getFileName());
                fileObject.setDataInputFile(file.getFileObject());
                S3Object key = this.amazon.putObject(bucket, fileObject);
                LOGGER.info("Got key " + key.getKey());
                keys.add(key.getKey());
            } catch (S3ServiceException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }
        }
        return keys;  //To change body of implemented methods use File | Settings | File Templates.
    }

    public List<String> updateFiles(List<AmazonFile> files) {
        List<String> keys = new ArrayList<String>();
        int i=0;
        for (AmazonFile file : files) {
            try {
            	LOGGER.info("Inside updateFiles");
                S3Bucket bucket = bucketMap.get(file.getBucketName());
                S3Object fileObject = new S3Object(bucket, file.getFileName());
                fileObject.setDataInputFile(file.getFileObject());
                S3Object key = this.amazon.putObject(bucket, fileObject);
                LOGGER.info("Got key " + key.getKey());
                keys.add(key.getKey());
            } catch (S3ServiceException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }
        }
        return keys;  //To change body of implemented methods use File | Settings | File Templates.        //To change body of implemented methods use File | Settings | File Templates.
    }

    public void deleteFiles(List<AmazonFile> files) {
        List<String> keys = new ArrayList<String>();
        int i=0;
        for (AmazonFile file : files) {
            try {
            	LOGGER.info("Inside deleteFiles");
                S3Bucket bucket = bucketMap.get(file.getBucketName());
                this.amazon.deleteObject(bucket, file.getAmazonObjectKey());
            } catch (S3ServiceException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }
        }
    }

    public static List<String> getSignedUrl(String bucket, List<String> keys) {
    	LOGGER.info("Inside getSignedUrl");
    	System.out.println("bucket Name" +bucket);
        Date secondsSinceEpoch = calculateExpiryTime(1000) ;// 1000;
        List<String> urls = new ArrayList<String>(keys.size());
        for (String key : keys) {
        	LOGGER.info("Getting URL for " + key);
            try {
                String url = S3Service.createSignedGetUrl(bucket, key,
                        cred, secondsSinceEpoch);
                LOGGER.info("Got URL " + url);
                urls.add(url);
            } catch (S3ServiceException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            } catch (Throwable e){
                e.printStackTrace();
            }
        }
        return urls;  //To change body of implemented methods use File | Settings | File Templates.
    }

    private static Date calculateExpiryTime(int secondsUntilExpiry) {
    	LOGGER.info("Inside calculateExpiryTime");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH,1);
        cal.add(Calendar.SECOND, secondsUntilExpiry);
        return cal.getTime();
    }
    
    public  void  createProfileBucket(long  profileId){
    	 /* cred = new AWSCredentials(ACCESS_KEY, PRIVATE_KEY);
          try {
          	LOGGER.info("Inside init");
          	System.out.println("init:---");
              this.amazon = new RestS3Service(cred);
              S3Bucket[] buckets = this.amazon.listAllBuckets();
              
              System.out.println("buckets.legth" +buckets.length);
              if (profileId!=0) {
                  //bucketMap.put(amazon.getBucket("mob_profile")+"profile"+profileId, amazon.createBucket(amazon.getBucket("mob_profile")+"/"+"profile"+profileId));
            	// bucketMap.put(amazon.getBucket("mob_profile"), amazon.createBucket("profile"+profileId));
            	  bucketMap.put("mob_profile",amazon.createBucket("profile"+profileId));
            	 
                  LOGGER.info("Buckets created");
              } else {
                  for (S3Bucket bucket : buckets) {
                      bucketMap.put(bucket.getName(), bucket);
                  }
              }
              LOGGER.info("Amazon initialized");
          } catch (S3ServiceException e) {
              e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
          }
    	*/
    }
}

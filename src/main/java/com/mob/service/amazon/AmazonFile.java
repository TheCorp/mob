package com.mob.service.amazon;

import java.io.File;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Dec 15, 2008
 * Time: 11:03:26 AM
 * To change this template use File | Settings | File Templates.
 */
public class AmazonFile {
    private String bucketName;
    private File fileObject;
    private String fileName;
    private String amazonObjectKey;

    public String getAmazonObjectKey() {
        return amazonObjectKey;
    }

    public void setAmazonObjectKey(String amazonObjectKey) {
        this.amazonObjectKey = amazonObjectKey;
    }

    public String getBucketName() {
        return bucketName;
    }

    public void setBucketName(String bucketName) {
        this.bucketName = bucketName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public File getFileObject() {
        return fileObject;
    }

    public void setFileObject(File fileObject) {
        this.fileObject = fileObject;
    }
}

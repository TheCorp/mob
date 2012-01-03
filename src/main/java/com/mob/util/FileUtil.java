package com.mob.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class FileUtil {

	
	public static final void saveFile(File file, String name)
    throws Exception{
    OutputStream outStream = null;
    InputStream inputStream = null;
    try {
        File saveFile = new File(name);
        if(saveFile.exists()){
            saveFile.delete();
        }
        if(saveFile.createNewFile()){
            outStream = new FileOutputStream(saveFile);
            inputStream = new FileInputStream(file);

            int read = inputStream.read();
            while(read != -1){
                outStream.write(read);
                read = inputStream.read();
            }
            outStream.flush();
        }
    } finally{
        if(outStream != null){
            try {
                outStream.close();
            } catch (IOException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }
        }
        if(inputStream != null){
            try {
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }
        }
    }
}
}

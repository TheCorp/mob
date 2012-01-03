package com.mob.service.group.impl;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.Transparency;
import java.awt.image.BufferedImage;

public class ResizedImageUtil {
	

	
	
	public static BufferedImage resizeImage(BufferedImage image){
		int maxWidth=150;
		int maxHeight=200;
		int imageWidth=image.getWidth();
		int imageHight=image.getHeight();
		double resizedImageWidth;
		double resizedImageHight;
		double aspectRratio=(double)imageWidth/imageHight; 
		if(imageWidth<=150&&imageHight<=150){
			resizedImageWidth=imageWidth;
			resizedImageHight=imageHight;
		}else
			if(imageWidth>=imageHight){
				resizedImageWidth=150;
				resizedImageHight=150/aspectRratio;
			}
			else{
				resizedImageHight=150;
				resizedImageWidth=150*aspectRratio;
				
			}
			/*if(imageWidth==imageHight){
				resizedImageWidth=maxWidth;
				resizedImageHight=maxHeight;
			}
			else if(imageWidth>imageHight){
			resizedImageWidth=maxWidth;
			resizedImageHight=(double)(imageHight*resizedImageWidth)/imageWidth;
			if(resizedImageHight>200){
				resizedImageHight=200;
			}
			
		}else{
		 resizedImageHight=maxHeight;
		 resizedImageWidth=(double)(imageWidth*resizedImageHight)/imageHight;
		 if(resizedImageWidth>200){
			 resizedImageWidth=200;
			}
		}*/
		BufferedImage resizedImage = getScaledInstance(image,(int)resizedImageWidth,(int)resizedImageHight, RenderingHints.VALUE_INTERPOLATION_BILINEAR, true);
		
		
		
		return resizedImage;
	}
	
	
	public static BufferedImage resizeToSamllImage(BufferedImage image){
		int maxWidth=50;
		int maxHeight=50;
		/*int imageWidth=image.getWidth();
		int imageHight=image.getHeight();
		double resizedImageWidth;
		double resizedImageHight;
		
		if(imageWidth<=60&&imageHight<=60){
			resizedImageWidth=maxWidth;
			resizedImageHight=maxHeight;
		}else
		 if(imageWidth>imageHight){
			resizedImageWidth=maxWidth;
			double tempsize=(double)imageWidth/imageHight;
			resizedImageHight=resizedImageWidth/tempsize;
			
		}else{
		 resizedImageHight=maxWidth;
		 double tempsize=imageHight/imageWidth;
		 resizedImageWidth=resizedImageHight/tempsize;
		}
		*/
		BufferedImage resizedImage = getScaledInstance(image,maxWidth,maxHeight, RenderingHints.VALUE_INTERPOLATION_BILINEAR, true);
		
		
		
		return resizedImage;
	}
	
	public static BufferedImage resizeToVerySamllImage(BufferedImage image){
		int maxWidth=39;
		int maxHeight=29;
		
		BufferedImage resizedImage = getScaledInstance(image,maxWidth,maxHeight, RenderingHints.VALUE_INTERPOLATION_BILINEAR, true);
		return resizedImage;
	}
	
	
	
	public static BufferedImage getScaledInstance(BufferedImage img, int targetWidth,
			int targetHeight, Object hint, boolean higherQuality) {
		int type = (img.getTransparency() == Transparency.OPAQUE) ? BufferedImage.TYPE_INT_RGB
				: BufferedImage.TYPE_INT_ARGB;
		BufferedImage ret = (BufferedImage) img;
		int w, h;
		if (higherQuality) {
			// Use multi-step technique: start with original size, then
			// scale down in multiple passes with drawImage()
			// until the target size is reached
			w = img.getWidth();
			h = img.getHeight();
		} else {
			// Use one-step technique: scale directly from original
			// size to target size with a single drawImage() call
			w = targetWidth;
			h = targetHeight;
		}

		do {
			if (higherQuality && w > targetWidth) {
				w /= 2;
				if (w < targetWidth) {
					w = targetWidth;
				}
			}

			if (higherQuality && h > targetHeight) {
				h /= 2;
				if (h < targetHeight) {
					h = targetHeight;
				}
			}

			BufferedImage tmp = new BufferedImage(w, h, type);
			Graphics2D g2 = tmp.createGraphics();
			g2.setRenderingHint(RenderingHints.KEY_INTERPOLATION, hint);
			g2.drawImage(ret, 0, 0, w, h, null);
			g2.dispose();

			ret = tmp;
		} while (w != targetWidth || h != targetHeight);

		return ret;
	}

}

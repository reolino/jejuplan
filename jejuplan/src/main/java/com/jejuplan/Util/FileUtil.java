package com.jejuplan.Util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.web.multipart.MultipartFile;
import com.jejuplan.common.domain.FileVO;

public class FileUtil {
	
	public static FileVO fileUpload( MultipartFile files, FileVO fileVO, String desUploadFileDir) throws IOException {    	
        String fileName = files.getOriginalFilename(); 
        String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase(); 
        File destinationFile; 
        String destinationFileName;
        
        do { 
            destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension; 
            destinationFile = new File(desUploadFileDir+ destinationFileName); 
        } while (destinationFile.exists()); 
        
        destinationFile.getParentFile().mkdirs(); 
        files.transferTo(destinationFile); 
        
        fileVO.setFile_nm(destinationFileName);
        fileVO.setFile_origin_nm(fileName);
        fileVO.setFile_url(desUploadFileDir);
        fileVO.setFile_size(files.getSize());
        fileVO.setFile_ext(fileNameExtension);

        return fileVO;
	}
	
	public static void fileDownload(FileVO fileVO, HttpServletRequest request, HttpServletResponse response) {
		try{
            String fileUrl = fileVO.getFile_url();
            fileUrl += "/";
            String savePath = fileUrl;
            String fileName = fileVO.getFile_nm();
            
            String oriFileName = fileVO.getFile_origin_nm();
            InputStream in = null;
            OutputStream os = null;
            File file = null;
            boolean skip = false;
            String client = "";
            
            try{
                file = new File(savePath, fileName);
                in = new FileInputStream(file);
            } catch (FileNotFoundException fe) {
                skip = true;
            }
            
            client = request.getHeader("User-Agent");
            
            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");
            
            if (!skip) {
                // IE
                if (client.indexOf("MSIE") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                // IE 11 above.
                } else if (client.indexOf("Trident") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                } else {
                    response.setHeader("Content-Disposition",
                            "attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
                    response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }
                response.setHeader("Content-Length", "" + file.length());
                os = response.getOutputStream();
                byte b[] = new byte[(int) file.length()];
                int leng = 0;
                while ((leng = in.read(b)) > 0) {
                    os.write(b, 0, leng);
                }
            } else {
                response.setContentType("text/html;charset=UTF-8");
                System.out.println("<script language='javascript'>alert('File Not Found');history.back();</script>");
            }
            in.close();
            os.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e.getMessage());
        }
	}
	
	public static FileVO fileDelete(FileVO fileVO) throws IOException {    	
        String fileName = fileVO.getFile_url() + fileVO.getFile_nm(); 
        
        File file = new File(fileName);
        
        if( file.exists() ){
            if(file.delete()){
                System.out.println("file delete success");
            }else{
                System.out.println("file delete fail");
            }
        }else{
            System.out.println("file not found");
        }

        return fileVO;
	}
}

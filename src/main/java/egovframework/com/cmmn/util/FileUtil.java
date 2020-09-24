package egovframework.com.cmmn.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtil")
public class FileUtil {
    
    private Log log = LogFactory.getLog(this.getClass());
    
	@Autowired(required=false)
	private ProfileCls profileCls;
	
    public List<FileVo> parseFileInfo(FileVo vo, HttpServletRequest request) throws Exception {
    	log.debug(profileCls.getRootPath());
    	List<FileVo> fileList = new ArrayList<FileVo>();
    	List<MultipartFile> totalFile = new ArrayList<MultipartFile>();
    	
    	String IDX = String.valueOf(vo.getIdx());
    	String creaID = (String) vo.getCreate_user();
    	
    	File target = new File(profileCls.getRootPath());
    	if(!target.exists()) target.mkdirs();
    	
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
		MultiValueMap<String, MultipartFile> file = multi.getMultiFileMap();
		
		Iterator<String> keys = file.keySet().iterator();
		
		while (keys.hasNext()) {
			String key = keys.next();
			
			List<MultipartFile> f = file.get(key);

			for (MultipartFile ff : f) {
				//System.out.println(String.format("키 : %s ------ 파일이름 : %s", key, ff.getOriginalFilename()));
				totalFile.add(ff);
			}
		}
		
		if (totalFile != null && totalFile.size() > 0) {
    		setFileInfo(totalFile, target, IDX, creaID, fileList);
    	}
		
		return fileList;
	}
    
    public void getImgFile(HttpServletResponse response, String filename) throws Exception {
		try {
			response.setContentType("application/png");
			String url = "file://" + profileCls.getRootPath();
			URL fileUrl = new URL(url + filename);
			log.debug("getRepImgFile : " + fileUrl);
			IOUtils.copy(fileUrl.openStream(), response.getOutputStream());
		}catch(FileNotFoundException e) {
			log.debug("서버에 해당 파일이 없습니다.");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

    private void setFileInfo(List<MultipartFile> totalFile, File target, String IDX, String creaID, List<FileVo> fileList) throws Exception {
    	for (MultipartFile file : totalFile) {
    		int saveFileSize = (int) file.getSize();
    		if (saveFileSize == 0) continue;
    		
    		String orgFileName = file.getOriginalFilename();
    		String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
    		String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + orgFileExtension;
    		
    		log.debug("================== file start ==================");
    		log.debug("파일 실제 이름: "+orgFileName);
    		log.debug("파일 저장 이름: "+saveFileName);
    		log.debug("파일 크기: "+saveFileSize);
    		log.debug("content type: "+file.getContentType());
    		log.debug("================== file   END ==================");
    		
    		target = new File(profileCls.getRootPath(), saveFileName);
    		file.transferTo(target);
    		
    		FileVo fileVo = new FileVo();
    		fileVo.setIdx(IDX);
    		fileVo.setOrg_file_name(orgFileName);
    		fileVo.setSave_file_name(saveFileName);
    		fileVo.setFile_size(saveFileSize);
    		fileVo.setCreate_user(creaID);
    		fileVo.setAttach_type(file.getName());
    		fileList.add(fileVo);
    	}
    }
    
    public void downloadFile(HttpServletResponse response, FileVo fileVo) throws Exception {
    	String stored_File_Name = fileVo.getSave_file_name();
		String original_File_Name = fileVo.getOrg_file_name();
		
		byte[] fileByte = FileUtils.readFileToByteArray(new File(profileCls.getRootPath() + stored_File_Name));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(original_File_Name, "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
    }
}
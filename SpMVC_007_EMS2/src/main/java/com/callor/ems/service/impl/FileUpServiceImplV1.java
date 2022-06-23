package com.callor.ems.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.callor.ems.model.FileVO;
import com.callor.ems.service.FileUpService;
import com.callor.ems.service.QualifyConfig;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service(QualifyConfig.SERVICE.File_V1)
public class FileUpServiceImplV1 implements FileUpService{

	@Autowired
	private String upPath;
	
	private final ResourceLoader resLoader;
	public FileUpServiceImplV1(ResourceLoader resLoader){
		this.resLoader = resLoader;
	}
	
	
	
		
	@Override
	public String fileUp(MultipartFile file) throws Exception {
		
		if(file == null) {
			return null;
		}
		
		upPath = resLoader.getResource("c:/file/upload")
						.getURI()
						.getPath();
		
		
		String fileName = file.getOriginalFilename();
		String strUUID = UUID.randomUUID().toString();
		fileName = String.format("%s-%s", strUUID, fileName);

		File dir = new File(upPath);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		File upLoadFile = new File(upPath, fileName);
		file.transferTo(upLoadFile);
		return fileName;
	}

	@Override
	public List<FileVO> filesUp(MultipartHttpServletRequest mFile) throws Exception{
		
		List<FileVO> retFiles = new ArrayList<>();
		List<MultipartFile> fileList = mFile.getFiles("mulFile");
		
		for(MultipartFile file : fileList) {
			String fileName = file.getOriginalFilename();
			String uuName = this.fileUp(file);
			
			FileVO fileVO = FileVO.builder()
							.i_originalName(fileName)
							.i_pathName(uuName)
							.build();
			retFiles.add(fileVO);
		}
		return retFiles;
	}

}

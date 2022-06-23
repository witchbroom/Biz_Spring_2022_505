package com.callor.images.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.callor.images.config.QualifierConfig;
import com.callor.images.model.FilesVO;
import com.callor.images.service.FileUpService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service(QualifierConfig.SERVICE.FILE_V2)
public class FileServiceImplV2 implements FileUpService{
	
	private final String upLoadFolder;
	public FileServiceImplV2(String upLoadFolder) {
		// TODO Auto-generated constructor stub
		this.upLoadFolder = upLoadFolder;
	}
	
	@Override
	public String fileUp(MultipartFile file) throws Exception {
		// TODO Auto-generated method stub
		
		if(file == null) {
			return null;
		}
		
		
		
		String fileName = file.getOriginalFilename();
		
		// UUID 문자열 생성		
		String strUUID = UUID.randomUUID().toString();
		fileName = String.format("%s-%s", strUUID, fileName);
		log.debug("변경된 파일이름 {} ", fileName);
		
		File dir = new File(upLoadFolder);
		if( !dir.exists() ) {
			dir.mkdirs();
		}
		
		File upLoadFile = new File(upLoadFolder, fileName);
		file.transferTo(upLoadFile);
		return fileName;
	}

	@Override
	public List<FilesVO> filesUp(MultipartHttpServletRequest files) throws Exception {
		
		// 업로드된 여러개의 파일정보를 fileList에 담기		
		List<FilesVO> retFiles = new ArrayList<>();
		
		// DB insert 하기위한 리스트를 만들기 위하여 생성
		List<MultipartFile> fileList = files.getFiles("mFile");
		
		// fileList 를 for() 반복문으로 반복하면서
		// 각각의 파일을 fileUp() 메서드에게 보내서 개별 파일을 업로드 수행
		// uuID fileName을 return 받기
		
		// 원래파일이름과 uuID가 부착된 파일이름으로 FilesVO 를 생성하고
		// retFiles에 추가하기
		for(MultipartFile file : fileList) {
			String originName = file.getOriginalFilename();
			String uuName = this.fileUp(file);
			
			FilesVO fileVO = FilesVO.builder()
							.i_originalName(originName)
							.i_imageName(uuName)
							.build();
			retFiles.add(fileVO);
		}
		return retFiles;		
	}

	@Override
	public boolean fileDelete(String filename) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}

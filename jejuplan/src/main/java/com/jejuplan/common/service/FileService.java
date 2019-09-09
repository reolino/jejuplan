package com.jejuplan.common.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.jejuplan.board.domain.BoardVO;
import com.jejuplan.common.domain.FileVO;
import com.jejuplan.common.mapper.FileMapper;

@Service("com.jejuplan.common.service.FileService")
public class FileService {
	@Resource(name="com.jejuplan.common.mapper.FileMapper")
    FileMapper fileMapper;

	public int fileInsert(FileVO file) throws Exception{ return
		fileMapper.fileInsert(file); 
	}
	
	public List<FileVO> fileList(FileVO file) throws Exception{
        return fileMapper.fileList(file);
    }
	
	public FileVO fileDetail(int file_no) throws Exception{ return
		fileMapper.fileDetail(file_no); 
	}
	
	public int fileDelete(FileVO file) throws Exception{ 
		return fileMapper.fileDelete(file); 
	}
	
}

package com.jejuplan.common.mapper;

import java.util.List;
import org.springframework.stereotype.Repository;

import com.jejuplan.common.domain.FileVO;

@Repository("com.jejuplan.common.mapper.FileMapper")
public interface FileMapper {
    
    public int fileInsert(FileVO file) throws Exception;
    
    public List<FileVO> fileList(FileVO file) throws Exception;
    
    public FileVO fileDetail(int file_no) throws Exception;
    
    public int fileDelete(FileVO file) throws Exception;
}

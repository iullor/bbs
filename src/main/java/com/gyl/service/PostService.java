package com.gyl.service;

import com.gyl.mapper.PostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author gyl
 */
@Service
public class PostService {
    @Autowired
    private PostMapper postMapper;



}

package com.example.demo;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;

 
@Mapper
public interface UserMapper {    
    public UserDTO findAll();
    public void insertUser(UserDTO dto);
    public int countNum();
    public UserDTO login(UserDTO dto) throws Exception;
    public int getNum(UserDTO dto);
    public int checkLike(LikeDTO dto);
    public int checkId(UserDTO dto);
    public void insertLike(LikeDTO dto) throws Exception;
    public void deleteLike(LikeDTO dto) throws Exception;
    public int likecountNum();
    public ArrayList<LikeDTO> showLike(UserDTO dto);

}


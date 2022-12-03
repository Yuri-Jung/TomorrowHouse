package dao;

import dto.BoardDto;

import java.sql.*;
import util.DatabaseUtil;
import java.util.ArrayList;

public class SearchDao {
    private Connection conn = null;
    private ResultSet rs = null;
public SearchDao(){}
//    public SearchDao() {
//        try{
//            String url = "jdbc:mysql://localhost:3306/jsp";
//            String user = "root";
//            String passwd = "1234";
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            conn = DriverManager.getConnection(url,user,passwd);
//        }
//        catch (Exception e) {
//            e.printStackTrace();
//        }
//    }


    public ArrayList<BoardDto> getSearch(String searchField, String searchText) {

        try{
//            String url = "jdbc:mysql://localhost:3306/jsp";
//            String user = "root";
//            String passwd = "1234";
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            conn = DriverManager.getConnection(url,user,passwd);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        ArrayList<BoardDto> list = new ArrayList<BoardDto>();
//        String sql = "select idx, title, userID, create_dt, hit_cnt from board where " + searchField.trim();
        String sql = "SELECT * FROM board where " + searchField.trim();

        try {
            if(searchText != null && !searchText.equals("")){
                sql += " LIKE '%" + searchText.trim() + "%' " ;
            }
            PreparedStatement pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()){
                BoardDto dto = new BoardDto();
                dto.setIdx(rs.getInt(1));
                dto.setTitle(rs.getString(2));
                dto.setUserId(rs.getString(3));
                dto.setCreateDt(rs.getString(4));
                dto.setHitCnt(rs.getInt(5));
                list.add(dto);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
}

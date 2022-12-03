package dao;

import com.mysql.cj.protocol.Resultset;
import dto.BoardDto;
import dto.CommentDto;
import util.DatabaseUtil;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;



public class BoardDao {

    Connection conn = DatabaseUtil.getConnection();
    PreparedStatement pstmt;
    ResultSet rs;
//    String url = "jdbc:mysql://localhost:3306/jsp";
//    String user = "root";
//    String passwd = "1234";


    public ArrayList<CommentDto> listComment(int boardIdx){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
//            conn = DriverManager.getConnection(url,user,passwd);

            String sql = "SELECT idx, userId, boardIdx, commentContents, commentDate, deleted_yn from comment " ;
                   sql += " where deleted_yn='N' and idx= ? " ;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            ArrayList<CommentDto> clist = new ArrayList<CommentDto>();
            while(rs.next()) {
                CommentDto dto = new CommentDto();
                dto.setIdx(rs.getInt("idx"));
                dto.setUserId(rs.getString("userId"));
                dto.setBoardIdx(rs.getInt("boardId"));
                dto.setCommentContents(rs.getString("commentContents"));
                dto.setCommentDate(rs.getString("commentDate"));

                clist.add(dto);
            }
            return clist;
        }
        catch (Exception e) {
        }
        finally {
            if(conn != null){
                try {
                    conn.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        return null;
    }
}
























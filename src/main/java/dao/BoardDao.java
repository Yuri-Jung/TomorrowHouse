//package dao;
//
//import dto.BoardDto;
//
//import javax.naming.Context;
//import javax.naming.InitialContext;
//import javax.sql.DataSource;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//
//public class BoardDao {
//    private DataSource dataSource;
////    public BoardDao(){
////        try{
////            Context initCtx = new InitialContext();
////            Context envCtx = (Context) initCtx.lookup("java:comp/env");
////
////        }
////    }
//
//    public int boardWrite(BoardDto dto){
//        Connection conn = null;
//        PreparedStatement pstmt = null;
//        int flag = 1;
//        try {
//            conn = dataSource.getConnection();
//
//            String sql = "INSERT INTO board(boardNum, userId, title, contents, create_dt) VALUES (1,?,?,?,NOW()) ";
//            pstmt = conn.prepareStatement(sql);
//            pstmt.setString(1, dto.getId());
//            pstmt.setString(2, dto.getTitle());
//            pstmt.setString(3, dto.getContents());
//            int result = pstmt.executeUpdate();
//
//            if(result == 1){
//                    flag=0;
//            }
//        }
//            catch (Exception e){
//                System.out.println("SQLException e : " + e.getMessage());
//            }
//            finally {
//            if ( pstmt != null ) try { pstmt.close(); } catch ( SQLException e ) {}
//            if( conn != null) try {conn.close();} catch (SQLException e ){}
//            }
//        return flag;
//        }
//    }
//

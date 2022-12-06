//package common;
//
//import java.io.BufferedInputStream;
//import java.io.BufferedOutputStream;
//import java.io.File;
//import java.io.FileInputStream;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//
//import com.mysql.cj.protocol.Resultset;
////import com.oreilly.servlet.*;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.jsp.JspWriter;
//import javax.servlet.jsp.PageContext;
//
//public class BoardMgr {
//    private DBConnectionMgr pool;
//    private static final String SAVEFOLDER = "C:\\InteliJ\\JSP"; //파일 업로드 위치
//
//
//    public BoardMgr() {
//        try{
//            pool = DBConnectionMgr.getInstance();
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//    }
////    총게시물 수
//    public int getTotalCount(String keyField, String keyWord){
//        Connection con = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        String sql = "";
//        int totalCount = 0;
//
//        try{
//            con = pool.getConnection();
//            if(keyWord.equals("null")|| keyWord.equals("")){
//                sql = "SELECT count(num) from board " ;
//                pstmt = con.prepareStatement(sql);
//            } else {
//                sql = "select count(num) from board where" + keyField + "like ? " ;
//                pstmt = con.prepareStatement(sql);
//                pstmt.setString(1, "%"+ keyWord + "%");
//            }
//            rs = pstmt.executeQuery();
//            if(rs.next()){
//                totalCount = rs.getInt(1);
//            }
//    }catch (Exception e){
//            e.printStackTrace();
//        } finally {
//            pool.freeConnection(con,pstmt,rs);
//        }
//        return totalCount;
//    }
//
//
////    파일 업로드
//    public void downLoad(HttpServletRequest req, HttpServletResponse res, JspWriter out, PageContext pageContext){
//        try {
//            String fileName = req.getParameter("fileName");
////            File file = new File(UtilMgr.con(SAVEFOLDER + File.separator + fileName));
//
////            byte b[] = new byte[(int) file.length()];
//            res.setHeader("Accept-Ranges", "bytes");
//            String strClient = req.getHeader("User-Agent");
//            if(strClient.indexOf("MSIE6.0")!= -1){
//                res.setContentType("application/smnet;charset=utf-8");
//                res.setHeader("Content-Disposition","attachment;filename=" + fileName +";");
//
//            } else {
//                res.setContentType("application/smnet;charset=utf-8");
//                res.setHeader("Content-Disposition","arrachment;filename=" + fileName + ";");
//            }
//            out.clear();
//            out=pageContext.pushBody();
//
//            if(file.isFile()){
//                BufferedInputStream fin = new BufferedInputStream(
//                        new FileInputStream(file));
//                BufferedOutputStream outs = new BufferedOutputStream(
//                        res.getOutputStream());
//                int read = 0;
//                while((read = fin.read(b)) !=-1){
//                    outs.write(b,0,read);
//                }
//                outs.close();
//                fin.close();
//            }
//        }
//        catch (Exception e){
//            e.printStackTrace();
//        }
//    }
////    페이징 및 블럭 테스트를 위해 1000개 삽입
//    public void post1000(){
//        Connection con = null;
//        PreparedStatement pstmt = null;
//        String sql ="";
//        try{
//            con = pool.getConnection();
//            sql = "INSERT board (boardNum,userId, title,contents, original_file_name,stored_file_path,file_size,create_dt) " ;
//            sql += "VALUES(1, 'bbb', '제목1000', '내용1000', null,null,0,now())" ;
//            pstmt = con.prepareStatement(sql);
//            for(int i = 0; i<1000; i++){
//                pstmt.executeUpdate();
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        finally {
//            pool.freeConnection(con,pstmt);
//        }
//    }
//
////    main
//    public static void main(String[] args){
//        new BoardMgr().post1000();
//        System.out.println("success");
//    }
//
//}

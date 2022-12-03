<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>
<%@ page import="com.ckfinder.connector.plugins.ImageResize" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-12-03
  Time: 오후 7:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
String returnValue = "";

            String savePath = application.getRealPath("/") + "/upload/downImg/";
            int sizeLimit = 5 * 1024 * 1024 ;  // 5 메가로 제한


            if(request.getContentLength() > sizeLimit) {

            // 오류 메세지 (5MB 이상을 첨부한 경우)

            } else {

            MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

            //파라미터
            String fileName = multi.getFilesystemName("upload");  // 파일의 이름 얻기
            String ext = null;
            String[] allowExt = {"jpg", "png", "gif"};
            int dot = 0;

            File file1  = multi.getFile("upload");

            String name = file1.getName();
            dot = name.lastIndexOf(".");

            if(dot != -1) {

            ext = name.substring(dot);

            } else {

            ext = "";

            }


            //파일 확장자 제한
            if(ImageResize.isContainsFileExt(fileName, allowExt)){

            long fixNum = (long)(100+(Math.random()*(long)999999999));
            String newName = "sample" + (fixNum) + ext;
            String newName_small = "sample" + (fixNum) +"_small" + ext;

            // 파일 객체 얻기
            File newfile = new File(file1.getParent(), newName);
            file1.renameTo(newfile);

            //============= 이미지 리사이즈 시작 =============

            String imgOriginalPath= file1.getParent() + "/" + newName;
            String imgTargetPath= file1.getParent() + "/" + newName_small;
            String imgFormat = "jpg";
            int newWidth = 680;
            int newHeight = 700;
            String mainPosition = "W";

            boolean chkSave = ImageResize.resizeImage(imgOriginalPath, imgTargetPath, imgFormat, newWidth, newHeight, mainPosition);



            returnValue = "/upload/downImg/"+newName_small;


            if(chkSave) {

            out.println("{");
            out.println("\"uploaded\": 1,");
            out.println("\"fileName\": \""+newName+"\",");
            out.println("\"url\":\""+returnValue+"\"");
            out.println("}");

            } else {


            }


            } else {

            file1.delete();

            }

            }
%>

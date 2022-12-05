<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-12-05
  Time: 오후 8:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
@RequestMapping(value="./imageUpload.do", method = RequestMethod.POST)
public void imageUpload(HttpServletRequest request, HttpSession session,
HttpServletResponse response, MultipartHttpServletRequest multiFile ,
@RequestParam MultipartFile upload) throws Exception{
// 랜덤 문자 생성
UUID uid = UUID.randomUUID();

OutputStream out = null;
PrintWriter printWriter = null;

//인코딩
response.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8");

try{
//파일 이름 가져오기
String fileName = upload.getOriginalFilename();
byte[] bytes = upload.getBytes();

//이미지 경로 생성
String real = session.getServletContext().getRealPath("/resources/tripPhoto");
String ckUploadPath = real + "/" + uid + "_" + fileName;
File folder = new File(real);

//해당 디렉토리 확인
if(!folder.exists()){
try{ folder.mkdirs(); // 폴더 생성
}catch(Exception e){
e.getStackTrace();
}
}

out = new FileOutputStream(new File(ckUploadPath));
out.write(bytes);
out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

String callback = request.getParameter("CKEditorFuncNum");
printWriter = response.getWriter();
String fileUrl = "ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

// 업로드시 메시지 출력
printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
printWriter.flush();

}catch(IOException e){
e.printStackTrace();
} finally {
try { if(out != null) { out.close(); }
if(printWriter != null) { printWriter.close(); }
} catch(IOException e) { e.printStackTrace(); }
}
return;
}

@RequestMapping(value="./imageUpload.do")
public void ckSubmit(@RequestParam(value="uid") String uid
, @RequestParam(value="fileName") String fileName
, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

//서버에 저장된 이미지 경로
String real = session.getServletContext().getRealPath("/resources/tripPhoto");
String sDirPath = real+ "/" + uid + "_" + fileName;
File imgFile = new File(sDirPath);

//사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
if(imgFile.isFile()){ byte[] buf = new byte[1024];
int readByte = 0;
int length = 0;
byte[] imgBuf = null;

FileInputStream fileInputStream = null;
ByteArrayOutputStream outputStream = null;
ServletOutputStream out = null;

try{
fileInputStream = new FileInputStream(imgFile);
outputStream = new ByteArrayOutputStream();
out = response.getOutputStream();

while((readByte = fileInputStream.read(buf)) != -1){
outputStream.write(buf, 0, readByte);
}

imgBuf = outputStream.toByteArray();
length = imgBuf.length;
out.write(imgBuf, 0, length);
out.flush();

}catch(IOException e){
e.getMessage();
}finally {
outputStream.close();
fileInputStream.close();
out.close();
}
}
}
%>

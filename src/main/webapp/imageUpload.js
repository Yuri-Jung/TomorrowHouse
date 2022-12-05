
 // * @param multiFile
 // * @param request
 // * @return
 // * @throws Exception
 //
@RequestMapping(value="./imageUpload.do", method = RequestMethod.POST)
public void imageUpload(HttpServletRequest request,
    HttpServletResponse response, MultipartHttpServletRequest multiFile
    , @RequestParam MultipartFile upload) throws Exception{
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
        String path = fileDir.getPath() + "ckImage/";// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
        String ckUploadPath = path + uid + "_" + fileName;
        File folder = new File(path);

        //해당 디렉토리 확인
        if(!folder.exists()){
            try{
                folder.mkdirs(); // 폴더 생성
            }catch(Exception e){
                e.getStackTrace();
            }
        }

        out = new FileOutputStream(new File(ckUploadPath));
        out.write(bytes);
        out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

        String callback = request.getParameter("CKEditorFuncNum");
        printWriter = response.getWriter();
        String fileUrl = "/mine/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName;  // 작성화면

        // 업로드시 메시지 출력
        printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
        printWriter.flush();

    }catch(IOException e){
        e.printStackTrace();
    }finally {
        try {
            if(out != null) { out.close(); }
            if(printWriter != null) { printWriter.close(); }
        }
        catch(Exception e)
        { e.printStackTrace(); }
    }
}
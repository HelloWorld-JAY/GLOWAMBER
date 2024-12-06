<%@page import="java.nio.file.Paths"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ='java.io.*' %>
<%@ page import ='java.util.UUID'%>
<%@ page import ='java.text.SimpleDateFormat' %>
<% 	
	// 파일정보
	String fileInfo = "";
	// 파일명 - 원본 파일명
   	String fileName = request.getHeader("file-name");
	// 파일 확장자
   	String fileName_suffix = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
	// 확장자 검증 배열변수
   	String[] suffixArr = {"jpg","png","bmp","gif"};
   	
   	
   	// 이미지파일 확장자 체크
   	int cnt = 0;
   	for (int i=0; i<suffixArr.length; i++){
   		if(fileName_suffix.equals(suffixArr[i])){
   			cnt++;
   		}
   	}
   	
   	// 이미지가 아닐 때
   	if(cnt == 0){
   		System.out.println("NotAllow_"+ fileName);
   	}
   	// 이미지 일때 
   	else{
   		// 신규 파일로 디렉토리 설정 및 업로드
   		// 파일 경로
   		String defaultPath = request.getSession().getServletContext().getRealPath("/");
   		
   		// 상세경로
   		String filePath = defaultPath + "resources" + File.separator + "itemDetail" + File.separator;
   		
   		File file = new File(filePath);
   		// filePath에 해당하는 디렉토리가 없으면, 부모 디렉토리까지 포함해 모든 디렉토리 생성
   		if (!file.exists()){
   			file.mkdirs();
   			
   		}
   		
   		// 저장될 파일 이름 생성
   		String autoFileName = UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
   		String realFileName = filePath + autoFileName;
   		
   		// 서버에 파일 쓰기 //
   		InputStream is = request.getInputStream();
   		OutputStream os = new FileOutputStream(realFileName);
   		
   		int num;
   		byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
   		while ((num= is.read(b, 0, b.length)) != -1){
   			os.write(b, 0, num);
   		}
   		if (is != null){
   			is.close();
   		}
   		os.flush();
   		os.close();
   		// 서버에 파일쓰기//
   		
   		// 정보 출력
   		fileInfo += "&bNewLine=true";
   		fileInfo += "&sFileName=" + fileName;
   		fileInfo += "&sFileURL=/glowamber/resources/itemDetail/" + autoFileName;
   		
   		out.println(fileInfo);
   		
   	}
   	
   	
	   	
   	
   	
   	
%>

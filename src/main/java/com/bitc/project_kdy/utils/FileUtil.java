package com.bitc.project_kdy.utils;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileUtil {
    public static String uploadFile(HttpServletRequest req, String saveDir) throws ServletException, IOException{
//        request 객체에 저장되어 있는 Multipart 데이터 중 name 속성이 uploadFile인 데이터를 가져옴
        Part part = req.getPart("uploadFile");

//        가져온 정보에서 지정한 header 데이터만 가져옴 (업로드된 파일명이 포함되어 있음)
        String partHeader = part.getHeader("content-disposition");
//        가져온 header 데이터를 'filename=' 을 기준으로 잘라서 배열에 저장
        String[] phArr = partHeader.split("filename=");
//        잘라낸 파일명의 빈 공백 제거 및 '\' 특수문자를 제거(파일명만 남김)
        String oriFileName = phArr[1].trim().replace("\"", "");

        if(!oriFileName.isEmpty()){
//            업로드 된 파일
            part.write(saveDir + File.separator + oriFileName);
        }
        return oriFileName;
    }

    public static String renameFile(String originalFileName, String saveDir) {
//        원본 파일명에서 확장자만 가져옴
        String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
//        현재 시간을 기준으로 문자열 형태를 생성
        String now  = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
//        현재 시간을 기준으로 새 파일명을 생성
        String newFileName = now + ext;

//        서버에 저장되어 있는 기존 파일 선택
        File oldFile = new File(saveDir + File.separator + originalFileName);
//        새 파일명으로 파일 객체 생성
        File newFile = new File(saveDir + File.separator + newFileName);
//
        oldFile.renameTo(newFile);

        return newFileName;
    }

    public static void download(String ofile, String sfile, String saveDir, HttpServletRequest req, HttpServletResponse res) {
        try{
            File file = new File(saveDir, sfile);
            InputStream inputStream = new FileInputStream(file);

            String client = req.getHeader("User-Agent");
            if(client.indexOf("WOW64") == -1){
                ofile = new String(ofile.getBytes("UTF-8"), "ISO-8859-1");
            }
            else {
                ofile = new String(ofile.getBytes("KSC5601"), "ISO-8859-1");
            }

            res.reset();
            res.setContentType("application/octet-stream");
            res.setHeader("Content-Disposition", "attachment; filename=\"" + ofile + "\"");
            res.setHeader("Content-Length", "" + file.length());

//            response 내장 객체에 새로운 출력 스트림 생성
            OutputStream outputStream = res.getOutputStream();

//            InputStream에 저장된 내용을 읽어서 저장할 byte 타입의 배열 생성, 파일의 크기만큼의 배열 생성
            byte[] b = new byte[(int)file.length()];
//            몇 개의 문자를 가져왔는지 저장
            int readBuffur = 0;
//            InputStream에 저장된 내용을 읽어서 byte 타입의 배열에 저장하고 그 크기를 readBuffer에 저장
            while ((readBuffur = inputStream.read(b)) > 0 ){
//                byte 타입의 배열에 저장된 내용을 0번 index 부터 지정한 크기만큼 읽어서 OutputStream에 쓰기
                outputStream.write(b, 0, readBuffur);
            }

//           스트림 닫기
            inputStream.close();
            outputStream.close();
        }
        catch (FileNotFoundException e){
            System.out.println("파일을 찾을 수 없습니다");
            e.printStackTrace();
        }
        catch (Exception e){
            System.out.println("예외가 발생했습니다");
            e.printStackTrace();
        }
    }

    public static void deleteFile(String saveDir, String fileName){
        File file = new File(saveDir + File.separator + fileName);

        if (file.exists()){
            file.delete();
        }
    }

}

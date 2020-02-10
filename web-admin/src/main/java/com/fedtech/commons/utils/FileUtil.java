
package com.fedtech.commons.utils;

import com.fedtech.commons.data.JsonResult;
import net.coobird.thumbnailator.Thumbnails;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * Created by Gong on 2016/5/25.
 */
public class FileUtil {
    public static Logger logger = LoggerFactory.getLogger(FileUtil.class);

    private String[] fileType = {".rar", ".zip", ".txt", ".doc", ".docx", ".xls", ".xlsx", ".png", ".jpg", "jpeg", ".gif", ".mp4", ".avi", ".3gp", ".rmvb", ".wav", ".mpg", ".vob", ".mov", ".flv", ".swf"};
    private String[] imageType = {".png", ".jpg", "jpeg", ".gif"};
    private String[] videoType = {".mp4", ".avi", ".3gp", ".rmvb", "wav", "mpg", "vob", "mov", "flv", "swf"};

    public String SAVEURL_AVATAR = "/file/img/avatar/";
    public String SAVEURL_ARTICLE_IMAGE = "/file/img/article/";
    public String SAVEURL_MODULEMES_IMAGE = "/file/img/moduleMes/";
    public String SAVEURL_GOODS_IMAGE = "/file/img/goods/";

    /**
     * @param request 文件路径
     * @param file    文件
     * @param saveUrl url路径
     * @return
     */
    public JsonResult saveFile(HttpServletRequest request, MultipartFile file, String saveUrl, boolean createThumbnail) {
        String savePath = getPhysicalPath(request);
        JsonResult res = new JsonResult();
        if (!file.isEmpty()) {
            String originalName = file.getOriginalFilename();
            String uuid = UUID.randomUUID().toString().replace("-", "");
            String fileName = uuid + originalName.substring(originalName.lastIndexOf("."));
            String dateDir = new SimpleDateFormat("yyMMdd").format(new Date());
            File fileDir = new File(savePath + saveUrl + dateDir);
            if(!checkFile(fileName)){
                res.markError("该文件类型不允许上传");
                return res;
            }
            if (!fileDir.exists()) {
                fileDir.mkdirs();
            }
            String filePath = savePath + saveUrl + dateDir + File.separator + fileName;
            String thumbnailsPath = savePath + saveUrl + dateDir + File.separator + uuid + "_200_300" + originalName.substring(originalName.lastIndexOf("."));
            try {
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(filePath)));
                stream.write(bytes);
                stream.close();
                res.markSuccess("保存成功", saveUrl + String.format("%s/%s", dateDir, fileName));
                //生成缩略图
                if (createThumbnail) {
                    try {
                        createThumbnails(filePath, 200, 300, thumbnailsPath);
                    } catch (Exception e) {
                        //生成失败，不是图片
                        e.printStackTrace();
                    }
                }
            } catch (Exception e) {
                logger.error("保存过程出现异常", e);
                res.markError("保存过程出现异常");
            }
        } else {
            res.markError("文件内容为空");
        }
        return res;
    }


    public JsonResult saveFile(HttpServletRequest request, MultipartFile file, String saveUrl, boolean createThumbnail, Integer thumbnailWidth, Integer thumbnailHeight) {
        String savePath = getPhysicalPath(request);
        JsonResult res = new JsonResult();
        if (!file.isEmpty()) {
            String originalName = file.getOriginalFilename();
            String uuid = UUID.randomUUID().toString().replace("-", "");
            String fileName = uuid + originalName.substring(originalName.lastIndexOf("."));
            String dateDir = new SimpleDateFormat("yyMMdd").format(new Date());
            File fileDir = new File(savePath + saveUrl + dateDir);
            if(!checkFile(fileName)){
                res.markError("该文件类型不允许上传");
                return res;
            }
            if (!fileDir.exists()) {
                fileDir.mkdirs();
            }
            String filePath = savePath + saveUrl + dateDir + File.separator + fileName;
            String thumbnailsPath = savePath + saveUrl + dateDir + File.separator + uuid + "_" + thumbnailWidth + "_" + thumbnailHeight + originalName.substring(originalName.lastIndexOf("."));
            try {
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(filePath)));
                stream.write(bytes);
                stream.close();
                res.markSuccess("保存成功", saveUrl + String.format("%s/%s", dateDir, fileName));
                //生成缩略图
                if (createThumbnail) {
                    try {
                        createThumbnails(filePath, thumbnailWidth, thumbnailHeight, thumbnailsPath);
                    } catch (Exception e) {
                        //生成失败，不是图片
                        e.printStackTrace();
                    }
                }
            } catch (Exception e) {
                logger.error("保存过程出现异常", e);
                res.markError("保存过程出现异常");
            }
        } else {
            res.markError("文件内容为空");
        }
        return res;
    }

    public boolean checkFile(String fileName) {
        if (fileName != null) {
            String fileAffix = fileName.substring(fileName.lastIndexOf("."));
            if (Arrays.asList(fileType).contains(fileAffix)) {
                return true;
            }

        }
        return false;
    }


    public boolean isImage(String fileName) {
        if (fileName != null) {
            String fileAffix = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
            if (Arrays.asList(imageType).contains(fileAffix)) {
                return true;
            }

        }
        return false;
    }

    public boolean isVideo(String fileName) {
        if (fileName != null) {
            String fileAffix = fileName.substring(fileName.lastIndexOf("."));
            if (Arrays.asList(videoType).contains(fileAffix)) {
                return true;
            }

        }
        return false;
    }

    private static String getPhysicalPath(HttpServletRequest request) {
        return request.getSession().getServletContext().getRealPath("");
    }

    /**
     * 下载文件时指定下载名
     *
     * @param request  HttpServletRequest
     * @param response HttpServletResponse
     * @param filePath 文件全路径
     * @param fileName 指定客户端下载时显示的文件名
     * @throws IOException
     */
    public static void downloadFile(HttpServletRequest request,
                                    HttpServletResponse response, String filePath, String fileName)
            throws IOException {
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        logger.info(fileName);
        bis = new BufferedInputStream(new FileInputStream(new File(filePath)));
        bos = new BufferedOutputStream(response.getOutputStream());

        long fileLength = new File(filePath).length();

        response.setCharacterEncoding("UTF-8");
        response.setContentType("multipart/form-data");
        /*
         * 解决各浏览器的中文乱码问题
         */
        String userAgent = request.getHeader("User-Agent");
        byte[] bytes = userAgent.contains("MSIE") ? fileName.getBytes()
                : fileName.getBytes("UTF-8"); // fileName.getBytes("UTF-8")处理safari的乱码问题
        fileName = new String(bytes, "ISO-8859-1"); // 各浏览器基本都支持ISO编码
        response.setHeader("Content-disposition",
                String.format("attachment; filename=\"%s\"", fileName));

        response.setHeader("Content-Length", String.valueOf(fileLength));
        byte[] buff = new byte[2048];
        int bytesRead;
        while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
            bos.write(buff, 0, bytesRead);
        }
        bis.close();
        bos.close();

    }

    /**
     * 下载文件时不指定下载文件名称
     *
     * @param request  HttpServletRequest
     * @param response HttpServletResponse
     * @param filePath 文件全路径
     * @throws IOException
     */
    public static void downloadFile(HttpServletRequest request,
                                    HttpServletResponse response, String filePath) throws IOException {
        File file = new File(filePath);
        downloadFile(request, response, filePath, file.getName());
    }


    /**
     * 生成缩略图
     *
     * @param imagePath      原图地址
     * @param width
     * @param height
     * @param thumbnailsPath 保存地址
     * @throws Exception
     */
    public static void createThumbnails(String imagePath, Integer width, Integer height, String thumbnailsPath) throws Exception {
        Thumbnails.of(imagePath)
                .size(width, height)
                .toFile(new File(thumbnailsPath));
    }


    //
    @SuppressWarnings("unchecked")
    public static void unzip(HttpServletRequest request, MultipartFile zipFile, String unzipFilePath, boolean includeZipFileName) throws Exception {
        String savePath = getPhysicalPath(request);
        File f = null;
        try {
            f = File.createTempFile("tmp", null);
            zipFile.transferTo(f);
            f.deleteOnExit();
        } catch (HttpException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //如果解压后的文件保存路径包含压缩文件的文件名，则追加该文件名到解压路径
        if (includeZipFileName) {
            String fileName = zipFile.getName();
            if (StringUtils.isNotEmpty(fileName)) {
                fileName = fileName.substring(0, fileName.lastIndexOf("."));
            }
            unzipFilePath = unzipFilePath + File.separator + fileName;
        }
        unzipFilePath = savePath + unzipFilePath;
        //创建解压缩文件保存的路径
        File unzipFileDir = new File(unzipFilePath);
        if (!unzipFileDir.exists() || !unzipFileDir.isDirectory()) {
            unzipFileDir.mkdirs();
        }

        //开始解压
        ZipEntry entry = null;
        String entryFilePath = null, entryDirPath = null, thumbnailsPath = null;
        File entryFile = null, entryDir = null;
        int index = 0, count = 0, bufferSize = 1024;
        byte[] buffer = new byte[bufferSize];
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        ZipFile zip = new ZipFile(f);
        Enumeration<ZipEntry> entries = (Enumeration<ZipEntry>) zip.entries();
        //循环对压缩包里的每一个文件进行解压
        while (entries.hasMoreElements()) {
            entry = entries.nextElement();
            //构建压缩包中一个文件解压后保存的文件全路径
            try {
                entryFilePath = unzipFilePath + File.separator + entry.getName();
                thumbnailsPath = unzipFilePath + File.separator + entry.getName().substring(0, entry.getName().lastIndexOf(".")) + "_" + 80 + "_" + 80 + entry.getName().substring(entry.getName().lastIndexOf("."));
            } catch (Exception e) {
                continue;
            }
            //构建解压后保存的文件夹路径
            index = entryFilePath.lastIndexOf(File.separator);
            if (index != -1) {
                entryDirPath = entryFilePath.substring(0, index);
            } else {
                entryDirPath = "";
            }
            entryDir = new File(entryDirPath);
            //如果文件夹路径不存在，则创建文件夹
            if (!entryDir.exists() || !entryDir.isDirectory()) {
                entryDir.mkdirs();
            }

            boolean flag = true;
            //创建解压文件
            entryFile = new File(entryFilePath);
            if (entryFile.exists()) {
                try {
                    //检测文件是否允许删除，如果不允许删除，将会抛出SecurityException
                    SecurityManager securityManager = new SecurityManager();
                    securityManager.checkDelete(entryFilePath);
                    //删除已存在的目标文件
                    entryFile.delete();
                } catch (Exception e) {
                    flag = false;
                }
            }

            //写入文件
            if (flag) {
                bos = new BufferedOutputStream(new FileOutputStream(entryFile));
                bis = new BufferedInputStream(zip.getInputStream(entry));
                while ((count = bis.read(buffer, 0, bufferSize)) != -1) {
                    bos.write(buffer, 0, count);
                }
                bos.flush();
                bos.close();

                try {
                    createThumbnails(entryFilePath, 80, 80, thumbnailsPath);
                } catch (Exception e) {
                    //生成失败，不是图片
                    e.printStackTrace();
                }
            }

        }
    }


    public JsonResult importZipImage(HttpServletRequest request, MultipartFile file, String path) throws IOException {
        JsonResult result = new JsonResult();
        try {
            FileUtil.unzip(request, file, path, false);
            result.markSuccess("上传成功", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


}


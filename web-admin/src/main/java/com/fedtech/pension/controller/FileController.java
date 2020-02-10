package com.fedtech.pension.controller;

import com.fedtech.commons.data.JsonResult;
import com.fedtech.commons.data.kindeditor.UploadResult;
import com.fedtech.commons.utils.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;

/**
 * 文件上传和下载controller
 *
 * @author CodingQiang
 * @date 2016/11/7
 */
@Controller
@RequestMapping(value = {"/file"})
public class FileController extends BaseController {

    /**
     * 处理kindeditor图片上传
     *
     * @param imgFile: 文件form名称
     * @param dir:     上传类型，分别为image、flash、media、file
     * @return
     */
    @RequestMapping(value = "/kindeditor/u")
    @ResponseBody
    public UploadResult uploadKindEditorFile(HttpServletRequest request, @RequestParam("imgFile") MultipartFile imgFile, @RequestParam("dir") String dir) {
        UploadResult res = new UploadResult();
        FileUtil util = new FileUtil();
        JsonResult jsonResult = util.saveFile(request, imgFile, util.SAVEURL_ARTICLE_IMAGE, false);
        if (jsonResult.isSuccess()) {
            res.markSuccess(jsonResult.getData().toString());
        } else {
            res.markError(jsonResult.getMessage());
        }
        return res;
    }


    @RequestMapping(value = "/upload")
    @ResponseBody
    public UploadResult uploadFile(HttpServletRequest request,
                                   @RequestParam("attach") MultipartFile attach,
                                   @RequestParam("path") String path,
                                   @RequestParam(value = "createThumbnail", defaultValue = "false", required = false) boolean createThumbnail,
                                   @RequestParam(value = "thumbnailWidth", defaultValue = "200", required = false) Integer thumbnailWidth,
                                   @RequestParam(value = "thumbnailHeight", defaultValue = "300", required = false) Integer thumbnailHeight) {
        UploadResult res = new UploadResult();
        FileUtil util = new FileUtil();
        JsonResult jsonResult = util.saveFile(request, attach, "/file/" + path + "/", createThumbnail, thumbnailWidth, thumbnailHeight);
        if (jsonResult.isSuccess()) {
            res.markSuccess(jsonResult.getData().toString());
        } else {
            res.markError(jsonResult.getMessage());
        }
        return res;
    }


    /**
     * 导入图片
     *
     * @param attach
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/importZipImage", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult importZipImage(@RequestParam("attach") MultipartFile attach, @RequestParam("path") String path, HttpServletRequest request) {
        JsonResult result = new JsonResult();
        FileUtil util = new FileUtil();
        try {
            result = util.importZipImage(request, attach, path);
        } catch (IOException e) {
            e.printStackTrace();
            result.markError("导入失败");
        }
        return result;
    }


    /**
     * 区别上述参数名称
     *
     * @param request
     * @param files
     * @param path
     * @param createThumbnail
     * @param thumbnailWidth
     * @param thumbnailHeight
     * @return
     */
    @RequestMapping(value = "/uploadFiles")
    @ResponseBody
    public UploadResult uploadFiles(HttpServletRequest request, @RequestParam("files") MultipartFile files, @RequestParam("path") String path,
                                    @RequestParam(value = "createThumbnail", defaultValue = "false", required = false) boolean createThumbnail,
                                    @RequestParam(value = "thumbnailWidth", defaultValue = "200", required = false) Integer thumbnailWidth,
                                    @RequestParam(value = "thumbnailHeight", defaultValue = "300", required = false) Integer thumbnailHeight) {
        UploadResult res = new UploadResult();
        FileUtil util = new FileUtil();
        JsonResult jsonResult = util.saveFile(request, files, "/file/" + path + "/", createThumbnail, thumbnailWidth, thumbnailHeight);
        if (jsonResult.isSuccess()) {
            res.markSuccess(jsonResult.getData().toString());
        } else {
            res.markError(jsonResult.getMessage());
        }
        return res;
    }


    /**
     * 文件下载(从上传路径下载)
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/download")
    public void downloadFile(HttpServletRequest request,
                             HttpServletResponse response, String filePath) {
        try {
            filePath = URLDecoder.decode(filePath, "UTF-8");
            logger.info(filePath);
        /*
         * 限制只有upload和download文件夹里的文件可以下载
         */
            String fileAbsolutePath = request.getSession().getServletContext()
                    .getRealPath("/") +
                    "/" + filePath;
            FileUtil.downloadFile(request, response, fileAbsolutePath);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}

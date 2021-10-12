package com.company.shoe_store.web.controller;

import com.company.shoe_store.aws.S3;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("/file")
public class FileController {

    //@Autowired
    private S3 s3;

    // Constructors
    // No-argument constructor
    public FileController() {
    }

    // Specialized constructor
    @Autowired
    public FileController(S3 s3) {
        this.s3 = s3;
    }

    //@RequestMapping(value = "/upload", method = RequestMethod.GET)
    @GetMapping(value = "/upload")
    public ModelAndView uploadGet(HttpServletRequest request) {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView result = new ModelAndView();
        result.setViewName("file/upload");

        return result;
    }

    //@RequestMapping(value = "/upload", method = RequestMethod.POST)
    @PostMapping(value = "/upload")
    public ModelAndView uploadPost(HttpServletRequest request, @RequestParam("file") MultipartFile file, @RequestParam("text") String text, ModelMap modelMap) throws IOException {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        System.out.println("File size = " + file.getSize());
        System.out.println("File name = " + file.getOriginalFilename());
        System.out.println("Text      = " + text);

        // Get the official temp directory from the OS
        String tmpDir = System.getProperty("java.io.tmpdir");
        System.out.println("Temp file path: " + tmpDir);

        // Create a target name that consists of the full path of the temp directory and the original uploaded file name
        //File targetFile = new File("e:\\abc\\" + file.getOriginalFilename());
        File targetFile = new File(tmpDir + File.separator + file.getOriginalFilename());

        // Commons io utility that will stream the uploaded file into the target file,
        // essentially saves it to the hard drive.
        FileUtils.copyInputStreamToFile(file.getInputStream(), targetFile);

        // Use our S3 library to write the file to S3
        s3.writeFile("wasin-first-bucket/images", file.getOriginalFilename(), targetFile);

        ModelAndView result = new ModelAndView();
        result.setViewName("file/upload");

        modelMap.addAttribute("fileSubmitted", file);
        //result.addObject("fileSubmitted", file);
        result.addObject("imageName", file.getOriginalFilename());

        return result;
    }


}

package com.ky;

import com.ky.dao.CategoryDAO;
import com.ky.media.MediaFile;
import com.ky.models.Category;

import java.util.ArrayList;

public class TestApp {
    public static void main(String[] args) {
        ArrayList<String> files= MediaFile.allFiles("C:\\xampp\\tomcat\\webapps\\blogmandu\\uploads");
        if(files.isEmpty()){
            System.out.println("no media files found");
        }
        System.out.println(files);
    }
}

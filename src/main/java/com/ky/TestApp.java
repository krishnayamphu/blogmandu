package com.ky;

import com.ky.dao.CategoryDAO;
import com.ky.models.Category;

import java.util.ArrayList;

public class TestApp {
    public static void main(String[] args) {
        ArrayList<Category> categories= CategoryDAO.getCategory();
        for(Category cat:categories){
            System.out.println(cat.getName());
        }
    }
}

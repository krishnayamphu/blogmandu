package com.ky;

import com.ky.dao.CategoryDAO;
import com.ky.dao.PostDAO;
import com.ky.media.MediaFile;
import com.ky.models.Category;
import com.ky.models.Post;
import com.ky.utility.PostExcerpt;

import java.util.ArrayList;

public class TestApp {
    public static void main(String[] args) {
        Post post=PostDAO.getPosts("ChatGPT");
        System.out.println(post.getTitle());
    }
}

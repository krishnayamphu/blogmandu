package com.ky.dao;

import com.ky.database.ConnectDB;
import com.ky.models.Category;
import com.ky.models.Post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PostDAO {
    public static ArrayList<Post> getPosts() {
        ArrayList<Post> posts = new ArrayList<>();
        try {
            Connection cn = ConnectDB.connect();
            String sql = "SELECT * FROM posts";
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("id"));
                post.setTitle(rs.getString("title"));
                post.setSlug(rs.getString("slug"));
                post.setContent(rs.getString("content"));
                post.setThumbImg(rs.getString("thumb_img"));
                post.setCategoryId(rs.getInt("category_id"));
                post.setCreatedAt(rs.getString("created_at"));
                post.setUpdatedAt(rs.getString("updated_at"));
                posts.add(post);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    public static Post getPosts(int id) {
        Post post = new Post();
        try {
            Connection cn = ConnectDB.connect();
            String sql = "SELECT * FROM posts WHERE id=?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                post.setId(rs.getInt("id"));
                post.setTitle(rs.getString("title"));
                post.setSlug(rs.getString("slug"));
                post.setContent(rs.getString("content"));
                post.setThumbImg(rs.getString("thumb_img"));
                post.setCategoryId(rs.getInt("category_id"));
                post.setCreatedAt(rs.getString("created_at"));
                post.setUpdatedAt(rs.getString("updated_at"));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return post;
    }

    public static Post getPosts(String slug) {
        Post post = new Post();
        try {
            Connection cn = ConnectDB.connect();
            String sql = "SELECT * FROM posts WHERE slug=?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, slug);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                post.setId(rs.getInt("id"));
                post.setTitle(rs.getString("title"));
                post.setSlug(rs.getString("slug"));
                post.setContent(rs.getString("content"));
                post.setThumbImg(rs.getString("thumb_img"));
                post.setCategoryId(rs.getInt("category_id"));
                post.setCreatedAt(rs.getString("created_at"));
                post.setUpdatedAt(rs.getString("updated_at"));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return post;
    }


    public static void save(Post post) {
        try {
            Connection cn = ConnectDB.connect();
            String sql = "INSERT INTO posts (title,slug,content,thumb_img,category_id) VALUES (?,?,?,?,?)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, post.getTitle());
            ps.setString(2, post.getSlug());
            ps.setString(3, post.getContent());
            ps.setString(4, post.getThumbImg());
            ps.setInt(5, post.getCategoryId());
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static void update(Post post) {
        try {
            Connection cn = ConnectDB.connect();
            String sql = "UPDATE posts SET title=?,slug=?,content=?,thumb_img=?,category_id=? WHERE  id=?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, post.getTitle());
            ps.setString(2, post.getSlug());
            ps.setString(3, post.getContent());
            ps.setString(4, post.getThumbImg());
            ps.setInt(5, post.getCategoryId());
            ps.setInt(6, post.getId());
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static void delete(int id) {
        try {
            Connection cn = ConnectDB.connect();
            String sql = "DELETE FROM posts WHERE  id=?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }


}

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

    public static Category getCategory(int id) {
        Category category = null;
        try {
            Connection cn = ConnectDB.connect();
            String sql = "SELECT * FROM category WHERE id=?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setSlug(rs.getString("slug"));
                category.setDescription(rs.getString("description"));
                category.setCreatedAt(rs.getString("created_at"));
                category.setUpdatedAt(rs.getString("updated_at"));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return category;
    }

    public static void save(Post post) {
        try {
            Connection cn = ConnectDB.connect();
            String sql = "INSERT INTO posts (title,slug,content,thumb_img,category_id) VALUES (?,?,?,?,?)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, post.getTitle());
            ps.setString(2, post.getSlug());
            ps.setString(3, post.getContent());
            ps.setString(4,post.getThumbImg());
            ps.setInt(5,post.getCategoryId());
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static void update(Category category) {
        try {
            Connection cn = ConnectDB.connect();
            String sql = "UPDATE category SET name=?,slug=?,description=? WHERE  id=?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, category.getName());
            ps.setString(2, category.getSlug());
            ps.setString(3, category.getDescription());
            ps.setInt(4, category.getId());
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

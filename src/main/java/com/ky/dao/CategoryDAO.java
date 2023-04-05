package com.ky.dao;

import com.ky.database.ConnectDB;
import com.ky.models.Category;
import com.ky.models.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CategoryDAO {
    public static ArrayList<Category> getCategory() {
        ArrayList<Category> categories = new ArrayList<>();
        try {
            Connection cn = ConnectDB.connect();
            String sql = "SELECT * FROM category";
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setSlug(rs.getString("slug"));
                category.setDescription(rs.getString("description"));
                category.setCreatedAt(rs.getString("created_at"));
                category.setUpdatedAt(rs.getString("updated_at"));
                categories.add(category);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return categories;
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

    public static void save(Category category) {
        try {
            Connection cn = ConnectDB.connect();
            String sql = "INSERT INTO category (name,slug,description) VALUES (?,?,?)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, category.getName());
            ps.setString(2, category.getSlug());
            ps.setString(3, category.getDescription());
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
            String sql = "DELETE FROM category WHERE  id=?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }


}

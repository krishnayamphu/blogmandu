package com.ky.database.tables;

import com.ky.database.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PostTable {
    public static void create() {
        try {
            Connection cn = ConnectDB.connect();
            String sql = "CREATE TABLE posts (id int primary key auto_increment,title varchar(256) not null unique ,slug varchar(256) not null unique,content text, category_id int,thumb_img varchar(256), created_at timestamp default current_timestamp,updated_at timestamp default current_timestamp,FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE SET NULL)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.executeUpdate();
            System.out.println("posts table created.");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static void drop() {
        try {
            Connection cn = ConnectDB.connect();
            String sql = "DROP TABLE posts";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.executeUpdate();
            System.out.println("posts table deleted.");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}

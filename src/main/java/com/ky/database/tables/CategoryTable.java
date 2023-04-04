package com.ky.database.tables;

import com.ky.database.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CategoryTable {
    public static void create() {
        try {
            Connection cn = ConnectDB.connect();
            String sql = "CREATE TABLE category (id int primary key auto_increment,name varchar(50) not null unique ,slug varchar(256) not null unique,description varchar(256), created_at timestamp default current_timestamp,updated_at timestamp default current_timestamp)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.executeUpdate();
            System.out.println("category table created.");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static void drop() {
        try {
            Connection cn = ConnectDB.connect();
            String sql = "DROP TABLE category";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.executeUpdate();
            System.out.println("category table deleted.");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}

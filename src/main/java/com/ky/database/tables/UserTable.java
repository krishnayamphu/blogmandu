package com.ky.database.tables;

import com.ky.database.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserTable {
    public static void create() {
        try {
            Connection cn = ConnectDB.connect();
            String sql = "CREATE TABLE users (id int primary key auto_increment,name varchar(30),username varchar(256) not null unique,email varchar(256) not null unique, contact varchar(20) not null unique, password varchar(256) not null,profile_pic varchar(256), created_at timestamp default current_timestamp,updated_at timestamp default current_timestamp)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.executeUpdate();
            System.out.println("users table created.");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static void drop() {
        try {
            Connection cn = ConnectDB.connect();
            String sql = "DROP TABLE users";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.executeUpdate();
            System.out.println("users table deleted.");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}

package com.ky.database;

import com.ky.database.tables.CategoryTable;
import com.ky.database.tables.UserTable;

public class Database {
    public static void run(){
        UserTable.create();
        CategoryTable.create();
    }

    public static void destroy(){
        UserTable.drop();
        CategoryTable.drop();
    }
}

package com.ky.database;

import com.ky.database.tables.UserTable;

public class Database {
    public static void run(){
        UserTable.create();
    }

    public static void destroy(){
        UserTable.drop();
    }
}

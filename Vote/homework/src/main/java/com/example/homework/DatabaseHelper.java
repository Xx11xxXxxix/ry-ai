package com.example.homework;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;
import java.util.List;

public class DatabaseHelper extends SQLiteOpenHelper {
    // 数据库名称
    private static final String DB_NAME = "QuestionnaireDB";
    // 数据库版本
    private static final int DB_VERSION = 2; // 更新版本号
    // 用户表
    private static final String TABLE_USER = "user";
    private static final String USER_ID = "id";
    private static final String USER_EMAIL = "email";
    private static final String USER_PASSWORD = "password";
    
    // 投票表
    private static final String TABLE_VOTE = "vote";
    private static final String VOTE_ID = "id";
    private static final String VOTE_TITLE = "title";
    private static final String VOTE_DESCRIPTION = "description";
    private static final String VOTE_CREATOR_ID = "creator_id";
    private static final String VOTE_CREATED_AT = "created_at";
    
    // 用户参与的投票表
    private static final String TABLE_PARTICIPATED_VOTES = "participated_votes";
    private static final String PARTICIPATED_ID = "id";
    private static final String PARTICIPATED_USER_ID = "user_id";
    private static final String PARTICIPATED_VOTE_ID = "vote_id";
    private static final String PARTICIPATED_AT = "participated_at";
    
    // 用户隐藏的投票表
    private static final String TABLE_HIDDEN_VOTES = "hidden_votes";
    private static final String HIDDEN_ID = "id";
    private static final String HIDDEN_USER_ID = "user_id";
    private static final String HIDDEN_VOTE_ID = "vote_id";
    private static final String HIDDEN_AT = "hidden_at";
    
    // 投票选项表
    private static final String TABLE_VOTE_OPTIONS = "vote_options";
    private static final String OPTION_ID = "id";
    private static final String OPTION_VOTE_ID = "vote_id";
    private static final String OPTION_TEXT = "option_text";
    private static final String OPTION_COUNT = "vote_count";

    public DatabaseHelper(Context context) {
        super(context, DB_NAME, null, DB_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        // 创建用户表
        String createUserTable = "CREATE TABLE " + TABLE_USER + " (" +
                USER_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
                USER_EMAIL + " TEXT UNIQUE, " +
                USER_PASSWORD + " TEXT)";
        db.execSQL(createUserTable);
        
        // 创建投票表
        String createVoteTable = "CREATE TABLE " + TABLE_VOTE + " (" +
                VOTE_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
                VOTE_TITLE + " TEXT NOT NULL, " +
                VOTE_DESCRIPTION + " TEXT, " +
                VOTE_CREATOR_ID + " INTEGER, " +
                VOTE_CREATED_AT + " DATETIME DEFAULT CURRENT_TIMESTAMP, " +
                "FOREIGN KEY (" + VOTE_CREATOR_ID + ") REFERENCES " + TABLE_USER + "(" + USER_ID + "))";
        db.execSQL(createVoteTable);
        
        // 创建用户参与的投票表
        String createParticipatedVotesTable = "CREATE TABLE " + TABLE_PARTICIPATED_VOTES + " (" +
                PARTICIPATED_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
                PARTICIPATED_USER_ID + " INTEGER, " +
                PARTICIPATED_VOTE_ID + " INTEGER, " +
                PARTICIPATED_AT + " DATETIME DEFAULT CURRENT_TIMESTAMP, " +
                "FOREIGN KEY (" + PARTICIPATED_USER_ID + ") REFERENCES " + TABLE_USER + "(" + USER_ID + "), " +
                "FOREIGN KEY (" + PARTICIPATED_VOTE_ID + ") REFERENCES " + TABLE_VOTE + "(" + VOTE_ID + "))";
        db.execSQL(createParticipatedVotesTable);
        
        // 创建用户隐藏的投票表
        String createHiddenVotesTable = "CREATE TABLE " + TABLE_HIDDEN_VOTES + " (" +
                HIDDEN_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
                HIDDEN_USER_ID + " INTEGER, " +
                HIDDEN_VOTE_ID + " INTEGER, " +
                HIDDEN_AT + " DATETIME DEFAULT CURRENT_TIMESTAMP, " +
                "FOREIGN KEY (" + HIDDEN_USER_ID + ") REFERENCES " + TABLE_USER + "(" + USER_ID + "), " +
                "FOREIGN KEY (" + HIDDEN_VOTE_ID + ") REFERENCES " + TABLE_VOTE + "(" + VOTE_ID + "))";
        db.execSQL(createHiddenVotesTable);
        
        // 创建投票选项表
        String createVoteOptionsTable = "CREATE TABLE " + TABLE_VOTE_OPTIONS + " (" +
                OPTION_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
                OPTION_VOTE_ID + " INTEGER, " +
                OPTION_TEXT + " TEXT NOT NULL, " +
                OPTION_COUNT + " INTEGER DEFAULT 0, " +
                "FOREIGN KEY (" + OPTION_VOTE_ID + ") REFERENCES " + TABLE_VOTE + "(" + VOTE_ID + "))";
        db.execSQL(createVoteOptionsTable);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // 升级数据库时删除旧表
        if (oldVersion < 2) {
            db.execSQL("DROP TABLE IF EXISTS " + TABLE_VOTE);
            db.execSQL("DROP TABLE IF EXISTS " + TABLE_USER);
            onCreate(db);
        }
    }

    // 注册用户
    public boolean registerUser(String email, String password) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(USER_EMAIL, email);
        values.put(USER_PASSWORD, password);
        // 插入数据
        long result = db.insert(TABLE_USER, null, values);
        db.close();
        // 插入成功返回true
        return result != -1;
    }

    // 检查用户登录
    public boolean checkUser(String email, String password) {
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.query(TABLE_USER, new String[]{USER_ID},
                USER_EMAIL + "=? AND " + USER_PASSWORD + "=?",
                new String[]{email, password},
                null, null, null);
        boolean exists = cursor.getCount() > 0;
        cursor.close();
        db.close();
        return exists;
    }
    
    // 创建投票
    public boolean createVote(String title, String description, int creatorId) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(VOTE_TITLE, title);
        values.put(VOTE_DESCRIPTION, description);
        values.put(VOTE_CREATOR_ID, creatorId);
        
        long result = db.insert(TABLE_VOTE, null, values);
        db.close();
        return result != -1;
    }
    
    // 获取用户的投票列表
    public List<Vote> getUserVotes(int userId) {
        List<Vote> votes = new ArrayList<>();
        SQLiteDatabase db = this.getReadableDatabase();
        
        Cursor cursor = db.query(TABLE_VOTE, 
                new String[]{VOTE_ID, VOTE_TITLE, VOTE_DESCRIPTION, VOTE_CREATED_AT},
                VOTE_CREATOR_ID + "=?",
                new String[]{String.valueOf(userId)},
                null, null, VOTE_CREATED_AT + " DESC");
                
        if (cursor.moveToFirst()) {
            do {
                Vote vote = new Vote();
                vote.setId(cursor.getInt(0));
                vote.setTitle(cursor.getString(1));
                vote.setDescription(cursor.getString(2));
                vote.setCreatedAt(cursor.getString(3));
                votes.add(vote);
            } while (cursor.moveToNext());
        }
        
        cursor.close();
        db.close();
        return votes;
    }
    
    // 获取用户参与的投票列表
    public List<Vote> getParticipatedVotes(int userId) {
        List<Vote> votes = new ArrayList<>();
        SQLiteDatabase db = this.getReadableDatabase();
        
        // 查询用户参与的投票ID
        String query = "SELECT v." + VOTE_ID + ", v." + VOTE_TITLE + ", v." + VOTE_DESCRIPTION + 
                      ", v." + VOTE_CREATED_AT + 
                      " FROM " + TABLE_VOTE + " v INNER JOIN " + TABLE_PARTICIPATED_VOTES + " p " +
                      " ON v." + VOTE_ID + " = p." + PARTICIPATED_VOTE_ID + 
                      " WHERE p." + PARTICIPATED_USER_ID + " = ?" +
                      " ORDER BY p." + PARTICIPATED_AT + " DESC";
        
        Cursor cursor = db.rawQuery(query, new String[]{String.valueOf(userId)});
        
        if (cursor.moveToFirst()) {
            do {
                Vote vote = new Vote();
                vote.setId(cursor.getInt(0));
                vote.setTitle(cursor.getString(1));
                vote.setDescription(cursor.getString(2));
                vote.setCreatedAt(cursor.getString(3));
                votes.add(vote);
            } while (cursor.moveToNext());
        }
        
        cursor.close();
        db.close();
        return votes;
    }
    
    // 添加隐藏投票功能（用于记录用户隐藏的投票）
    public boolean addHiddenVote(int userId, int voteId) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(HIDDEN_USER_ID, userId);
        values.put(HIDDEN_VOTE_ID, voteId);
        values.put(HIDDEN_AT, System.currentTimeMillis());
        
        long result = db.insert(TABLE_HIDDEN_VOTES, null, values);
        db.close();
        return result != -1;
    }
    
    // 获取投票详情
    public Vote getVoteById(int voteId) {
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.query(TABLE_VOTE,
                new String[]{VOTE_ID, VOTE_TITLE, VOTE_DESCRIPTION, VOTE_CREATED_AT},
                VOTE_ID + "=?",
                new String[]{String.valueOf(voteId)},
                null, null, null);
        
        Vote vote = null;
        if (cursor.moveToFirst()) {
            vote = new Vote();
            vote.setId(cursor.getInt(0));
            vote.setTitle(cursor.getString(1));
            vote.setDescription(cursor.getString(2));
            vote.setCreatedAt(cursor.getString(3));
        }
        
        cursor.close();
        db.close();
        return vote;
    }
    
    // 添加投票选项
    public boolean addVoteOption(int voteId, String optionText) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(OPTION_VOTE_ID, voteId);
        values.put(OPTION_TEXT, optionText);
        values.put(OPTION_COUNT, 0);
        
        long result = db.insert(TABLE_VOTE_OPTIONS, null, values);
        db.close();
        return result != -1;
    }
    
    // 获取投票的所有选项
    public List<VoteOption> getVoteOptions(int voteId) {
        List<VoteOption> options = new ArrayList<>();
        SQLiteDatabase db = this.getReadableDatabase();
        
        Cursor cursor = db.query(TABLE_VOTE_OPTIONS,
                new String[]{OPTION_ID, OPTION_TEXT, OPTION_COUNT},
                OPTION_VOTE_ID + "=?",
                new String[]{String.valueOf(voteId)},
                null, null, null);
        
        if (cursor.moveToFirst()) {
            do {
                VoteOption option = new VoteOption();
                option.setId(cursor.getInt(0));
                option.setOptionText(cursor.getString(1));
                option.setVoteCount(cursor.getInt(2));
                options.add(option);
            } while (cursor.moveToNext());
        }
        
        cursor.close();
        db.close();
        return options;
    }
    
    // 增加选项的投票计数
    public boolean incrementOptionCount(int optionId) {
        SQLiteDatabase db = this.getWritableDatabase();
        
        // 先获取当前计数
        Cursor cursor = db.query(TABLE_VOTE_OPTIONS,
                new String[]{OPTION_COUNT},
                OPTION_ID + "=?",
                new String[]{String.valueOf(optionId)},
                null, null, null);
        
        int currentCount = 0;
        if (cursor.moveToFirst()) {
            currentCount = cursor.getInt(0);
        }
        cursor.close();
        
        // 更新计数
        ContentValues values = new ContentValues();
        values.put(OPTION_COUNT, currentCount + 1);
        
        int result = db.update(TABLE_VOTE_OPTIONS, values, OPTION_ID + "=?", 
                new String[]{String.valueOf(optionId)});
        db.close();
        
        return result > 0;
    }
    
    // 记录用户参与投票
    public boolean addParticipatedVote(int userId, int voteId) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(PARTICIPATED_USER_ID, userId);
        values.put(PARTICIPATED_VOTE_ID, voteId);
        values.put(PARTICIPATED_AT, System.currentTimeMillis());
        
        long result = db.insert(TABLE_PARTICIPATED_VOTES, null, values);
        db.close();
        return result != -1;
    }
    
    // 检查用户是否已经参与过某个投票
    public boolean hasUserParticipated(int userId, int voteId) {
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.query(TABLE_PARTICIPATED_VOTES,
                new String[]{PARTICIPATED_ID},
                PARTICIPATED_USER_ID + "=? AND " + PARTICIPATED_VOTE_ID + "=?",
                new String[]{String.valueOf(userId), String.valueOf(voteId)},
                null, null, null);
        
        boolean participated = cursor.getCount() > 0;
        cursor.close();
        db.close();
        return participated;
    }
    
    // 内部类表示投票
    public static class Vote {
        private int id;
        private String title;
        private String description;
        private String createdAt;
        
        public int getId() {
            return id;
        }
        
        public void setId(int id) {
            this.id = id;
        }
        
        public String getTitle() {
            return title;
        }
        
        public void setTitle(String title) {
            this.title = title;
        }
        
        public String getDescription() {
            return description;
        }
        
        public void setDescription(String description) {
            this.description = description;
        }
        
        public String getCreatedAt() {
            return createdAt;
        }
        
        public void setCreatedAt(String createdAt) {
            this.createdAt = createdAt;
        }
    }
    
    // 内部类表示投票选项
    public static class VoteOption {
        private int id;
        private String optionText;
        private int voteCount;
        
        public int getId() {
            return id;
        }
        
        public void setId(int id) {
            this.id = id;
        }
        
        public String getOptionText() {
            return optionText;
        }
        
        public void setOptionText(String optionText) {
            this.optionText = optionText;
        }
        
        public int getVoteCount() {
            return voteCount;
        }
        
        public void setVoteCount(int voteCount) {
            this.voteCount = voteCount;
        }
    }
}
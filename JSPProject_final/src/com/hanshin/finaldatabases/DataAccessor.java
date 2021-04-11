package com.hanshin.finaldatabases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DataAccessor {

	private final String URL = "jdbc:mysql://127.0.0.1:3306/databasetest?serverTimezone=UTC";
	private final String ID = "root";
	private final String PassWord = "123456";
	
	public DataAccessor() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public Map<String, String> executeQueryOne(String sql, String... args) {
		Map<String, String> result = null;
		
		try (
			Connection conn = DriverManager.getConnection(URL, ID, PassWord);
			PreparedStatement pstmt = conn.prepareStatement(sql);
		) {
			for (int i = 1; i <= args.length; i++) {
				pstmt.setString(i, args[i - 1]);
			}
			try (ResultSet rs = pstmt.executeQuery()) {
				ResultSetMetaData rsmd = rs.getMetaData();
				if (rs.next()) {
					result = new HashMap<String, String>();
					for (int i = 1; i <= rsmd.getColumnCount(); i++) {
						result.put(rsmd.getColumnName(i).toLowerCase(), rs.getString(i));
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<Map<String, String>> executeQueryList(String sql, String... args) {
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		
		try (
			Connection conn = DriverManager.getConnection(URL, ID, PassWord);
			PreparedStatement pstmt = conn.prepareStatement(sql);
		) {
			for (int i = 1; i <= args.length; i++) {
				pstmt.setString(i, args[i - 1]);
			}
			try (ResultSet rs = pstmt.executeQuery()) {
				ResultSetMetaData rsmd = rs.getMetaData();
				while (rs.next()) {
					Map<String, String> map = new HashMap<String, String>();
					for (int i = 1; i <= rsmd.getColumnCount(); i++) {
						map.put(rsmd.getColumnName(i).toLowerCase(), rs.getString(i));
					}
					result.add(map);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int executeUpdate(String sql, String... args) {
		int affectedRows = 0;
		
		try (
			Connection conn = DriverManager.getConnection(URL, ID, PassWord);
			PreparedStatement pstmt = conn.prepareStatement(sql);
		) {
			for (int i = 1; i <= args.length; i++) {
				pstmt.setString(i, args[i - 1]);
			}
			affectedRows = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return affectedRows;
	}
	
}



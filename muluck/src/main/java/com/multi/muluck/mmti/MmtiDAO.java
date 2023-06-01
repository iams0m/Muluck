package com.multi.muluck.mmti;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

@Repository
public class MmtiDAO {
	private final JdbcTemplate jdbcTemplate;

	@Value("${db.url}")
	private String dbUrl;

	@Value("${db.username}")
	private String dbUsername;

	@Value("${db.password}")
	private String dbPassword;

	@Autowired
	public MmtiDAO(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@PostConstruct
	public void init() {
		loadDatabaseProperties();
	}

	private void loadDatabaseProperties() {
		try (InputStream inputStream = getClass().getClassLoader().getResourceAsStream("db.properties")) {
			Properties properties = new Properties();
			properties.load(inputStream);
			dbUrl = properties.getProperty("db.url");
			dbUsername = properties.getProperty("db.username");
			dbPassword = properties.getProperty("db.password");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public MmtiVO getQuestionById(int question_id) throws SQLException {
		String query = "SELECT * FROM mmti_questions WHERE question_id = ?";
		try (Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
				PreparedStatement pstmt = conn.prepareStatement(query)) {
			pstmt.setInt(1, question_id);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					String question_type = rs.getString("question_type");
					String question_title = rs.getString("question_title");
					String option_a = rs.getString("option_a");
					String option_b = rs.getString("option_b");
					return new MmtiVO(question_id, question_type, question_title, option_a, option_b);
				}
			}
		}
		return null;
	}
}

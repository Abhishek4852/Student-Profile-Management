package dao;
import java.sql.*;
import model.User;
public class UserDao {
	 private Connection conn;

	    // Constructor to receive DB connection
	    public UserDao(Connection conn) {
	        this.conn = conn;
	    }

	    // Register user
	    public boolean registerUser(User user) {
	        try {
	            String query = "INSERT INTO users(name, email, password) VALUES (?, ?, ?)";
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setString(1, user.getName());
	            ps.setString(2, user.getEmail());
	            ps.setString(3, user.getPassword());

	            int result = ps.executeUpdate();
	            return result == 1;

	        } catch (SQLIntegrityConstraintViolationException e) {
	            // Email already exists
	            return false;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	    // Login - check credentials
	    public boolean authenticateUser(String email, String password) {
	        try {
	            String query = "SELECT * FROM users WHERE email = ? AND password = ?";
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setString(1, email);
	            ps.setString(2, password);

	            ResultSet rs = ps.executeQuery();
	            return rs.next();

	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
}

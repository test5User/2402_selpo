package by.itclass.model.dao;

import by.itclass.model.db.ConnectionManager;
import by.itclass.model.entities.User;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static by.itclass.constants.Constants.*;

public class UserDao {
    public static final String SELECT_USER = "SELECT * FROM user WHERE login = ? AND password = ?";
    public static final String INSERT_USER = "INSERT INTO user(name, login, email, password) VALUES (?, ?, ?, ?)";
    public static final String CHECK_USER = "SELECT id FROM user WHERE login = ?";
    public static final String ALL_USERS = "SELECT * FROM user";

    private static UserDao dao;

    private UserDao() {
        ConnectionManager.init();
    }

    public static UserDao getInstance() {
        if (dao == null) {
            dao = new UserDao();
        }
        return dao;
    }

    public User selectUser(String login, String password) {
        try (var cn = ConnectionManager.getConnection();
             var ps = cn.prepareStatement(SELECT_USER)){
            ps.setString(1, login);
            ps.setString(2, password);
            var rs = ps.executeQuery();
            if (rs.next()) {
                var id = rs.getInt(ID_PARAM);
                var name = rs.getString(NAME_PARAM);
                var email = rs.getString(EMAIL_PARAM);
                return new User(id, name, login, email, password.toCharArray());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean insertUser(User user) {
        try (var cn = ConnectionManager.getConnection();
             var psInsert = cn.prepareStatement(INSERT_USER);
             var psCheck = cn.prepareStatement(CHECK_USER)){
            psCheck.setString(1, user.getLogin());
            if (isAccessible(psCheck)) {
                psInsert.setString(1, user.getName());
                psInsert.setString(2, user.getLogin());
                psInsert.setString(3, user.getEmail());
                psInsert.setString(4, String.valueOf(user.getPassword()));
                return psInsert.executeUpdate() == 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private boolean isAccessible(PreparedStatement ps) throws SQLException {
        return !ps.executeQuery().next();
    }

    public int selectIdByLogin(String login) {
        try (var cn = ConnectionManager.getConnection();
             var ps = cn.prepareStatement(CHECK_USER)){
            ps.setString(1, login);
            var rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(ID_PARAM);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<User> selectAllUsers() {
        var users = new ArrayList<User>();
        try (var cn = ConnectionManager.getConnection();
             var st = cn.createStatement()){
            var rs = st.executeQuery(ALL_USERS);
            while (rs.next()) {
                var name = rs.getString(NAME_PARAM);
                var login = rs.getString(LOGIN_PARAM);
                users.add(new User(name, login));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
}

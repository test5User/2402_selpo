package by.itclass.model.dao;

import by.itclass.model.db.ConnectionManager;
import by.itclass.model.entities.User;
import jakarta.servlet.http.HttpSession;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import static by.itclass.constants.Constants.*;

public class OrderDao {
    public static final String INSERT_ORDER = "INSERT INTO orders (id, date, userId, address) VALUES (?, ?, ?, ?)";
    public static final String INSERT_ORDER_ITEM = "INSERT INTO orderItem (orderId, itemType, itemId, itemPrice, quantity) VALUES (?, ?, ?, ?, ?)";
    private static OrderDao dao;

    private OrderDao() {
        ConnectionManager.init();
    }

    public static OrderDao getInstance() {
        if (dao == null) {
            dao = new OrderDao();
        }
        return dao;
    }

    public boolean saveOrder(HttpSession session, String address) {
        var user = (User) session.getAttribute(USER_ATTR);
        var now = LocalDateTime.now();
        var date = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        var time = now.format(DateTimeFormatter.ofPattern("HH-mm"));
        var orderId = String.join("-", user.getName(), date, time);
        return saveOrderToDb(orderId, date, user.getId(), address, session);
    }
}

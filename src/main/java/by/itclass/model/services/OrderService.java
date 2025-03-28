package by.itclass.model.services;

import by.itclass.model.dao.OrderDao;
import by.itclass.model.entities.Order;
import by.itclass.model.entities.Receipt;
import jakarta.servlet.http.HttpSession;

import java.util.List;

public class OrderService {
    private static OrderService service;
    private OrderDao dao;

    private OrderService() {
        dao = OrderDao.getInstance();
    }

    public static OrderService getInstance() {
        if (service == null) {
            service = new OrderService();
        }
        return service;
    }

    public boolean saveOrder(HttpSession session, String address) {
        return dao.saveOrder(session, address);
    }

    public List<Order> getOrders(int userId) {
        return dao.selectOrders(userId);
    }

    public Receipt buildReceipt(String orderId) {
        return dao.buildReceipt(orderId);
    }
}

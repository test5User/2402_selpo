package by.itclass.model.services;

import by.itclass.model.entities.OrderItem;
import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

import static by.itclass.constants.Constants.ORDER_ITEMS_ATTR;

public class CartService {
    private static CartService service;

    public static CartService getInstance() {
        if (service == null) {
            service = new CartService();
        }
        return service;
    }

    public List<OrderItem> processCart(HttpSession session, String cartAction,
                                       OrderItem orderItem) {
        var orderItems = session.getAttribute(ORDER_ITEMS_ATTR);
        var items = orderItems != null
                ? (List<OrderItem>) orderItems
                : new ArrayList<OrderItem>();
        switch (cartAction) {
            case "add" -> items.add(orderItem);
            case "remove" -> items.remove(orderItem);
        }
        return items;
    }
}

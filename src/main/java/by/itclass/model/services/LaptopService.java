package by.itclass.model.services;

import by.itclass.model.dao.LaptopDao;
import by.itclass.model.entities.Laptop;
import org.apache.commons.lang3.ArrayUtils;

import java.util.List;
import java.util.Map;

import static by.itclass.constants.Constants.*;

public class LaptopService {
    private static LaptopService service;
    private LaptopDao dao;

    private LaptopService() {
        dao = LaptopDao.getInstance();
    }

    public static LaptopService getInstance() {
        if (service == null) {
            service = new LaptopService();
        }
        return service;
    }

    public List<Laptop> getLaptops(Map<String, String[]> params) {
        var laptops = dao.selectAllLaptops();
        if (params.isEmpty()) {
            return laptops;
        }
        var vendors = params.get(VENDOR_PARAM);
        var cpus = params.get(CPU_PARAM);
        var memories = params.get(MEMORY_SIZE_PARAM);
        var from = params.get(PRICE_FROM_PARAM)[0];
        var to = params.get(PRICE_TO_PARAM)[0];
        return laptops.stream()
                .filter(it -> vendors == null || ArrayUtils.contains(vendors, it.getVendor()))
                .filter(it -> cpus == null || ArrayUtils.contains(cpus, it.getCpu()))
                .filter(it -> memories == null || ArrayUtils.contains(memories, String.valueOf(it.getMemorySize())))
                .filter(it -> from.isEmpty() || it.getPrice() > Double.parseDouble(from))
                .filter(it -> to.isEmpty() || it.getPrice() < Double.parseDouble(to))
                .toList();
    }
}

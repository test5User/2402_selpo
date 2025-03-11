package by.itclass.model.services;

import by.itclass.model.dao.TvDao;
import by.itclass.model.entities.Tv;
import org.apache.commons.lang3.ArrayUtils;

import java.util.List;
import java.util.Map;

import static by.itclass.constants.Constants.*;

public class TvService {
    private static TvService service;
    private TvDao dao;

    private TvService() {
        dao = TvDao.getInstance();
    }

    public static TvService getInstance() {
        if (service == null) {
            service = new TvService();
        }
        return service;
    }

    public List<Tv> getTvs(Map<String, String[]> params) {
        var tvs = dao.selectAllTv();
        if (params.isEmpty()) {
            return tvs;
        }
        var vendors = params.get(VENDOR_PARAM);
        var screens = params.get(SCREEN_SIZE_PARAM);
        var from = params.get(PRICE_FROM_PARAM)[0];
        var to = params.get(PRICE_TO_PARAM)[0];
        return tvs.stream()
                .filter(tv -> vendors == null || ArrayUtils.contains(vendors, tv.getVendor()))
                .filter(tv -> screens == null || ArrayUtils.contains(screens, String.valueOf(tv.getScreenSize())))
                .filter(tv -> from.isEmpty() || tv.getPrice() > Double.parseDouble(from))
                .filter(tv -> to.isEmpty() || tv.getPrice() < Double.parseDouble(to))
                .toList();
    }
}

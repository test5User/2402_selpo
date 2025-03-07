package by.itclass.model.dao;

import by.itclass.model.db.ConnectionManager;
import by.itclass.model.entities.Tv;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static by.itclass.constants.Constants.*;

public class TvDao {
    public static final String SELECT_ALL_TV = "SELECT * FROM tv";
    private static TvDao dao;

    private TvDao() {
        ConnectionManager.init();
    }

    public static TvDao getInstance() {
        if (dao == null) {
           dao = new TvDao();
        }
        return dao;
    }

    public List<Tv> selectAllTv() {
        var tvs = new ArrayList<Tv>();
        try (var cn = ConnectionManager.getConnection();
             var ps = cn.prepareStatement(SELECT_ALL_TV)){
            var rs = ps.executeQuery();
            while (rs.next()) {
                var id = rs.getInt(ID_PARAM);
                var vendor = rs.getString(VENDOR_PARAM);
                var model = rs.getString(MODEL_PARAM);
                var screenSize = rs.getInt(SCREEN_SIZE_PARAM);
                var price = rs.getDouble(PRICE_PARAM);
                tvs.add(new Tv(id, vendor, model, screenSize, price));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tvs;
    }
}

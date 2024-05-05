package orishop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import orishop.models.CategoryModels;

public class CategoryDAOImp implements ICategoryDAO{
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	@Override
	public List<CategoryModels> findAllCategory() {
		List<CategoryModels> listCate = new ArrayList<CategoryModels>();
		String query = "select * from CATEGORY";

		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				CategoryModels cate = new CategoryModels();
				cate.setCategoryId(rs.getInt(1));
				cate.setCategoryName(rs.getString(2));
				cate.setImageURL(rs.getString(3));
				listCate.add(cate);
			}
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCate;
	}

	@Override
	public CategoryModels findOne(int cateID) {
		CategoryModels cate = new CategoryModels();
		String query = "select * from CATEGORY where categoryId = ?";

		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setInt(1, cateID);
			rs = ps.executeQuery();

			while (rs.next()) {
				cate.setCategoryId(rs.getInt(1));
				cate.setCategoryName(rs.getString(2));
				cate.setImageURL(rs.getString(3));
			}
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return cate;
	}

}

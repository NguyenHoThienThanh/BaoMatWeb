package orishop.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import orishop.models.ProductModels;
import orishop.models.RatingModels;
import orishop.services.CustomerServiceImp;
import orishop.services.ICustomerService;
import orishop.services.IProductService;
import orishop.services.ProductServiceImp;

public class RatingDAOImpl implements IRatingDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	ICustomerService customerService = new CustomerServiceImp();
	IProductService productService = new ProductServiceImp();

	@Override
	public List<RatingModels> findAll() {
		List<RatingModels> listRating = new ArrayList<RatingModels>();

		try {

			String query = "select * from RATING";
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				RatingModels rating = new RatingModels();
				rating.setRatingId(rs.getInt(1));
				rating.setProductId(rs.getInt(2));
				rating.setCustomerId(rs.getInt(3));
				rating.setRating(rs.getInt(4));
				rating.setReview(rs.getString(5));
				rating.setReviewDate(rs.getDate(6));
				rating.setCustomer(customerService.findOne(rating.getCustomerId()));
				rating.setProduct(productService.findOne(rating.getProductId()));
				listRating.add(rating);
			}

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listRating;
	}

	@Override
	public List<RatingModels> findByProduct(int id) {
		List<RatingModels> listRating = new ArrayList<RatingModels>();

		try {

			String query = "select * from RATING where productId = ?";
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				RatingModels rating = new RatingModels();
				rating.setRatingId(rs.getInt(1));
				rating.setProductId(rs.getInt(2));
				rating.setCustomerId(rs.getInt(3));
				rating.setRating(rs.getInt(4));
				rating.setReview(rs.getString(5));
				rating.setReviewDate(rs.getDate(6));
				rating.setCustomer(customerService.findOne(rating.getCustomerId()));
				rating.setProduct(productService.findOne(rating.getProductId()));
				listRating.add(rating);
			}

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listRating;
	}

	@Override
	public List<RatingModels> findAllByUser(int id) {
		List<RatingModels> listRating = new ArrayList<RatingModels>();
		String query = "select * from RATING where customerId=?";
		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				RatingModels rating = new RatingModels();
				rating.setRatingId(rs.getInt(1));
				rating.setProductId(rs.getInt(2));
				rating.setCustomerId(rs.getInt(3));
				rating.setRating(rs.getInt(4));
				rating.setReview(rs.getString(5));
				rating.setReviewDate(rs.getDate(6));
				rating.setCustomer(customerService.findOne(rating.getCustomerId()));
				rating.setProduct(productService.findOne(rating.getProductId()));
				listRating.add(rating);
			}

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listRating;
	}

	@Override
	public RatingModels findOne(int cusId, int proId) {
		RatingModels rating = new RatingModels();
		String query = "select * from RATING where customerId=? and productId=?";
		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setInt(1, cusId);
			ps.setInt(2, proId);
			rs = ps.executeQuery();
			if (rs.next()) {
				rating.setRatingId(rs.getInt(1));
				rating.setProductId(rs.getInt(2));
				rating.setCustomerId(rs.getInt(3));
				rating.setRating(rs.getInt(4));
				rating.setReview(rs.getString(5));
				rating.setReviewDate(rs.getDate(6));
				rating.setCustomer(customerService.findOne(rating.getCustomerId()));
				rating.setProduct(productService.findOne(rating.getProductId()));
			} else {
				return null;
			}
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return rating;
	}

	@Override
	public boolean insert(RatingModels model) {
		String sql = "INSERT INTO RATING (productId, customerId, rating, review, reviewDate) VALUES (?, ?, ?, ?, ?)";
		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, model.getProductId());
			ps.setInt(2, model.getCustomerId());
			ps.setInt(3, model.getRating());
			ps.setString(4, model.getReview());
			LocalDate currentDate = LocalDate.now();
			Date sqlDate = Date.valueOf(currentDate);
			ps.setDate(5, sqlDate);
			ps.executeUpdate();
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean update(RatingModels model) {
		String sql = "UPDATE RATING SET rating = ?, review = ?, reviewDate = ? WHERE ratingId = ?";
		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, model.getRating());
			ps.setString(2, model.getReview());
			LocalDate currentDate = LocalDate.now();
			Date sqlDate = Date.valueOf(currentDate);
			ps.setDate(3, sqlDate);
			ps.setInt(4, model.getRatingId());
			ps.executeUpdate();
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean delete(int ratingId) {
		String sql = "DELETE FROM RATING WHERE ratingId = ?";
		try {
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ratingId);
			ps.executeUpdate();
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
		return true;
	}

}

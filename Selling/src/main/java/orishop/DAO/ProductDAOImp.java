package orishop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import orishop.models.*;


public class ProductDAOImp implements IProductDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	@Override
	public List<ProductModels> findAllProduct() {
		List<ProductModels> listProduct = new ArrayList<ProductModels>();

		try {

			String query = "select * from PRODUCT";
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModels product = new ProductModels();
				product.setProductId(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setDescription(rs.getString(3));
				product.setStock(rs.getInt(4));
				product.setAmount(rs.getInt(5));
				product.setPrice(rs.getFloat(6));
				product.setCategoryId(rs.getInt(7));
				product.setImageURL(rs.getString(8));
				listProduct.add(product);
			}
			
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listProduct;
	}
	
	@Override
	public List<ProductModels> findByCategory(int cid) {
		List<ProductModels> listProduct = new ArrayList<ProductModels>();

		try {

			String query = "select * from PRODUCT where categoryID = ?";
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setInt(1, cid);
			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModels product = new ProductModels();
				product.setProductId(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setDescription(rs.getString(3));
				product.setStock(rs.getInt(4));
				product.setAmount(rs.getInt(5));
				product.setPrice(rs.getFloat(6));
				product.setCategoryId(rs.getInt(7));
				product.setImageURL(rs.getString(8));
				listProduct.add(product);
			}
			
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listProduct;
	}
	
	@Override
	public List<ProductModels> findProduct(String productName) {
		List<ProductModels> listProduct = new ArrayList<ProductModels>();

		try {

			String query = "select * from PRODUCT where ProductName like N'%" + productName + "%'";
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModels product = new ProductModels();
				product.setProductId(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setDescription(rs.getString(3));
				product.setStock(rs.getInt(4));
				product.setAmount(rs.getInt(5));
				product.setPrice(rs.getFloat(6));
				product.setCategoryId(rs.getInt(7));
				product.setImageURL(rs.getString(8));
				listProduct.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listProduct;
	}

	@Override
	public List<ProductModels> filterProductDescByPrice() {
		List<ProductModels> listProduct = new ArrayList<ProductModels>();

		try {

			String query = "select * from PRODUCT order by Price desc";
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModels product = new ProductModels();
				product.setProductId(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setDescription(rs.getString(3));
				product.setStock(rs.getInt(4));
				product.setAmount(rs.getInt(5));
				product.setPrice(rs.getFloat(6));
				product.setCategoryId(rs.getInt(7));
				product.setImageURL(rs.getString(8));
				listProduct.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listProduct;
	}

	@Override
	public List<ProductModels> filterProductAscByPrice() {
		List<ProductModels> listProduct = new ArrayList<ProductModels>();

		try {

			String query = "select * from PRODUCT order by Price asc";
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModels product = new ProductModels();
				product.setProductId(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setDescription(rs.getString(3));
				product.setStock(rs.getInt(4));
				product.setAmount(rs.getInt(5));
				product.setPrice(rs.getFloat(6));
				product.setCategoryId(rs.getInt(7));
				product.setImageURL(rs.getString(8));
				listProduct.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listProduct;
	}

	@Override
	public List<ProductModels> findTopProduct(int amount) {
		List<ProductModels> listProduct = new ArrayList<ProductModels>();

		try {

			String query = "select top " + amount +  " * from PRODUCT order by productId desc";
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModels product = new ProductModels();
				product.setProductId(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setDescription(rs.getString(3));
				product.setStock(rs.getInt(4));
				product.setAmount(rs.getInt(5));
				product.setPrice(rs.getFloat(6));
				product.setCategoryId(rs.getInt(7));
				product.setImageURL(rs.getString(8));
				listProduct.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listProduct;
	}
	
	@Override
	public List<ProductModels> findTopSaleProduct(int amount) {
		List<ProductModels> listProduct = new ArrayList<ProductModels>();

		try {

			String query = "select top " + amount + " * from PRODUCT order by price";
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModels product = new ProductModels();
				product.setProductId(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setDescription(rs.getString(3));
				product.setStock(rs.getInt(4));
				product.setAmount(rs.getInt(5));
				product.setPrice(rs.getFloat(6));
				product.setCategoryId(rs.getInt(7));
				product.setImageURL(rs.getString(8));
				listProduct.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return listProduct;
	}
	
	@Override
	public void insertProduct(ProductModels product) {
		String query = "insert into PRODUCT (productName, description, stock, "
				+ "amount, price, categoryId, imageURL) values (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, product.getProductName());
			ps.setString(2, product.getDescription());
			ps.setInt(3, product.getStock());
			ps.setInt(4, product.getAmount());
			ps.setFloat(5, product.getPrice());
			ps.setInt(6, product.getCategory().getCategoryId());
			ps.setString(7, product.getImageURL());
			ps.executeUpdate();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public ProductModels findOne(int productId) {
		
		ProductModels product = new ProductModels();
		try {

			String query = "select * from PRODUCT where productId = ?";
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setInt(1, productId);
			rs = ps.executeQuery();

			while (rs.next()) {
				product.setProductId(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setDescription(rs.getString(3));
				product.setStock(rs.getInt(4));
				product.setAmount(rs.getInt(5));
				product.setPrice(rs.getFloat(6));
				product.setCategoryId(rs.getInt(7));
				product.setImageURL(rs.getString(8));
			}
			
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return product;
	}

	@Override
	public ProductModels findLast() {
		ProductModels product = new ProductModels();
		try {

			String query = "select top 1 * from PRODUCT order by productId desc";
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				product.setProductId(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setDescription(rs.getString(3));
				product.setStock(rs.getInt(4));
				product.setAmount(rs.getInt(5));
				product.setPrice(rs.getFloat(6));
				product.setCategoryId(rs.getInt(7));
				product.setImageURL(rs.getString(8));
			}
			
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return product;
	}
	
	@Override
	public void updateProduct(ProductModels product) {
		String query = "update PRODUCT set productName = ?, description = ?, stock = ?, "
				+ "amount = ?, price = ?, categoryId = ?, imageURL = ? where productId = ?";
		
		try {	
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setString(1, product.getProductName());
			ps.setString(2, product.getDescription());
			ps.setInt(3, product.getStock());
			ps.setInt(4, product.getAmount());
			ps.setFloat(5, product.getPrice());
			ps.setInt(6, product.getCategory().getCategoryId());
			ps.setString(7, product.getImageURL());
			ps.setInt(8, product.getProductId());
			ps.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void deleteProduct(ProductModels product) {
		String query = "delete PRODUCT where productId = ?";
		
		try {
			
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setInt(1, product.getProductId());
			ps.executeUpdate();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public int countReview(int productId) {
		String query = "select count(*) from RATING where productId = ?";
		try {
			
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setInt(1, productId);
			rs = ps.executeQuery();
			while (rs.next()) {
				int count = rs.getInt(1);
				return count;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public float getRatingScore(int productId) {
		String query = "select AVG(rating) from RATING where productId = ?";
		try {
			
			conn = DBConnectionSQLServer.getConnectionW();
			ps = conn.prepareStatement(query);
			ps.setInt(1, productId);
			rs = ps.executeQuery();
			while (rs.next()) {
				float count = rs.getInt(1);
				return count;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	
}

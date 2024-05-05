package orishop.services;

import java.util.List;

import orishop.DAO.IRatingDAO;
import orishop.DAO.RatingDAOImpl;
import orishop.models.RatingModels;

public class RatingServiceImpl implements IRatingService{

	IRatingDAO ratingDAO = new RatingDAOImpl();
	
	@Override
	public List<RatingModels> findAll() {
		return ratingDAO.findAll();
	}

	@Override
	public List<RatingModels> findByProduct(int id) {
		return ratingDAO.findByProduct(id);
	}

	@Override
	public List<RatingModels> findAllByUser(int id) {
		// TODO Auto-generated method stub
		return ratingDAO.findAllByUser(id);
	}

	@Override
	public int averageRating() {
		List<RatingModels> listRating = ratingDAO.findAll();
		if (listRating.size()<=0) {
			return 5;
		}
		int total = 0;
		for(RatingModels rating: listRating) {
			total += rating.getRating();
		}
		return total/listRating.size();
	}

	@Override
	public int averageRating(int productId) {
		List<RatingModels> listRating = ratingDAO.findByProduct(productId);
		if (listRating.size()<=0) {
			return 5;
		}
		int total = 0;
		for(RatingModels rating: listRating) {
			total += rating.getRating();
		}
		return total/listRating.size();
	}
	
	public static void main(String[] args) {
		IRatingService rate = new RatingServiceImpl();
		float a = rate.averageRating();
		System.out.println(a);
		System.out.println(rate.findAll());
		
	}

	@Override
	public RatingModels findOne(int cusId, int proId) {
		return ratingDAO.findOne(cusId, proId);
	}

	@Override
	public boolean insert(RatingModels model) {
		// TODO Auto-generated method stub
		if (model.getRating()>=1 & model.getRating() <=5 & !model.getReview().isEmpty()) {
			return ratingDAO.insert(model);
		} 
		return false;
		
	}

	@Override
	public boolean update(RatingModels model) {
		if (!model.getReview().isEmpty()) {
			return ratingDAO.update(model);
		} 
		return false;
	}

	@Override
	public boolean delete(int ratingId) {
		return ratingDAO.delete(ratingId);
	}
}

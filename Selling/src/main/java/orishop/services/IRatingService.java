package orishop.services;

import java.util.List;

import orishop.models.RatingModels;

public interface IRatingService {
	List<RatingModels> findAll();
	List<RatingModels> findByProduct(int id);
	List<RatingModels> findAllByUser(int id);
	RatingModels findOne(int cusId, int proId);
	int averageRating();
	int averageRating(int productId);
	boolean insert(RatingModels model);
	boolean update(RatingModels model);
	boolean delete(int ratingId);
}

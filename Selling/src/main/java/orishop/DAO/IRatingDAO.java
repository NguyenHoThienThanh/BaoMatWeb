package orishop.DAO;

import java.util.List;

import orishop.models.RatingModels;

public interface IRatingDAO {
	List<RatingModels> findAll();
	RatingModels findOne(int cusId, int proId);
	List<RatingModels> findByProduct(int id);
	List<RatingModels> findAllByUser(int id);
	boolean insert(RatingModels model);
	boolean update(RatingModels model);
	boolean delete(int ratingId);
}

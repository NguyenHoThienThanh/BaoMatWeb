package orishop.DAO;

import java.util.List;

import orishop.models.CategoryModels;

public interface ICategoryDAO {
	List<CategoryModels> findAllCategory();
	
	CategoryModels findOne(int cateID);
}

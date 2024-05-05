package orishop.services;

import java.util.List;

import orishop.DAO.CategoryDAOImp;
import orishop.DAO.ICategoryDAO;
import orishop.models.CategoryModels;

public class CategoryServiceImp implements ICategoryService{
	ICategoryDAO cateDAO = new CategoryDAOImp();
	
	@Override
	public List<CategoryModels> findAllCategory() {
		return cateDAO.findAllCategory();
	}
	@Override
	public CategoryModels findOne(int cateID) {
		return cateDAO.findOne(cateID);
	}
	
}

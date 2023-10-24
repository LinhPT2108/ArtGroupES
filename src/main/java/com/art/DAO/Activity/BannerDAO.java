package com.art.DAO.Activity;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.art.Entities.Activity.Banner;
import com.art.Entities.User.UserCustom;

public interface BannerDAO extends JpaRepository<Banner, Integer> {
	//Tìm tất cả các banner theo người dùng
	List<Banner> findByUser(UserCustom user);
	
	//Tìm theo tên banner
	List<Banner> findByBannerName(String bannerName);
	
	//Tìm banner theo ID
	Banner findById(int id);
	
	@SuppressWarnings("unchecked")
	//Thêm hoặc cập nhật một banner
	Banner save(Banner banner);
	
	//Xóa một banner theo ID
	void deleteById(int id);
}

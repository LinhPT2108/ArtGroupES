package com.art.DAO.User;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.art.Entities.User.Role;
import com.art.Entities.User.UserCustom;

public interface UserCustomDAO extends JpaRepository<UserCustom, String> {
	@Query("SELECT o FROM UserCustom o WHERE userId LIKE ?1")
	List<UserCustom> findByUserId(String userId);
//	// Thêm hoặc cập nhật một người dùng
//	@SuppressWarnings("unchecked")
//	UserCustom save(UserCustom user);
//
//	// Xóa một người dùng dựa trên ID
//	void deleteById(String userId);
//
//	// Kiểm tra xem một người dùng có tồn tại dựa trên ID hay không
//	boolean existsById(String userId);
//
//	// Tìm kiếm người dùng dựa trên họ tên
//	UserCustom findByFullname(String fullname);
//
	// Tìm kiếm người dùng dựa trên trạng thái is_del
	List<UserCustom> findByDel(boolean _del);
//
//	// Tìm kiếm người dùng dựa trên vai trò
//	List<UserCustom> findByRole(Role role);
//
	// Tìm kiếm người dùng dựa trên email
	List<UserCustom> findByEmail(String email);
	
//
//	// Tìm kiếm người dùng dựa trên họ tên chứa một từ khóa
//	List<UserCustom> findByFullnameContainingIgnoreCase(String keyword);
	
}

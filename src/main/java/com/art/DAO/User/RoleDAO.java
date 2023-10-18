package com.art.DAO.User;

import org.springframework.data.jpa.repository.JpaRepository;

import com.art.Entities.User.Role;

public interface RoleDAO extends JpaRepository<Role, String> {
	
//	// Thêm hoặc cập nhật một vai trò
//	@SuppressWarnings("unchecked")
//	Role save(Role role);
//
//	// Xóa một vai trò dựa trên tên vai trò
//	void deleteById(String roleName);
//
//	// Kiểm tra xem một vai trò có tồn tại dựa trên tên vai trò hay không
//	boolean existsById(String roleName);
//	
//	// Tìm kiếm vai trò dựa trên tên vai trò
//	Role findByRoleName(String roleName);
//
//    // Tìm kiếm vai trò dựa trên tên vai trò chứa một từ khóa
//    List<Role> findByRoleNameContainingIgnoreCase(String keyword);
}

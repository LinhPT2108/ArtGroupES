package com.art.Entities.User;

import java.util.List;

import org.hibernate.annotations.Nationalized;

import com.art.Entities.Activity.Banner;
import com.art.Entities.Activity.Cart;
import com.art.Entities.Activity.Comment;
import com.art.Entities.Activity.RecentlyViewed;
import com.art.Entities.Activity.WishList;
import com.art.Entities.Product.Category;
import com.art.Entities.Product.Manufacturer;
import com.art.Entities.Product.Product;
import com.art.Entities.Promotion.FlashSale;
import com.art.Entities.Promotion.Invoice;
import com.art.Entities.Promotion.Voucher;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class UserCustom {

	@Id
	private String userId;

	@ManyToOne
	@JoinColumn(name = "role")
	private Role roleName;
	
	@Column
	@Nationalized
	private String fullname;
	
	@Column
	private String image;
	
	@Column
	private String password;

	@Column
	private String email;
	
	@Column
	private boolean del;
	
	@OneToMany(mappedBy = "user")
	private List<InforAddress> userInfor;
	
	@OneToMany(mappedBy = "user")
	private List<Banner> userBanner;

	@OneToMany(mappedBy = "user")
	private List<Cart> userCart;

	@OneToMany(mappedBy = "user")
	private List<Comment> userComment;

	@OneToMany(mappedBy = "user")
	private List<RecentlyViewed> userRecentlyViewed;

	@OneToMany(mappedBy = "user")
	private List<WishList> userWishList;

	@OneToMany(mappedBy = "user")
	private List<Category> userCategory;

	@OneToMany(mappedBy = "user")
	private List<Manufacturer> userManufacturer;

	@OneToMany(mappedBy = "user")
	private List<Product> userProduct;

	@OneToMany(mappedBy = "user")
	private List<FlashSale> userFlashSale;

	@OneToMany(mappedBy = "user")
	private List<Invoice> userInvoice;

	@OneToMany(mappedBy = "user")
	private List<Voucher> userVoucher;

}

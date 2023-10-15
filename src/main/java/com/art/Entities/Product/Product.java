package com.art.Entities.Product;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.hibernate.annotations.Nationalized;

import com.art.Entities.Activity.Cart;
import com.art.Entities.Activity.Comment;
import com.art.Entities.Activity.RecentlyViewed;
import com.art.Entities.Promotion.InvoiceDetail;
import com.art.Entities.Promotion.PromotionalDetails;
import com.art.Entities.User.UserCustom;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Product {

	@Id
	private String productId;

	@Column
	@Nationalized
	private String productName;

	@Column
	private int quantityInStock;

	@Column
	private boolean del;

	@Column
	private BigDecimal price;

	@Temporal(TemporalType.DATE)
	@Column
	private Date createdDate = new Date();

	@ManyToOne
	@JoinColumn(name = "userProduct")
	private UserCustom user;

	@ManyToOne
	@JoinColumn(name = "category")
	private Category categoryProduct;

	@ManyToOne
	@JoinColumn(name = "manufacturer")
	private Manufacturer manufacturerProduct;

	@OneToMany(mappedBy = "product")
	private List<Comment> productComment;
	
	@OneToMany(mappedBy = "product")
	private List<Cart> productCart;

	@OneToMany(mappedBy = "product")
	private List<RecentlyViewed> productRecentlyViewed;

	@OneToMany(mappedBy = "product")
	private List<DetailDescription> productDetailDescription;

	@OneToMany(mappedBy = "product")
	private List<Image> productImage;

	@OneToMany(mappedBy = "product")
	private List<InvoiceDetail> productInvoiceDetail;

	@OneToMany(mappedBy = "product")
	private List<PromotionalDetails> productPromotionalDetails;
	
}

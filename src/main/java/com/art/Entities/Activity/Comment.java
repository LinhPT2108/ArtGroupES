package com.art.Entities.Activity;

import java.util.Date;
import java.util.List;

import org.hibernate.annotations.Nationalized;

import com.art.Entities.Product.Product;
import com.art.Entities.Promotion.InvoiceDetail;
import com.art.Entities.User.UserCustom;
import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Comment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column
	private int star;

	@Column
	@Nationalized
	private String content;

	@Column
	@Temporal(TemporalType.DATE)
	private Date date;

	@JsonBackReference
	@ManyToOne
	@JoinColumn(name = "userComment")
	private UserCustom user;
	
	@JsonBackReference
	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;
	
	@JsonBackReference
	@OneToOne
	@JoinColumn(name = "invoiceDetail")
	private InvoiceDetail invoiceDetail;

	@JsonBackReference
	@OneToMany(mappedBy = "comment", fetch=FetchType.EAGER)
	private List<ImageComment> ImageComment;
}

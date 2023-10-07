<<<<<<< HEAD
﻿USE artgroup;
=======
﻿
USE artgroup;
>>>>>>> dev/nguyentcpc04750
GO 

INSERT INTO dbo.role
        ( role_name )
VALUES  ( 'admin'),( 'user'),( 'shipper');
GO 

INSERT INTO dbo.user_custom
        ( is_del ,
          email ,
          fullname ,
          image ,
          password ,
          role_name ,
          user_id
        )
VALUES  ( 1 , -- is_del - bit
          'linhptpc04737@fpt.edu.vn' , -- email - varchar(255)
          N'Phan Tuấn Linh' , -- fullname - nvarchar(255)
          'linhptpc04737.png' , -- image - varchar(255)
          '123123' , -- password - varchar(255)
          'user' , -- role - varchar(255)
          'linhptpc04737'  -- user_id - varchar(255)
        ),
		( 1 , -- is_del - bit
          'nguyentcpc04750@fpt.edu.vn' , -- email - varchar(255)
          N'Trần Chí Nguyễn' , -- fullname - nvarchar(255)
          'nguyentcpc04750.png' , -- image - varchar(255)
          '123123' , -- password - varchar(255)
          'admin' , -- role - varchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 1 , -- is_del - bit
          'nhintpc04729@fpt.edu.vn' , -- email - varchar(255)
          N'Nguyễn Tấn Nhi' , -- fullname - nvarchar(255)
          'nhintpc04729.png' , -- image - varchar(255)
          '123123' , -- password - varchar(255)
          'shipper' , -- role - varchar(255)
          'nhintpc04729'  -- user_id - varchar(255)
        );
GO

INSERT INTO dbo.infor_address
        ( address, phone_number, user_id )
VALUES  ( N'An phú, Ninh Kiều, Cần Thơ', -- address - nvarchar(255)
          '0948922927', -- phone_number - varchar(255)
          'linhptpc04737'  -- user_id - varchar(255)
          ),
		  ( N'Thới Hưng, Cờ Đỏ, Cần Thơ', -- address - nvarchar(255)
          '0909123123', -- phone_number - varchar(255)
          'linhptpc04737'  -- user_id - varchar(255)
          ),
		  ( N'Ngã Năm, Sóc Trăng', -- address - nvarchar(255)
          '0909666999', -- phone_number - varchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
          ),
		  ( N'Cờ Đỏ, Cần Thơ', -- address - nvarchar(255)
          '0909888666', -- phone_number - varchar(255)
          'nhintpc04729'  -- user_id - varchar(255)
          );
GO

INSERT INTO dbo.voucher
        ( discount, user_id )
VALUES  ( 19000, -- discount - float
          'nguyentcpc04750'  -- user_id - varchar(255)
          ),
		  ( 29000, -- discount - float
          'nguyentcpc04750'  -- user_id - varchar(255)
          ),
		  ( 39000, -- discount - float
          'nguyentcpc04750'  -- user_id - varchar(255)
          ),
		  ( 49000, -- discount - float
          'nguyentcpc04750'  -- user_id - varchar(255)
          ),
		  ( 59000, -- discount - float
          'nguyentcpc04750'  -- user_id - varchar(255)
          ),
		  ( 69000, -- discount - float
          'nguyentcpc04750'  -- user_id - varchar(255)
          ),
		  ( 79000, -- discount - float
          'nguyentcpc04750'  -- user_id - varchar(255)
          ),
		  ( 89000, -- discount - float
          'nguyentcpc04750'  -- user_id - varchar(255)
          ),
		  ( 99000, -- discount - float
          'nguyentcpc04750'  -- user_id - varchar(255)
          ),
		  ( 119000, -- discount - float
          'nguyentcpc04750'  -- user_id - varchar(255)
          ),
		  ( 149000, -- discount - float
          'nguyentcpc04750'  -- user_id - varchar(255)
          );
GO

INSERT INTO dbo.invoice
        ( total_amount ,
          invoice_date ,
          note ,
          user_id
        )
VALUES  ( 199000 , -- total_amount - float
          '2023-09-01' , -- invoice_date - datetime2(6)
          N'' , -- note - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 150000 , -- total_amount - float
          '2023-10-01' , -- invoice_date - datetime2(6)
          N'Gọi trước khi giao hàng' , -- note - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 469000 , -- total_amount - float
          '2023-10-02' , -- invoice_date - datetime2(6)
          N'' , -- note - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        );
GO

INSERT INTO dbo.flash_sale
        ( is_status ,
          end_day ,
          start_day ,
          user_id
        )
VALUES  ( 0 , -- is_status - bit
          '2023-07-15' , -- end_day - datetime2(6)
          '2023-06-15' , -- start_day - datetime2(6)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 1 , -- is_status - bit
          '2023-10-15' , -- end_day - datetime2(6)
          '2023-09-15' , -- start_day - datetime2(6)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 1 , -- is_status - bit
          '2023-11-15' , -- end_day - datetime2(6)
          '2023-10-15' , -- start_day - datetime2(6)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 1 , -- is_status - bit
          '2023-12-15' , -- end_day - datetime2(6)
          '2023-11-15' , -- start_day - datetime2(6)
          'nguyentcpc04750'  -- user_id - varchar(255)
        );
GO

INSERT  INTO dbo.banner
        ( banner_name, user_id )
VALUES  ( 'salemonth09.png', -- banner_name - varchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
        ( 'salemonth10.png', -- banner_name - varchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
        ( 'salemonth11.png', -- banner_name - varchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        );
GO

INSERT INTO dbo.manufacturer
        ( is_del ,
          manufacturer_name ,
          user_id
        )
VALUES  ( 1 , -- is_del - bit
          'Samsung' , -- manufacturer_name - varchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 1 , -- is_del - bit
          'LG' , -- manufacturer_name - varchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 1 , -- is_del - bit
          'Toshiba' , -- manufacturer_name - varchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 0 , -- is_del - bit
          'Asanyo' , -- manufacturer_name - varchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 1 , -- is_del - bit
          'Media' , -- manufacturer_name - varchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 1 , -- is_del - bit
          'VSP' , -- manufacturer_name - varchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        );
GO

INSERT INTO dbo.category
        ( is_del, category_name, user_id )
VALUES  ( 1, -- is_del - bit
          'telivion', -- category_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 1, -- is_del - bit
          'fridge', -- category_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 1, -- is_del - bit
          'washing machine', -- category_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 1, -- is_del - bit
          'air-conditioner', -- category_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 1, -- is_del - bit
          'electric stove', -- category_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 0, -- is_del - bit
          'gas stove', -- category_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        );
GO

INSERT INTO dbo.product
        ( category_id ,
          is_del ,
          manufacturer_id ,
          quantity_in_stock ,
          prodcut_id ,
          product_name ,
          user_id
        )
VALUES  ( 1 , -- category_id - int
          1 , -- is_del - bit
          1 , -- manufacturer_id - int
          20 , -- quantity_in_stock - int
          'QA55Q65A' , -- prodcut_id - varchar(255)
          N'Smart Tivi QLED 4K 55 inch Samsung QA55Q65A' , -- product_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 1 , -- category_id - int
          1 , -- is_del - bit
          2 , -- manufacturer_id - int
          10 , -- quantity_in_stock - int
          '55NANO76SQA' , -- prodcut_id - varchar(255)
          N'Smart Tivi NanoCell LG 4K 55 inch 55NANO76SQA ' , -- product_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 1 , -- category_id - int
          1 , -- is_del - bit
          3 , -- manufacturer_id - int
          5 , -- quantity_in_stock - int
          '32V35KP' , -- prodcut_id - varchar(255)
          N'Android Tivi Toshiba 32 inch 32V35KP ' , -- product_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 2 , -- category_id - int
          1 , -- is_del - bit
          1 , -- manufacturer_id - int
          35 , -- quantity_in_stock - int
          'RT25M4032BU/SV' , -- prodcut_id - varchar(255)
          N'Tủ lạnh Samsung Inverter 256 lít RT25M4032BU/SV' , -- product_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 2 , -- category_id - int
          1 , -- is_del - bit
          2 , -- manufacturer_id - int
          50 , -- quantity_in_stock - int
          'GR-B256JDS' , -- prodcut_id - varchar(255)
          N'Tủ lạnh LG Inverter 519 lít Side By Side GR-B256JDS' , -- product_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 2 , -- category_id - int
          1 , -- is_del - bit
          3 , -- manufacturer_id - int
          20 , -- quantity_in_stock - int
          'GR-RF610WE-PGV(22)-XK' , -- prodcut_id - varchar(255)
          N'Tủ lạnh Toshiba Inverter 511 lít Multi Door GR-RF610WE-PGV(22)-XK' , -- product_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 3 , -- category_id - int
          1 , -- is_del - bit
          1 , -- manufacturer_id - int
          35 , -- quantity_in_stock - int
          'WW80T3020WW/SV' , -- prodcut_id - varchar(255)
          N'Máy giặt Samsung Inverter 8kg WW80T3020WW/SV' , -- product_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 3 , -- category_id - int
          1 , -- is_del - bit
          2 , -- manufacturer_id - int
          50 , -- quantity_in_stock - int
          'T2351VSAB' , -- prodcut_id - varchar(255)
          N'Máy giặt LG TurboDrum Inverter 11.5 kg T2351VSAB' , -- product_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 3 , -- category_id - int
          1 , -- is_del - bit
          3 , -- manufacturer_id - int
          20 , -- quantity_in_stock - int
          'AW-L805AV' , -- prodcut_id - varchar(255)
          N'Máy giặt Toshiba 7 Kg AW-L805AV (SG)' , -- product_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 4 , -- category_id - int
          1 , -- is_del - bit
          1 , -- manufacturer_id - int
          35 , -- quantity_in_stock - int
          'AR13CYFAAWKNSV' , -- prodcut_id - varchar(255)
          N'Máy lạnh Samsung Inverter 1.5 HP AR13CYFAAWKNSV' , -- product_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 4 , -- category_id - int
          1 , -- is_del - bit
          2 , -- manufacturer_id - int
          50 , -- quantity_in_stock - int
          'ZTNQ18GPLA0' , -- prodcut_id - varchar(255)
          N'Máy lạnh âm trần LG Inverter 2 HP ZTNQ18GPLA0' , -- product_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 4 , -- category_id - int
          1 , -- is_del - bit
          3 , -- manufacturer_id - int
          20 , -- quantity_in_stock - int
          'RAS-H10Z1KCVG-V' , -- prodcut_id - varchar(255)
          N'Máy lạnh Toshiba Inverter 1 HP RAS-H10Z1KCVG-V' , -- product_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        ),
		( 4 , -- category_id - int
          1 , -- is_del - bit
          5 , -- manufacturer_id - int
          50 , -- quantity_in_stock - int
          'MSAGA-10CRDN8' , -- prodcut_id - varchar(255)
          N'Máy lạnh Midea Inverter 1 HP MSAGA-10CRDN8' , -- product_name - nvarchar(255)
          'nguyentcpc04750'  -- user_id - varchar(255)
        );
GO
		  
INSERT INTO dbo.price
        ( is_use, price, product_id )
VALUES  ( 1, -- is_use - bit
          12990000, -- price - float
          'QA55Q65A'  -- product_id - varchar(255)
          ),
		  ( 1, -- is_use - bit
          11890000, -- price - float
          '55NANO76SQA'  -- product_id - varchar(255)
          ),
		  ( 1, -- is_use - bit
          6990000, -- price - float
          '32V35KP'  -- product_id - varchar(255)
          ),
		  ( 1, -- is_use - bit
          7190000, -- price - float
          'RT25M4032BU/SV'  -- product_id - varchar(255)
          ),
		  ( 1, -- is_use - bit
          14490000, -- price - float
          'GR-B256JDS'  -- product_id - varchar(255)
          ),
		  ( 1, -- is_use - bit
          20490000, -- price - float
          'GR-RF610WE-PGV(22)-XK'  -- product_id - varchar(255)
          ),
		  ( 1, -- is_use - bit
          5990000, -- price - float
          'WW80T3020WW/SV'  -- product_id - varchar(255)
          ),
		  ( 1, -- is_use - bit
          14490000, -- price - float
          'T2351VSAB'  -- product_id - varchar(255)
          ),
		  ( 1, -- is_use - bit
          3990000, -- price - float
          'AW-L805AV'  -- product_id - varchar(255)
          ),
		  ( 1, -- is_use - bit
          11390000, -- price - float
          'AR13CYFAAWKNSV'  -- product_id - varchar(255)
          ),
		  ( 1, -- is_use - bit
          23990000, -- price - float
          'ZTNQ18GPLA0'  -- product_id - varchar(255)
          ),
		  ( 1, -- is_use - bit
          10590000, -- price - float
          'RAS-H10Z1KCVG-V'  -- product_id - varchar(255)
          ),
		  ( 1, -- is_use - bit
          6990000, -- price - float
          'MSAGA-10CRDN8'  -- product_id - varchar(255)
          );
GO

INSERT INTO dbo.detail_description
        ( description, product_id, tile )
VALUES  ( N'Smart Tivi QLED 4K 55 inch Samsung QA55Q65A với thiết kế với màn hình tràn viền 4 cạnh, 
			cho người dùng trải nghiệm khung hình giải trí trên tivi chân thực như thực tế đang xảy ra trước mắt.
			Tivi Samsung 55 inch có chân đế được thiết kế gọn gàng, vững chắc. Mang lại sự thanh lịch, 
			sang trọng cho chiếc tivi, phù hợp trưng bày ở phòng khách, phòng ngủ,..', -- description - nvarchar(255)
          'QA55Q65A', -- product_id - varchar(255)
          N'Thiết kế thanh mảnh, màn hình tràn viền 4 cạnh ấn tượng'  -- tile - nvarchar(255)
          ),
		  ( N'Smart Tivi NanoCell LG 4K 55 inch 55NANO76SQA sở hữu màn hình 55 inch cùng thiết kế thanh mảnh, 
			tinh tế, bố trí sang đẹp cho phòng khách gia đình, phù hợp cho cả phòng ngủ, phòng họp nhỏ, phòng khách sạn,...
			Chân đế hình bán nguyệt cấu tạo vỏ nhựa lõi kim loại chắc chắn, bố trí lắp để bàn đẹp mắt, mềm mại, 
			dễ dàng tháo rời để sử dụng tivi treo tường tiết kiệm không gian.', -- description - nvarchar(255)
          '55NANO76SQA', -- product_id - varchar(255)
          N'Tổng quan thiết kế'  -- tile - nvarchar(255)
          ),
		  ( N'Tivi Toshiba này có thiết kế nhỏ gọn cùng tone màu đen sang trọng, thanh lịch, tạo điểm nhấn cho không gian nhà.
			Màn hình 32 inch phù hợp cho những không gian phòng khách, phòng ngủ nhỏ. 
			Chân đế được làm bằng nhựa chắc chắn, thiết kế dạng chữ V úp ngược giúp tivi có thể đứng vững trên bàn hay kệ tủ. 
			Tivi còn có thể treo tường hiện đại, giúp tiết kiệm được không gian. ', -- description - nvarchar(255)
          '32V35KP', -- product_id - varchar(255)
          N'Tổng quan thiết kế'  -- tile - nvarchar(255)
          ),
		  ( N'Tủ lạnh Samsung Inverter 256 lít RT25M4032BU/SV được trang bị ngăn Đông Mềm Optimal Fresh Zone 
			có tác dụng giữ thực phẩm tươi sống còn trọn dưỡng chất, hoàn toàn không đông đá ở nhiệt độ đông mềm lý tưởng -1°C. 
			Như thế, thịt cá hoàn toàn không bị đông đá giúp bạn có thể nấu ăn ngay không cần rã đông, dễ dàng cắt thái và chế biến trong ngày.
			Lưu ý, chỉ nên sử dụng ngăn đông mềm này với các thực phẩm muốn chế biến trong ngày, nếu muốn trữ lâu hơn, 
			bạn nên dùng ngăn đông để bảo quản tốt nhất.', -- description - nvarchar(255)
          'RT25M4032BU/SV', -- product_id - varchar(255)
          N'Bảo quản thực phẩm tươi sống, sử dụng trong ngày không cần rã đông với Ngăn đông mềm -1 độ C Optimal Fresh Zone'  -- tile - nvarchar(255)
          ),
		  ( N'- Dòng tủ lạnh side by side, chất liệu cửa tủ được làm từ thép không gỉ bền chắc với màu bạc tinh tế, 
			hòa hợp với mọi không gian nội thất.
			Tay nắm cửa được thiết kế âm tủ giúp tổng thể liền mạch, đem đến sự tối giản, hiện đại.
			Tủ lạnh sẽ thích hợp đặt trong phòng khách và nhà bếp.
			Dung tích 519 lít thích hợp với gia đình từ 4 - 5 thành viên.', -- description - nvarchar(255)
          'GR-B256JDS', -- product_id - varchar(255)
          N'Tổng quan thiết kế'  -- tile - nvarchar(255)
          ),
		  ( N'Tủ lạnh Toshiba Inverter 511 lít Multi Door GR-RF610WE-PGV(22)-XK thiết kế tủ hiện đại với bề mặt gương sang trọng
		   cùng gam màu đen ấn tượng, là điểm nhấn trong không gian sống của gia đình. Tủ lạnh trang bị công nghệ Dual Cooling hai dàn lạnh độc lập
		   làm lạnh hiệu quả cùng công nghệ Origin Inverter tiết kiệm điện năng, vận hành êm ái. 
		   Có ngăn cấp đông linh hoạt Flexible Zone giúp điều chỉnh nhiệt độ phù hợp với nước uống, thực phẩm khô và rau củ, 
		   ngăn tăng cường độ ẩm Moisture Zone giúp điều chỉnh độ ẩm thích hợp với các loại trái cây và rau củ.', -- description - nvarchar(255)
          'GR-RF610WE-PGV(22)-XK', -- product_id - varchar(255)
          N'Tổng quan thiết kế'  -- tile - nvarchar(255)
          ),
		  ( N'Máy giặt được trang bị động cơ Digital Inverter với nam châm vĩnh cửu, giảm tối đa ma sát khi máy giặt vận hành, 
		  giúp tiết kiệm điện năng, vận hành êm ái hơn so với động cơ thông thường sử dụng chổi than. Đặc biệt, 
		  động cơ Digital Inverter có độ bền vượt trội và được bảo hành đến 11 năm.', -- description - nvarchar(255)
          'WW80T3020WW/SV', -- product_id - varchar(255)
          N'Động cơ Digital Inverter tối ưu hóa hiệu năng và lượng điện tiêu thụ'  -- tile - nvarchar(255)
          ),
		  ( N'Chiếc máy giặt LG TurboDrum Inverter 11.5 kg T2351VSAB mang gam màu xám thanh lịch, vỏ máy kim loại sơn tĩnh điện, 
			khối lượng giặt 11.5 kg phù hợp với các gia đình trên 7 thành viên. ', -- description - nvarchar(255)
          'T2351VSAB', -- product_id - varchar(255)
          N'Thiết kế cửa trên truyền thống, sơn tĩnh điện gam màu xám thanh lịch, sang trọng'  -- tile - nvarchar(255)
          ),
		  ( N'Máy giặt Toshiba 7 Kg AW-L805AV (SG) có màu xám bạc vừa toát lên vẻ sang trọng, hiện đại vừa đảm bảo vệ sinh hơn trong quá trình sử dụng. 
			Với thiết kế cửa trên, lồng đứng và có khối lượng giặt là 7 kg này sẽ phù hợp với những gia đình có 2 - 3 thành viên. 
			Hoặc với gia đình có đông thành viên hơn nhưng nhu cầu giặt giũ ít thì vẫn là lựa chọn phù hợp cho gia đình bạn.', -- description - nvarchar(255)
          'AW-L805AV', -- product_id - varchar(255)
          N'Thiết kế tối giản, sang trọng, hiện đại với khối lượng giặt 7 kg phù hợp cho gia đình 2 - 3 người'  -- tile - nvarchar(255)
          ),
		  ( N'Công suất làm lạnh 1.5 HP làm lạnh hiệu quả cho diện tích từ 15 - 20m².
			Tiết kiệm điện và đảm bảo máy vận hành êm ái nhờ công nghệ Digital Inverter Boost và Eco.
			Lọc bụi hiệu quả, dễ tháo dỡ vệ sinh với bộ lọc Copper Anti-bacteria Filter.
			Công nghệ Fast Cooling làm lạnh nhanh chóng không gian.
			Chế độ Wind-Free cho hơi lạnh tỏa ra nhẹ nhàng, tạo cảm giác dễ chịu.
			Hong khô dàn lạnh, hạn chế nấm mốc nhờ có chức năng tự làm sạch Auto Clean.
			Tiện lợi điều chỉnh nhiệt độ máy lạnh từ xa qua ứng dụng SmartThings.
			Làm lạnh thông minh AI Auto Cooling hơi lạnh tỏa ra nhanh chóng.', -- description - nvarchar(255)
          'AR13CYFAAWKNSV', -- product_id - varchar(255)
          N'Đặc điểm nổi bật'  -- tile - nvarchar(255)
          ),
		  ( N'Máy lạnh Samsung Inverter 1.5 HP AR13CYFAAWKNSV thuộc dòng máy lạnh 1 chiều sở hữu thiết kế sang trọng, 
			  làm lạnh nhanh chóng với công nghệ Fast Cooling, tạo làn gió thổi nhẹ nhàng, dễ chịu nhờ công nghệ Wind-Free, 
			  đảm bảo thiết bị vận hành êm ái, giảm tiêu thụ điện với công nghệ Digital Inverter Boost và Eco, 
			  tiết kiệm thời gian vệ sinh máy với chức năng tự làm sạch Auto Clean.', -- description - nvarchar(255)
          'AR13CYFAAWKNSV', -- product_id - varchar(255)
          N'Thông tin sản phẩm'  -- tile - nvarchar(255)
          ),
		  ( N'Máy lạnh âm trần LG Inverter 2 HP ZTNQ18GPLA0 có thiết kế âm trần phù hợp cho các khu vực đông người như văn phòng, siêu thị. 
		  Sản phẩm kèm theo nhiều tính năng như làm lạnh nhanh, Smart Inverter tiết kiệm điện và bộ lọc sơ bộ lọc bụi hiệu quả.', -- description - nvarchar(255)
          'ZTNQ18GPLA0', -- product_id - varchar(255)
          N'Thông tin sản phẩm'  -- tile - nvarchar(255)
          ),
		  ( N'Máy lạnh Toshiba Inverter 1 HP RAS-H10Z1KCVG-V làm lạnh tức thì với chế độ Hi Power, 
		  đảm bảo thiết bị hoạt động mượt mà, làm lạnh ổn định, tuổi thọ cao với công nghệ Hybrid Inverter, 
		  chế độ Eco, giữ không khí trong lành, ngăn vi khuẩn, nấm mốc phát triển với công nghệ Magic Coil, bộ lọc chống nấm mốc.', -- description - nvarchar(255)
          'RAS-H10Z1KCVG-V', -- product_id - varchar(255)
          N'Thông tin sản phẩm'  -- tile - nvarchar(255)
          ),
		  ( N'Máy lạnh Midea Inverter 1 HP MSAGA-10CRDN8 là dòng máy lạnh 1 chiều (chỉ làm lạnh), sở hữu công nghệ Inverter Quattro, 
		  chế độ iEco/Gear tiết kiệm điện năng, máy hoạt động êm ái, bền bỉ. Trang bị chế độ làm lạnh nhanh Boost, bộ lọc bụi 2 lớp HD, 
		  công nghệ lọc kép Dual Filtration làm sạch không khí, đảm bảo an toàn sức khỏe cho cả gia đình. ', -- description - nvarchar(255)
          'MSAGA-10CRDN8', -- product_id - varchar(255)
          N'Thông tin sản phẩm'  -- tile - nvarchar(255)
          );
GO

INSERT INTO dbo.image
        ( image, product_id )
VALUES  ( 'QA55Q65A_1.png', -- image - varchar(255)
          'QA55Q65A'  -- product_id - varchar(255)
        ),
		( 'QA55Q65A_2.png', -- image - varchar(255)
          'QA55Q65A'  -- product_id - varchar(255)
        ),
		( 'QA55Q65A_3.png', -- image - varchar(255)
          'QA55Q65A'  -- product_id - varchar(255)
        ),
		( '55NANO76SQA_1.png', -- image - varchar(255)
          '55NANO76SQA'  -- product_id - varchar(255)
        ),
		( '55NANO76SQA_2.png', -- image - varchar(255)
          '55NANO76SQA'  -- product_id - varchar(255)
        ),
		( '55NANO76SQA_3.png', -- image - varchar(255)
          '55NANO76SQA'  -- product_id - varchar(255)
        ),
		( '32V35KP_1.png', -- image - varchar(255)
          '32V35KP'  -- product_id - varchar(255)
        ),
		( '32V35KP_2.png', -- image - varchar(255)
          '32V35KP'  -- product_id - varchar(255)
        ),
		( '32V35KP_3.png', -- image - varchar(255)
          '32V35KP'  -- product_id - varchar(255)
        ),
		( 'RT25M4032BU/SV_1.png', -- image - varchar(255)
          'RT25M4032BU/SV'  -- product_id - varchar(255)
        ),
		( 'RT25M4032BU/SV_2.png', -- image - varchar(255)
          'RT25M4032BU/SV'  -- product_id - varchar(255)
        ),
		( 'RT25M4032BU/SV_3.png', -- image - varchar(255)
          'RT25M4032BU/SV'  -- product_id - varchar(255)
        ),
		( 'GR-B256JDS_1.png', -- image - varchar(255)
          'GR-B256JDS'  -- product_id - varchar(255)
        ),
		( 'GR-B256JDS_2.png', -- image - varchar(255)
          'GR-B256JDS'  -- product_id - varchar(255)
        ),
		( 'GR-B256JDS_3.png', -- image - varchar(255)
          'GR-B256JDS'  -- product_id - varchar(255)
        ),
		( 'GR-RF610WE-PGV(22)-XK_1.png', -- image - varchar(255)
          'GR-RF610WE-PGV(22)-XK'  -- product_id - varchar(255)
        ),
		( 'GR-RF610WE-PGV(22)-XK_2.png', -- image - varchar(255)
          'GR-RF610WE-PGV(22)-XK'  -- product_id - varchar(255)
        ),
		( 'GR-RF610WE-PGV(22)-XK_3.png', -- image - varchar(255)
          'GR-RF610WE-PGV(22)-XK'  -- product_id - varchar(255)
        ),
		( 'WW80T3020WW/SV_1.png', -- image - varchar(255)
          'WW80T3020WW/SV'  -- product_id - varchar(255)
        ),
		( 'WW80T3020WW/SV_2.png', -- image - varchar(255)
          'WW80T3020WW/SV'  -- product_id - varchar(255)
        ),
		( 'WW80T3020WW/SV_3.png', -- image - varchar(255)
          'WW80T3020WW/SV'  -- product_id - varchar(255)
        ),
		( 'T2351VSAB_1.png', -- image - varchar(255)
          'T2351VSAB'  -- product_id - varchar(255)
        ),
		( 'T2351VSAB_2.png', -- image - varchar(255)
          'T2351VSAB'  -- product_id - varchar(255)
        ),
		( 'T2351VSAB_3.png', -- image - varchar(255)
          'T2351VSAB'  -- product_id - varchar(255)
        ),
		( 'AW-L805AV_1.png', -- image - varchar(255)
          'AW-L805AV'  -- product_id - varchar(255)
        ),
		( 'AW-L805AV_2.png', -- image - varchar(255)
          'AW-L805AV'  -- product_id - varchar(255)
        ),
		( 'AW-L805AV_3.png', -- image - varchar(255)
          'AW-L805AV'  -- product_id - varchar(255)
        ),
		( 'AR13CYFAAWKNSV_1.png', -- image - varchar(255)
          'AR13CYFAAWKNSV'  -- product_id - varchar(255)
        ),
		( 'AR13CYFAAWKNSV_2.png', -- image - varchar(255)
          'AR13CYFAAWKNSV'  -- product_id - varchar(255)
        ),
		( 'AR13CYFAAWKNSV_3.png', -- image - varchar(255)
          'AR13CYFAAWKNSV'  -- product_id - varchar(255)
        ),
		( 'ZTNQ18GPLA0_1.png', -- image - varchar(255)
          'ZTNQ18GPLA0'  -- product_id - varchar(255)
        ),
		( 'ZTNQ18GPLA0_2.png', -- image - varchar(255)
          'ZTNQ18GPLA0'  -- product_id - varchar(255)
        ),
		( 'ZTNQ18GPLA0_3.png', -- image - varchar(255)
          'ZTNQ18GPLA0'  -- product_id - varchar(255)
        ),
		( 'RAS-H10Z1KCVG-V_1.png', -- image - varchar(255)
          'RAS-H10Z1KCVG-V'  -- product_id - varchar(255)
        ),
		( 'ZTNQ18GPLA0_2.png', -- image - varchar(255)
          'RAS-H10Z1KCVG-V'  -- product_id - varchar(255)
        ),
		( 'RAS-H10Z1KCVG-V_3.png', -- image - varchar(255)
          'RAS-H10Z1KCVG-V'  -- product_id - varchar(255)
        ),
		( 'MSAGA-10CRDN8_1.png', -- image - varchar(255)
          'MSAGA-10CRDN8'  -- product_id - varchar(255)
        ),
		( 'MSAGA-10CRDN8_2.png', -- image - varchar(255)
          'RAS-H10Z1KCVG-V'  -- product_id - varchar(255)
        ),
		( 'MSAGA-10CRDN8_3.png', -- image - varchar(255)
          'MSAGA-10CRDN8'  -- product_id - varchar(255)
        );
GO 



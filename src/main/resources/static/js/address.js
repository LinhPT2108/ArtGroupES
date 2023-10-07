$(document).ready(function() {
	var cities = $("#city").selectize({
		valueField: "Id",
		labelField: "Name",
		searchField: "Name",
		options: [],
		placeholder: "Chọn tỉnh thành",
		maxItems: 1,
		onChange: function(value) {
			if (value) {
				var selectedCity = this.options[value];
				var districtSelectize = districts[0].selectize;
				districtSelectize.clearOptions();
				districtSelectize.addOption(selectedCity.Districts);
				districtSelectize.clear();
				districtSelectize.refreshItems();
				districtSelectize.open();
			} else {
				districts[0].selectize.clearOptions();
				districts[0].selectize.clear();
				wards[0].selectize.clearOptions();
				wards[0].selectize.clear();
			}
		},
	});

	var districts = $("#district").selectize({
		valueField: "Id",
		labelField: "Name",
		searchField: "Name",
		options: [],
		placeholder: "Chọn quận huyện",
		maxItems: 1,
		onChange: function(value) {
			if (value) {
				var selectedCity = cities[0].selectize.getValue();
				var selectedDistrict = this.options[value];
				var wardSelectize = wards[0].selectize;
				wardSelectize.clearOptions();
				wardSelectize.addOption(selectedDistrict.Wards);
				wardSelectize.clear();
				wardSelectize.refreshItems();
				wardSelectize.open();
			} else {
				wards[0].selectize.clearOptions();
				wards[0].selectize.clear();
			}
		},
	});

	var wards = $("#ward").selectize({
		valueField: "Id",
		labelField: "Name",
		searchField: "Name",
		options: [],
		placeholder: "Chọn phường xã",
		maxItems: 1,
	});

	axios
		.get("../../data/data.json")
		.then(function(response) {
			var data = response.data;
			cities[0].selectize.addOption(data);
		})
		.catch(function(error) {
			console.error("Error fetching data:", error);
		});
	$("#btnCheck").click(function(event) {
		event.preventDefault();

		var selectedCityValue = cities[0].selectize.getValue();
		var selectedDistrictValue = districts[0].selectize.getValue();
		var selectedWardValue = wards[0].selectize.getValue();
		if (selectedCityValue == '' || selectedDistrictValue == '' || selectedWardValue == '') {
			Swal
				.fire({
					icon: 'error',
					title: 'Oops...',
					text: 'Vui lòng chọn địa chỉ!',
				})
		}else{
			var selectedCityName = cities[0].selectize.options[selectedCityValue].Name;
			var selectedDistrictName =
				districts[0].selectize.options[selectedDistrictValue].Name;
			var selectedWardName = wards[0].selectize.options[selectedWardValue].Name;

			var selectedAddress = `Địa chỉ đã chọn: ${selectedWardName}, ${selectedDistrictName}, ${selectedCityName}`;
			console.log(selectedAddress);
			$('#modalAddress').modal('hide');
		}

	});
});

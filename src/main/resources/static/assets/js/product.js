// Lấy phần tử input và ul (danh sách hình ảnh)
const fileInput = document.getElementById("file");
const imageList = document.getElementById("imageList");
const selectedImages = []; // Danh sách các tệp đã chọn

// Thêm sự kiện khi người dùng chọn tệp hình ảnh
fileInput.addEventListener("change", function () {
  const selectedFiles = fileInput.files;

  for (let i = 0; i < selectedFiles.length; i++) {
    const selectedFile = selectedFiles[i];

    // Kiểm tra xem tệp đã được chọn có tồn tại trong danh sách không
    if (selectedImages.some((img) => img.name === selectedFile.name)) {
      alert(`Hình ảnh "${selectedFile.name}" đã tồn tại.`);
      continue; // Bỏ qua tệp đã tồn tại
    }

    const objectURL = URL.createObjectURL(selectedFile);

    // Tạo phần tử li chứa hình ảnh
    const listItem = document.createElement("li");
    listItem.style.position = "relative";

    // Tạo nút X để xóa hình ảnh
    const deleteButton = document.createElement("button");
    deleteButton.classList.add("ti");
    deleteButton.classList.add("ti-x");
    deleteButton.classList.add("delete-button");
    deleteButton.addEventListener("click", function () {
      // Xóa hình ảnh và cập nhật danh sách
      listItem.remove();
      selectedImages.splice(selectedImages.indexOf(selectedFile), 1);
    });

    // Tạo phần tử hình ảnh và thêm vào danh sách
    const image = document.createElement("img");
    image.src = objectURL;

    // Thêm nút X vào phần tử li
    listItem.appendChild(deleteButton);
    listItem.appendChild(image);

    // Thêm phần tử li vào danh sách
    imageList.appendChild(listItem);

    // Thêm tệp đã chọn vào danh sách
    selectedImages.push(selectedFile);
  }
});
let counter = 1;

function themMoTa() {
  counter++;

  const newRow = document.createElement("div");
  newRow.className = "col-xs-12 col-md-6 mb-3";
  newRow.innerHTML = `
                <div class=" border border-1 p-3 position-relative">
                    <span class="position-absolute z-3 bg-white" style="top: -13px">Mô tả ${counter}:</span>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="tieude${counter}" placeholder="">
                            <label for="tieude${counter}">Tiêu đề:</label>
                        </div>
                    </div>
                    <div class="form-floating">
                        <textarea class="form-control" placeholder="Leave a comment here" id="noidung${counter}" style="height: 100px;"></textarea>
                        <label for="noidung${counter}">Nội dung:</label>
                    </div>
                </div>
            `;

  const addButton = document.querySelector(".button");
  addButton.parentElement.insertBefore(newRow, addButton);
}

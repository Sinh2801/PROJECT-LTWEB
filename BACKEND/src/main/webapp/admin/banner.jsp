<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Banner | INOLA Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${ctx}/assets/css/HeaderAndSidebar.css">
    <link rel="stylesheet" href="${ctx}/assets/css/Banner.css">
</head>
<body>
<div class="container">

    <jsp:include page="common/sidebar.jsp">
        <jsp:param name="activePage" value="banner" />
    </jsp:include>

    <div class="main-content">
        <jsp:include page="common/header.jsp" />

        <main class="main-content-page">
            <div class="content-container">

                <div class="page-header-control">
                    <div>
                        <h2>Quản Lý Banner</h2>
                        <p style="color: #6b7280; font-size: 14px;">Quản lý hình ảnh trình chiếu trên trang chủ</p>
                    </div>
                    <button class="btn-primary" type="button" onclick="openAddModal()">
                        <i class="fa-solid fa-plus"></i> Thêm Banner Mới
                    </button>
                </div>

                <div class="table-responsive">
                    <table class="banner-table">
                        <thead>
                        <tr>
                            <th style="width: 5%;">STT</th>
                            <th style="width: 25%;">Hình ảnh</th>
                            <th style="width: 30%;">Tiêu đề</th>
                            <th style="width: 10%; text-align: center;">Thứ tự</th>
                            <th style="width: 15%; text-align: center;">Trạng thái</th>
                            <th style="width: 15%; text-align: right;">Hành động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${banners}" var="b" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td>
                                    <div class="img-preview-box">
                                        <img src="${ctx}/${b.imageUrl}"
                                             alt="banner"
                                             onerror="this.src='https://placehold.co/120x70?text=No+Image'">
                                    </div>
                                </td>
                                <td style="font-weight: 500;">${b.title}</td>
                                <td style="text-align: center;">
                                    <span style="background: #f3f4f6; padding: 4px 8px; border-radius: 4px; font-weight: 600;">#${b.position}</span>
                                </td>
                                <td style="text-align: center;">
                                    <form action="${ctx}/admin/banner" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="toggle">
                                        <input type="hidden" name="id" value="${b.id}">
                                        <label class="switch">
                                            <input type="checkbox" onchange="this.form.submit()" ${b.status ? 'checked' : ''}>
                                            <span class="slider round"></span>
                                        </label>
                                    </form>
                                </td>
                                <td>
                                    <div class="action-group" style="justify-content: flex-end;">
                                        <button class="btn-action btn-edit" type="button"
                                                onclick="openEditModal('${b.id}', '${b.title}', '${b.position}', '${b.status}', '${ctx}/${b.imageUrl}')">
                                            <i class="fa-solid fa-pen"></i>
                                        </button>

                                        <form action="${ctx}/admin/banner" method="post" onsubmit="return confirm('Bạn có chắc chắn muốn xóa banner này?');" style="margin:0;">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="id" value="${b.id}">
                                            <button class="btn-action btn-delete"><i class="fa-solid fa-trash"></i></button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>

                        <c:if test="${empty banners}">
                            <tr>
                                <td colspan="6" style="text-align: center; padding: 40px; color: #6b7280;">
                                    <i class="fa-solid fa-images" style="font-size: 40px; margin-bottom: 10px; display: block; color: #d1d5db;"></i>
                                    Chưa có banner nào. Hãy thêm mới ngay!
                                </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>

            </div>
        </main>
    </div>
</div>

<div id="bannerModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 id="modalTitle">Thêm Banner Mới</h3>
            <button class="close-btn" onclick="closeModal()">&times;</button>
        </div>

        <div class="modal-body">
            <form action="${ctx}/admin/banner" method="post" enctype="multipart/form-data">
                <input type="hidden" name="action" id="formAction" value="add">
                <input type="hidden" name="id" id="bannerId" value="">

                <div class="form-group">
                    <label>Tiêu đề Banner</label>
                    <input type="text" name="title" id="inpTitle" class="form-control" placeholder="Nhập tiêu đề quảng cáo..." required>
                </div>

                <div class="form-group">
                    <label>Hình ảnh</label>
                    <input type="file" name="imageFile" id="inpFile" class="form-control" accept="image/*" onchange="previewImage(this)">
                    <small id="fileHint" style="display:none; color: #ef4444; margin-top:5px; font-size: 12px;">* Chỉ chọn ảnh mới nếu bạn muốn thay đổi.</small>

                    <div class="image-upload-preview" id="imagePreviewBox">
                        <span class="placeholder-text" id="previewPlaceholder">Chưa chọn ảnh</span>
                        <img id="previewImg" src="" style="display: none;">
                    </div>
                </div>

                <div style="display: flex; gap: 20px;">
                    <div class="form-group" style="flex: 1;">
                        <label>Thứ tự hiển thị</label>
                        <input type="number" name="position" id="inpPos" class="form-control" value="1" min="1">
                    </div>
                    <div class="form-group" style="flex: 1;">
                        <label>Trạng thái</label>
                        <select name="status" id="inpStatus" class="form-control">
                            <option value="true">Hiển thị ngay</option>
                            <option value="false">Tạm ẩn</option>
                        </select>
                    </div>
                </div>

                <button type="submit" class="btn-submit">Lưu Banner</button>
            </form>
        </div>
    </div>
</div>

<script>
    const modal = document.getElementById('bannerModal');
    const modalTitle = document.getElementById('modalTitle');
    const formAction = document.getElementById('formAction');
    const bannerId = document.getElementById('bannerId');
    const inpTitle = document.getElementById('inpTitle');
    const inpPos = document.getElementById('inpPos');
    const inpStatus = document.getElementById('inpStatus');
    const inpFile = document.getElementById('inpFile');
    const fileHint = document.getElementById('fileHint');

    // Elements cho preview ảnh
    const previewBox = document.getElementById('imagePreviewBox');
    const previewImg = document.getElementById('previewImg');
    const previewPlaceholder = document.getElementById('previewPlaceholder');

    function openAddModal() {
        modal.style.display = 'block';
        modalTitle.innerText = "Thêm Banner Mới";
        formAction.value = "add";
        bannerId.value = "";

        // Reset form
        inpTitle.value = "";
        inpPos.value = "1";
        inpStatus.value = "true";
        inpFile.value = "";
        inpFile.required = true;
        fileHint.style.display = "none";

        // Reset preview
        previewImg.src = "";
        previewImg.style.display = "none";
        previewPlaceholder.style.display = "block";
    }

    function openEditModal(id, title, pos, status, currentImageUrl) {
        modal.style.display = 'block';
        modalTitle.innerText = "Cập Nhật Banner";
        formAction.value = "update";
        bannerId.value = id;

        inpTitle.value = title;
        inpPos.value = pos;
        inpStatus.value = status;

        inpFile.value = "";
        inpFile.required = false;
        fileHint.style.display = "block";

        // Hiển thị ảnh hiện tại trong preview
        if(currentImageUrl) {
            previewImg.src = currentImageUrl;
            previewImg.style.display = "block";
            previewPlaceholder.style.display = "none";
        }
    }

    function closeModal() {
        modal.style.display = 'none';
    }

    // Logic xem trước ảnh khi chọn file
    function previewImage(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                previewImg.src = e.target.result;
                previewImg.style.display = "block";
                previewPlaceholder.style.display = "none";
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    // Đóng modal khi click ra ngoài
    window.onclick = function(event) {
        if (event.target == modal) {
            closeModal();
        }
    }
</script>
</body>
</html>
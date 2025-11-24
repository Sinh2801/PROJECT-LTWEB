document.addEventListener('DOMContentLoaded', () => {
    // === 1. LOGIC GALLERY VÀ THUMBNAIL ===
    const mainImage = document.querySelector('.main-image img');
    const thumbnails = document.querySelectorAll('.thumb');

    // Ánh xạ tên Option với src ảnh chính và tên class của Thumbnail
    const optionImageMap = {
        'Magic Time': '../../../Source/Image/Product/Hộp quà tặng/imgset3.webp',
        'Stay Golden': '../../../Source/Image/Product/Hộp quà tặng/imgset.jpg',
        'Wander Flower': '../../../Source/Image/Product/Hộp quà tặng/imgset2.webp',
    };

    // Hàm chung để chuyển đổi ảnh và active thumbnail
    const updateGallery = (imageSrc) => {
        mainImage.src = imageSrc;

        // Xử lý Active cho Thumbnails (đồng bộ với ảnh mới)
        thumbnails.forEach(t => {
            t.classList.remove('active');
            if (t.src.includes(imageSrc.split('/').pop())) {
                t.classList.add('active');
            }
        });
    }

    // Lắng nghe sự kiện click trên thumbnails (Logic cũ)
    thumbnails.forEach(thumb => {
        thumb.addEventListener('click', (e) => {
            const clickedSrc = e.target.src;

            // Loại bỏ active trên tất cả Option khi click vào thumbnail
            optionBtns.forEach(btn => btn.classList.remove('active'));

            // Tìm và đặt active cho Option tương ứng
            const thumbFileName = clickedSrc.split('/').pop();
            for (const [name, src] of Object.entries(optionImageMap)) {
                if (src.includes(thumbFileName)) {
                    document.querySelector(`.option-btn[data-option-name="${name}"]`).classList.add('active');
                    break;
                }
            }

            // Cập nhật Gallery
            updateGallery(clickedSrc);
        });
    });

    // === 2. LOGIC OPTIONS VÀ KẾT NỐI VỚI GALLERY ===
    const optionBtns = document.querySelectorAll('.option-btn');

    // Gán tên tùy chọn vào thuộc tính data-option-name cho HTML (QUAN TRỌNG)
    optionBtns.forEach(btn => {
        const optionName = btn.textContent.trim();
        btn.setAttribute('data-option-name', optionName);
    });

    optionBtns.forEach(btn => {
        btn.addEventListener('click', (e) => {
            const clickedBtn = e.target;
            const optionName = clickedBtn.getAttribute('data-option-name');

            // Xử lý Active cho Option buttons
            optionBtns.forEach(b => b.classList.remove('active'));
            clickedBtn.classList.add('active');

            // Cập nhật Gallery dựa trên Option
            const newImageSrc = optionImageMap[optionName];
            if (newImageSrc) {
                updateGallery(newImageSrc);
            }
        });
    });

    // === 3. LOGIC TĂNG GIẢM SỐ LƯỢNG (Giữ nguyên) ===
    const qtyInput = document.querySelector('.qty-input');
    const minusBtn = document.querySelector('.qty-btn.minus');
    const plusBtn = document.querySelector('.qty-btn.plus');

    if (qtyInput) {
        minusBtn.addEventListener('click', () => {
            let currentQty = parseInt(qtyInput.value);
            if (currentQty > 1) {
                qtyInput.value = currentQty - 1;
            }
        });

        plusBtn.addEventListener('click', () => {
            let currentQty = parseInt(qtyInput.value);
            qtyInput.value = currentQty + 1;
        });
    }
});
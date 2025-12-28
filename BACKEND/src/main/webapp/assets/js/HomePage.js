
// ---------------- Slideshow Banner ---------------- //
document.addEventListener("DOMContentLoaded", () => {
    // 1. Tìm đúng các phần tử trong #headerSlideshow
    const container = document.getElementById("headerSlideshow");
    if (!container) return; // Nếu không tìm thấy banner thì dừng ngay, tránh lỗi

    // Tìm slide và nút bấm BÊN TRONG container đó để tránh nhầm lẫn
    const slides = container.querySelectorAll(".slide");
    const prevBtn = container.querySelector(".prev");
    const nextBtn = container.querySelector(".next");

    // Nếu chỉ có 0 hoặc 1 banner thì không cần chạy slide
    if (slides.length < 2) {
        if(slides.length === 1) slides[0].style.display = "block";
        if(prevBtn) prevBtn.style.display = "none";
        if(nextBtn) nextBtn.style.display = "none";
        return;
    }

    let currentIndex = 0;
    let autoPlayInterval;

    function showSlide(index) {
        slides.forEach((slide, i) => {
            // Dùng inline style để ghi đè CSS .slide:first-child
            slide.style.display = (i === index) ? "block" : "none";
        });
    }

    function nextSlide() {
        currentIndex = (currentIndex + 1) % slides.length;
        showSlide(currentIndex);
    }

    function prevSlide() {
        currentIndex = (currentIndex - 1 + slides.length) % slides.length;
        showSlide(currentIndex);
    }

    function startAutoPlay() {
        // Xóa interval cũ nếu có để tránh chạy chồng chéo
        clearInterval(autoPlayInterval);
        autoPlayInterval = setInterval(nextSlide, 3000); // 3 giây chuyển 1 lần
    }

    function stopAutoPlay() {
        clearInterval(autoPlayInterval);
    }

    // Gắn sự kiện (Kiểm tra tồn tại trước khi gắn)
    if(nextBtn) nextBtn.addEventListener("click", () => {
        nextSlide();
        startAutoPlay(); // Reset lại timer khi bấm thủ công
    });

    if(prevBtn) prevBtn.addEventListener("click", () => {
        prevSlide();
        startAutoPlay();
    });

    container.addEventListener("mouseenter", stopAutoPlay);
    container.addEventListener("mouseleave", startAutoPlay);

    // Bắt đầu
    showSlide(currentIndex);
    startAutoPlay();
});
// ---------------- Nút "Xem thêm" Chuyển Hướng ---------------- //
document.addEventListener("DOMContentLoaded", () => {
    const seeMoreBtns = document.querySelectorAll('.see-more-btn');
    seeMoreBtns.forEach(button => {
        button.addEventListener('click', function() {
            window.location.href = 'ProductT.html';
        });
    });
});
/*Slip action*/
document.addEventListener("DOMContentLoaded", () => {
    const slider = document.querySelector("#slider");
    const cards = slider.querySelectorAll(".product-card");
    const nextBtn = document.getElementById("nextBtn");
    const prevBtn = document.getElementById("prevBtn");

    let index = 0;
    let autoSlide;

    // Tính kích thước 1 thẻ + khoảng cách
    function getStep() {
        const cardWidth = cards[0].offsetWidth;
        const gap = parseFloat(getComputedStyle(slider).gap) || 16;
        return cardWidth + gap;
    }

    function visibleCount() {
        const wrapperWidth = document.querySelector(".product-slider-wrapper").offsetWidth;
        const step = getStep();
        return Math.max(1, Math.floor(wrapperWidth / step));
    }

    function maxIndex() {
        return Math.max(0, cards.length - visibleCount());
    }

    function updateSlide() {
        slider.style.transform = `translateX(-${index * getStep()}px)`;
    }

    nextBtn.addEventListener("click", () => {
        index = (index + 1) % cards.length; // quay lại đầu nếu hết
        updateSlide();
        resetAutoSlide();
    });

    prevBtn.addEventListener("click", () => {
        index = (index - 1 + cards.length) % cards.length; // quay lại cuối nếu lùi quá
        updateSlide();
        resetAutoSlide();
    });

    function startAutoSlide() {
        autoSlide = setInterval(() => {
            index = (index + 1) % cards.length;
            updateSlide();
        }, 3000);
    }

    function resetAutoSlide() {
        clearInterval(autoSlide);
        startAutoSlide();
    }

    window.addEventListener("resize", updateSlide);

    updateSlide();
    startAutoSlide();
});


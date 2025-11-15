
// ---------------- Slideshow Banner ---------------- //
document.addEventListener("DOMContentLoaded", () => {
    const slides = document.querySelectorAll(".slide");
    const dots = document.querySelectorAll(".dot");
    const prevBtn = document.querySelector(".prev");
    const nextBtn = document.querySelector(".next");
    const slideshow = document.getElementById("headerSlideshow");

    let currentIndex = 0;
    let autoPlayInterval;

    // Hiển thị slide hiện tại
    function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.style.display = (i === index) ? "block" : "none";
        });
        dots.forEach((dot, i) => {
            dot.classList.toggle("active", i === index);
        });
    }

    // Chuyển slide
    function nextSlide() {
        currentIndex = (currentIndex + 1) % slides.length;
        showSlide(currentIndex);
    }

    function prevSlide() {
        currentIndex = (currentIndex - 1 + slides.length) % slides.length;
        showSlide(currentIndex);
    }

    // Tự động chạy
    function startAutoPlay() {
        autoPlayInterval = setInterval(nextSlide, 3000);
    }

    function stopAutoPlay() {
        clearInterval(autoPlayInterval);
    }

    // Gán sự kiện
    nextBtn.addEventListener("click", nextSlide);
    prevBtn.addEventListener("click", prevSlide);

    dots.forEach((dot, index) => {
        dot.addEventListener("click", () => {
            currentIndex = index;
            showSlide(currentIndex);
        });
    });

    slideshow.addEventListener("mouseenter", stopAutoPlay);
    slideshow.addEventListener("mouseleave", startAutoPlay);

    // Khởi tạo
    showSlide(currentIndex);
    startAutoPlay();
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


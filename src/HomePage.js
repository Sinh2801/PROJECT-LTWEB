/*event list header*/
document.addEventListener("DOMContentLoaded", function() {
    const toggleButton = document.querySelector('.menu-toggle');
    const dropdownMenu = document.querySelector('.dropdown-menu');

    console.log('toggleButton:', toggleButton);
    console.log('dropdownMenu:', dropdownMenu);

    toggleButton.addEventListener('click', (e) => {
        e.stopPropagation();
        dropdownMenu.classList.toggle('active');
    });

    document.addEventListener('click', (e) => {
        if (!dropdownMenu.contains(e.target) && !toggleButton.contains(e.target)) {
            dropdownMenu.classList.remove('active');
        }
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


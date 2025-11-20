/* ===== MENU TOGGLE (click) & OVERLAY ===== */
const menuBtn = document.getElementById('menuBtn');
const dropdownMenu = document.getElementById('dropdownMenu');
const headerOverlay = document.getElementById('headerOverlay');

// mở/đóng menu khi nhấn nút
menuBtn?.addEventListener('click', (e) => { e.stopPropagation();
    const isOpen = dropdownMenu.classList.toggle('open');
    if (isOpen) {
        headerOverlay.classList.add('show');
        dropdownMenu.setAttribute('aria-hidden', 'false');
    } else {
        headerOverlay.classList.remove('show');
        dropdownMenu.setAttribute('aria-hidden', 'true');
    }
});

// đóng menu khi click overlay (ngoài vùng menu)
headerOverlay?.addEventListener('click', () => {
    dropdownMenu.classList.remove('open');
    headerOverlay.classList.remove('show');
    dropdownMenu.setAttribute('aria-hidden', 'true');
});

// đóng menu khi click vào 1 link bên trong menu và cuộn mượt tới section
document.querySelectorAll('.dropdown-menu a').forEach(link => {
    link.addEventListener('click', (e) => {
        // nếu là anchor tới section trong trang
        const href = link.getAttribute('href');
        if (href && href.startsWith('#')) {
            e.preventDefault();
            const target = document.querySelector(href);
            if (target) target.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
        // đóng menu
        dropdownMenu.classList.remove('open');
        headerOverlay.classList.remove('show');
        dropdownMenu.setAttribute('aria-hidden', 'true');
    });
});

// đóng menu khi click bất kỳ ở ngoài (document), nhưng tránh khi click vào menuBtn/dropdown
document.addEventListener('click', (e) => {
    if (!dropdownMenu.contains(e.target) && !menuBtn.contains(e.target)) {
        dropdownMenu.classList.remove('open');
        headerOverlay.classList.remove('show');
        dropdownMenu.setAttribute('aria-hidden', 'true');
    }
});
/* ===== MENU BAR ===== */
document.querySelectorAll('.menu-link').forEach(link => {
    link.addEventListener('click', function (e) {
        e.preventDefault();
        const id = this.getAttribute('href');
        document.querySelector(id).scrollIntoView({
            behavior: "smooth"
        });
    });
});





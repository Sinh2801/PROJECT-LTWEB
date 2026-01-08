document.addEventListener("DOMContentLoaded", function () {
    const menuBtn = document.getElementById('menuBtn');
    const dropdownMenu = document.getElementById('dropdownMenu');
    const searchInput = document.getElementById('search');
    const searchDropdown = document.getElementById('searchDropdown');
    const overlay = document.getElementById('headerOverlay');
    const searchWrapper = document.querySelector('.search-wrapper');

    function showOverlay() {
        overlay.classList.add('active');
    }

    function hideOverlayIfNeeded() {
        if (
            !dropdownMenu.classList.contains('open') &&
            searchDropdown.style.display !== 'block'
        ) {
            overlay.classList.remove('active');
        }
    }

    /* ===== SEARCH ===== */
    function openSearch() {
        searchDropdown.style.display = 'block';
        searchWrapper.classList.add('active-search');
        showOverlay();
    }

    function closeSearch() {
        searchDropdown.style.display = 'none';
        searchWrapper.classList.remove('active-search');
        searchInput.style.borderRadius = "20px";
        searchInput.style.borderBottom = "2px solid purple";
    }

    searchInput.addEventListener('focus', openSearch);

    searchWrapper.addEventListener('click', function (e) {
        e.stopPropagation();
        openSearch();
    });

    /* ===== MENU ===== */
    menuBtn.addEventListener('click', function (e) {
        e.stopPropagation();
        dropdownMenu.classList.toggle('open');
        showOverlay();
    });

    /* ===== OVERLAY CLICK ===== */
    overlay.addEventListener('click', function () {
        dropdownMenu.classList.remove('open');
        closeSearch();
        overlay.classList.remove('active');
    });

    /* ===== CLICK OUTSIDE HEADER ===== */
    document.addEventListener('click', function () {
        dropdownMenu.classList.remove('open');
        closeSearch();
        hideOverlayIfNeeded();
    });
});

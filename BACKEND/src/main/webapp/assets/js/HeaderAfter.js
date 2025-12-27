const userTrigger = document.querySelector(".user-trigger");
const userDropdown = document.querySelector(".user-dropdown");

userTrigger.addEventListener("click", () => {
    userDropdown.style.display =
        userDropdown.style.display === "block" ? "none" : "block";
});

/* Click ra ngoài để đóng */
document.addEventListener("click", (e) => {
    if (!document.querySelector(".user-menu").contains(e.target)) {
        userDropdown.style.display = "none";
    }
});

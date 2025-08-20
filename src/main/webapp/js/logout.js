// /js/logout.js
document.addEventListener('DOMContentLoaded', () => {
    const logoutButton = document.querySelector('.btn-logout');

    if (logoutButton) {
        logoutButton.addEventListener('click', () => {
            window.location.href = '/logout';
        });
    }
});
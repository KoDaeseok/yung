// webapp/static/js/main.js
document.addEventListener('DOMContentLoaded', () => {
    const tocLinks = document.querySelectorAll('.right-toc-sidebar a');
    const sections = document.querySelectorAll('.page-content section');

    // 부드러운 스크롤 기능
    tocLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            const targetSection = document.querySelector(targetId);
            if (targetSection) {
                targetSection.scrollIntoView({ behavior: 'smooth' });
            }
        });
    });

    // 스크롤 위치에 따라 목차 활성화 (Scrollspy)
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                tocLinks.forEach(link => {
                    const correspondingLink = link.getAttribute('href') === `#${entry.target.id}`;
                    if (correspondingLink) {
                        link.parentElement.classList.add('active');
                    } else {
                        link.parentElement.classList.remove('active');
                    }
                });
            }
        });
    }, { rootMargin: '-40% 0px -60% 0px' }); // 화면 중앙에 올 때 활성화

    sections.forEach(section => {
        observer.observe(section);
    });
});
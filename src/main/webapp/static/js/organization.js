// static/js/organization.js
document.addEventListener('DOMContentLoaded', () => {
    const tocLinks = document.querySelectorAll('.right-toc-sidebar a');
    const sections = document.querySelectorAll('.page-content section');

    // 페이지에 목차 요소가 없으면 실행하지 않음
    if (tocLinks.length === 0 || sections.length === 0) return;

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
                    link.parentElement.classList.toggle('active', correspondingLink);
                });
            }
        });
    }, { rootMargin: '-40% 0px -60% 0px' });

    sections.forEach(section => {
        observer.observe(section);
    });
});
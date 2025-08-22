// js/signup.js
document.addEventListener('DOMContentLoaded', () => {
    // --- 기관 검색 팝업 관련 코드 (기존과 동일) ---
    const openModalBtn = document.getElementById('open-org-search-btn');
    const modal = document.getElementById('org-search-modal');
    if (openModalBtn && modal) {
        const closeModalBtn = modal.querySelector('.modal-close-btn');
        const orgCodeInput = document.getElementById('org-code');
        const orgNameInput = document.getElementById('org-name');
        const tableBody = modal.querySelector('.results-table tbody');
        const paginationContainer = modal.querySelector('.pagination');
        const itemCounter = modal.querySelector('.item-counter');
        const searchInput = modal.querySelector('.search-bar input');
        const searchButton = modal.querySelector('.btn-search-action');

        const allData = [
            { code: "A001", type: "국내증권사", name: "(구)NH투자증권" },
            { code: "B002", type: "금융기타(증금등)", name: "(주)생보제일호위탁관리부동산투자회사" },
            { code: "C003", type: "기타기관", name: "(주)케이리얼티제6호위탁관리부동산투자회사" },
            { code: "D004", type: "국내은행", name: "HSBC은행" },
            { code: "E005", type: "국내운용사", name: "IMM PE" },
            { code: "F006", type: "국내증권사", name: "KB증권(주)" },
            { code: "G007", type: "국내은행", name: "KEB하나은행" },
            { code: "H008", type: "국내운용사", name: "LB자산운용" },
            { code: "I009", type: "국내증권사", name: "NH투자증권 결제업무부" },
            { code: "J010", type: "국내은행", name: "경남은행" },
            { code: "K011", type: "국내증권사", name: "골드만삭스증권" },
            { code: "L012", type: "국내운용사", name: "대신자산운용" },
            { code: "M013", type: "국내증권사", name: "메리츠증권" },
            { code: "N014", type: "국내은행", name: "부산은행" },
            { code: "O015", type: "국내운용사", name: "삼성SRA자산운용" },
            { code: "P016", type: "기타기관", name: "서울보증보험" },
            { code: "Q017", type: "국내증권사", name: "신영증권" },
            { code: "R018", type: "국내운용사", name: "이지스자산운용" },
            { code: "S019", type: "국내은행", name: "전북은행" },
            { code: "T020", type: "국내증권사", name: "카카오페이증권" },
            { code: "U021", type: "국내운용사", name: "코람코자산운용" },
            { code: "V022", type: "기타기관", name: "하나대체투자자산운용" },
            { code: "W023", type: "국내증권사", name: "하이투자증권" },
            { code: "X024", type: "국내은행", name: "한국산업은행" },
            { code: "Y025", type: "국내운용사", name: "한화자산운용" },
            { code: "Z026", type: "기타기관", name: "흥국생명보험" },
            { code: "A027", type: "국내증권사", name: "현대차증권" },
            { code: "B028", type: "국내은행", name: "BNK부산은행" },
            { code: "C029", type: "국내운용사", name: "CBRE자산운용" },
            { code: "D030", type: "국내증권사", name: "DB금융투자" },
            { code: "E031", type: "국내은행", name: "DGB대구은행" },
            { code: "F032", type: "국내운용사", name: "FG자산운용" },
            { code: "G033", type: "국내증권사", name: "IBK투자증권" },
            { code: "H034", type: "국내은행", name: "JB전북은행" },
            { code: "I035", type: "국내운용사", name: "JR투자운용" },
            { code: "J036", type: "국내증권사", name: "KB증권" },
            { code: "K037", type: "국내은행", name: "KDB산업은행" },
            { code: "L038", type: "국내운용사", name: "KOREIT" },
            { code: "M039", type: "국내증권사", name: "KTB투자증권" },
            { code: "N040", type: "국내은행", name: "SC제일은행" },
            { code: "O041", type: "국내운용사", name: "YNP자산운용" },
            { code: "P042", type: "기타기관", name: "교보생명" },
            { code: "Q043", type: "국내증권사", name: "대신증권" },
            { code: "R044", type: "국내은행", name: "신한은행" },
            { code: "S045", type: "국내운용사", name: "우리자산운용" },
            { code: "T046", type: "기타기관", name: "우체국" },
            { code: "U047", type: "국내증권사", name: "유안타증권" },
            { code: "V048", type: "국내은행", name: "제주은행" },
            { code: "W049", type: "국내운용사", name: "칸서스자산운용" },
            { code: "X050", type: "기타기관", name: "하나생명" },
            { code: "Y051", type: "국내증권사", name: "한국투자증권" },
            { code: "Z052", type: "국내은행", name: "우리은행" }
        ];
        let currentData = [...allData];
        let currentPage = 1;
        const itemsPerPage = 15;

        const render = (page) => {
            currentPage = page;
            const totalItems = currentData.length;
            const totalPages = Math.ceil(totalItems / itemsPerPage);
            tableBody.innerHTML = '';
            const start = (page - 1) * itemsPerPage;
            const end = start + itemsPerPage;
            const paginatedItems = currentData.slice(start, end);

            if (paginatedItems.length === 0) {
                tableBody.innerHTML = '<tr><td colspan="2">검색 결과가 없습니다.</td></tr>';
            } else {
                paginatedItems.forEach(item => {
                    const row = document.createElement('tr');
                    row.setAttribute('data-code', item.code);
                    row.setAttribute('data-name', item.name);
                    row.innerHTML = `<td>${item.type}</td><td>${item.name}</td>`;
                    tableBody.appendChild(row);
                });
            }
            updatePagination(totalPages);
            updateItemCounter(start, end, totalItems);
            addRowClickListeners();
        };
        const updatePagination = (totalPages) => {
            paginationContainer.innerHTML = '';
            if (totalPages === 0) return;

            const maxPagesToShow = 5;
            let startPage = Math.floor((currentPage - 1) / maxPagesToShow) * maxPagesToShow + 1;
            let endPage = startPage + maxPagesToShow - 1;
            if (endPage > totalPages) endPage = totalPages;

            paginationContainer.innerHTML += `<a href="#" class="arrow" data-page="1"><i class="fa-solid fa-angles-left"></i></a>`;
            paginationContainer.innerHTML += `<a href="#" class="arrow" data-page="${currentPage - 1}"><i class="fa-solid fa-angle-left"></i></a>`;
            for (let i = startPage; i <= endPage; i++) {
                paginationContainer.innerHTML += `<a href="#" class="${i === currentPage ? 'active' : ''}" data-page="${i}">${i}</a>`;
            }
            paginationContainer.innerHTML += `<a href="#" class="arrow" data-page="${currentPage + 1}"><i class="fa-solid fa-angle-right"></i></a>`;
            paginationContainer.innerHTML += `<a href="#" class="arrow" data-page="${totalPages}"><i class="fa-solid fa-angles-right"></i></a>`;

            if (currentPage === 1) {
                paginationContainer.querySelector('[data-page="1"]').classList.add('disabled');
                paginationContainer.querySelector(`[data-page="${currentPage - 1}"]`).classList.add('disabled');
            }
            if (currentPage === totalPages) {
                paginationContainer.querySelector(`[data-page="${currentPage + 1}"]`).classList.add('disabled');
                paginationContainer.querySelector(`[data-page="${totalPages}"]`).classList.add('disabled');
            }
        };
        const updateItemCounter = (start, end, totalItems) => {
            if (totalItems === 0) {
                itemCounter.textContent = '0 - 0 of 0';
                return;
            }
            const endItem = Math.min(end, totalItems);
            itemCounter.textContent = `${start + 1} - ${endItem} of ${totalItems}`;
        };

        openModalBtn.addEventListener('click', () => {
            searchInput.value = '';
            currentData = [...allData];
            render(1);
            modal.style.display = 'flex';
        });

        closeModalBtn.addEventListener('click', () => modal.style.display = 'none');
        modal.addEventListener('click', (e) => {
            if (e.target === modal) modal.style.display = 'none';
        });

        paginationContainer.addEventListener('click', (e) => {
            e.preventDefault();
            const target = e.target.closest('a');
            if (target && !target.classList.contains('disabled')) {
                const page = parseInt(target.getAttribute('data-page'));
                if (page) render(page);
            }
        });

        const addRowClickListeners = () => {
            tableBody.querySelectorAll('tr').forEach(row => {
                row.addEventListener('click', () => {
                    orgCodeInput.value = row.getAttribute('data-code');
                    orgNameInput.value = row.getAttribute('data-name');
                    const errorDiv = document.querySelector('.error-message[data-for="org-code"]');
                    if (errorDiv) errorDiv.textContent = '';
                    orgCodeInput.classList.remove('error');
                    orgNameInput.classList.remove('error');
                    modal.style.display = 'none';
                });
            });
        };

        const performSearch = () => {
            const searchTerm = searchInput.value.toLowerCase();
            currentData = allData.filter(item => item.name.toLowerCase().includes(searchTerm));
            render(1);
        };

        searchButton.addEventListener('click', performSearch);
        searchInput.addEventListener('keyup', (e) => {
            if (e.key === 'Enter') {
                performSearch();
            }
        });
    }

    // --- 회원가입 폼 유효성 검사 로직 ---
    const signupForm = document.getElementById('signup-form');
    if (signupForm) {
        const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

        const validatePassword = (password) => {
            if (password.length < 9) return '비밀번호는 최소 9자 이상이어야 합니다.';
            const hasLetter = /[a-zA-Z]/.test(password);
            const hasNumber = /\d/.test(password);
            const hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(password);
            if (!hasLetter || !hasNumber || !hasSpecial) return '비밀번호는 영문자, 숫자, 특수문자를 모두 포함해야 합니다.';
            if (/(.)\1\1/.test(password)) return '동일한 문자를 3번 이상 반복할 수 없습니다.';
            for (let i = 0; i < password.length - 2; i++) {
                const char1 = password.charCodeAt(i);
                const char2 = password.charCodeAt(i + 1);
                const char3 = password.charCodeAt(i + 2);
                if (char1 + 1 === char2 && char2 + 1 === char3) return '연속된 문자열(예: abc, 123)은 사용할 수 없습니다.';
                if (char1 - 1 === char2 && char2 - 1 === char3) return '연속된 문자열(예: cba, 321)은 사용할 수 없습니다.';
            }
            return null;
        };

        const clearError = (input) => {
            const errorDiv = document.querySelector(`.error-message[data-for="${input.id.replace(/\d/g, '')}"]`);
            input.classList.remove('error');
            if (errorDiv) errorDiv.textContent = '';
        };

        signupForm.querySelectorAll('input, select').forEach(input => {
            const eventType = input.tagName === 'SELECT' ? 'change' : 'input';
            input.addEventListener(eventType, () => clearError(input));
        });

        signupForm.addEventListener('submit', (e) => {
            e.preventDefault();

            let isValid = true;

            // 모든 에러 메시지 초기화
            document.querySelectorAll('.error-message').forEach(el => el.textContent = '');
            document.querySelectorAll('.signup-table input, .signup-table select').forEach(el => el.classList.remove('error'));

            // 필드 유효성 검사 (헬퍼 함수)
            const checkField = (id, message, groupFor = null) => {
                const input = document.getElementById(id);
                if (input.value.trim() === '') {
                    const errorDiv = document.querySelector(`.error-message[data-for="${groupFor || id}"]`);
                    if (errorDiv && !errorDiv.textContent) errorDiv.textContent = message; // 에러 메시지가 없을 때만 표시
                    input.classList.add('error');
                    isValid = false;
                }
            };

            checkField('org-code', '소속기관을 검색해주세요.');
            checkField('user-id', '아이디를 입력해주세요.');
            checkField('user-name', '이름을 입력해주세요.');
            checkField('department', '소속부서를 입력해주세요.');
            checkField('support-team', '공제회담당팀을 선택해주세요.');

            const emailIdInput = document.getElementById('email-id');
            const emailDomainInput = document.getElementById('email-domain');
            const emailErrorDiv = document.querySelector('.error-message[data-for="email-id"]');
            if (emailIdInput.value.trim() === '' || emailDomainInput.value.trim() === '') {
                emailErrorDiv.textContent = '이메일을 모두 입력해주세요.';
                emailIdInput.classList.add('error');
                emailDomainInput.classList.add('error');
                isValid = false;
            } else if (!emailRegex.test(emailIdInput.value.trim() + '@' + emailDomainInput.value.trim())) {
                emailErrorDiv.textContent = '유효한 이메일 형식이 아닙니다.';
                emailIdInput.classList.add('error');
                emailDomainInput.classList.add('error');
                isValid = false;
            }

            // [수정] 회사번호 검사 로직
            checkField('company-phone2', '회사번호를 모두 입력해주세요.', 'company-phone1');
            checkField('company-phone3', '회사번호를 모두 입력해주세요.', 'company-phone1');

            // [수정] 비밀번호 검사 로직
            const passwordInput = document.getElementById('password');
            const passwordErrorDiv = document.querySelector('.error-message[data-for="password"]');
            if (passwordInput.value.trim() === '') {
                passwordErrorDiv.textContent = '비밀번호를 입력해주세요.';
                passwordInput.classList.add('error');
                isValid = false;
            } else {
                const passwordValidationResult = validatePassword(passwordInput.value);
                if (passwordValidationResult) {
                    passwordErrorDiv.textContent = passwordValidationResult;
                    passwordInput.classList.add('error');
                    isValid = false;
                }
            }

            const passwordConfirmInput = document.getElementById('password-confirm');
            const passwordConfirmErrorDiv = document.querySelector('.error-message[data-for="password-confirm"]');
            if (passwordConfirmInput.value.trim() === '') {
                passwordConfirmErrorDiv.textContent = '비밀번호 확인을 입력해주세요.';
                passwordConfirmInput.classList.add('error');
                isValid = false;
            } else if (passwordInput.value !== passwordConfirmInput.value) {
                passwordConfirmErrorDiv.textContent = '비밀번호가 일치하지 않습니다.';
                passwordConfirmInput.classList.add('error');
                isValid = false;
            }

            if (isValid) {
                alert('회원가입 성공!');
            }
        });
    }
});
// Menu Interface JavaScript Module
class MenuInterface {
    constructor() {
        this.form = document.getElementById("menuForm");
        this.dateInput = document.getElementById("Date");
        this.mealTypeInput = document.getElementById("MealType");
        this.breakfastBtn = document.getElementById("breakfastBtn");
        this.dinnerBtn = document.getElementById("dinnerBtn");
        this.formContainer = document.getElementById('menuForm');
        
        this.breakfastType = "Breakfast";
        this.dinnerType = "Dinner";
        this.isDragging = false;
        
        this.init();
    }

    init() {
        this.setupDateNavigation();
        this.setupDateStrip();
        this.setupMealTypeButtons();
        this.setupCityChange();
        this.updateButtonStyles();
        this.scrollToSelectedDate();
        this.setupKeyboardNavigation();
        this.setupSwipeGestures();
        this.setupLoadingStates();
    }

    scrollToSelectedDate() {
        const selectedDateElement = document.querySelector('.date-strip-item.selected');
        if (selectedDateElement) {
            selectedDateElement.scrollIntoView({ 
                behavior: 'smooth', 
                inline: 'center', 
                block: 'nearest' 
            });
        }
    }

    submitWithDate(newDateStr) {
        const newDate = new Date(newDateStr);
        const today = new Date();
        
        newDate.setHours(0, 0, 0, 0);
        today.setHours(0, 0, 0, 0);

        if (newDate > today) {
            this.showToast('Gelecekteki tarihler seçilemez', 'warning');
            return;
        }

        this.showLoadingState();
        this.dateInput.value = newDateStr;
        this.form.submit();
    }

    setupDateNavigation() {
        document.getElementById('prevDateBtn').addEventListener('click', () => {
            const currentDate = new Date(this.dateInput.value);
            currentDate.setDate(currentDate.getDate() - 1);
            this.submitWithDate(currentDate.toISOString().split('T')[0]);
        });

        document.getElementById('nextDateBtn').addEventListener('click', () => {
            const currentDate = new Date(this.dateInput.value);
            currentDate.setDate(currentDate.getDate() + 1);
            this.submitWithDate(currentDate.toISOString().split('T')[0]);
        });
    }

    setupDateStrip() {
        const dateStrip = document.querySelector('.hide-scrollbar');
        if (!dateStrip) return;

        let isDown = false;
        let startX;
        let scrollLeft;
        
        // Mouse events
        dateStrip.addEventListener('mousedown', (e) => {
            isDown = true;
            this.isDragging = false;
            startX = e.pageX - dateStrip.offsetLeft;
            scrollLeft = dateStrip.scrollLeft;
            dateStrip.style.cursor = 'grabbing';
        });
        
        dateStrip.addEventListener('mousemove', (e) => {
            if (!isDown) return;
            e.preventDefault();
            this.isDragging = true;
            const x = e.pageX - dateStrip.offsetLeft;
            const walk = (x - startX) * 2;
            dateStrip.scrollLeft = scrollLeft - walk;
        });
        
        window.addEventListener('mouseup', () => {
            isDown = false;
            dateStrip.style.cursor = 'grab';
            // Reset dragging state after a short delay
            setTimeout(() => { this.isDragging = false; }, 100);
        });
        
        // Date strip item clicks
        document.querySelectorAll('.date-strip-item').forEach(button => {
            button.addEventListener('click', (e) => {
                if (this.isDragging) {
                    e.preventDefault();
                    return;
                }
                this.submitWithDate(button.dataset.date);
            });
        });
    }

    setupMealTypeButtons() {
        [this.breakfastBtn, this.dinnerBtn].forEach(button => {
            button.addEventListener('click', () => {
                this.mealTypeInput.value = button.dataset.mealType;
                this.updateButtonStyles();
                this.showLoadingState();
                this.form.submit();
            });
        });
    }

    setupCityChange() {
        const citySelect = document.getElementById('CityId');
        if (citySelect) {
            citySelect.addEventListener('change', () => {
                this.showLoadingState();
                this.form.submit();
            });
        }
    }

    updateButtonStyles() {
        const currentMealType = this.mealTypeInput.value;
        this.formContainer.dataset.mealTheme = currentMealType === this.breakfastType ? 'morning' : 'evening';
        
        [this.breakfastBtn, this.dinnerBtn].forEach(btn => {
            btn.classList.remove('btn-primary', 'btn-outline');
            if (btn.dataset.mealType === currentMealType) {
                btn.classList.add('btn-primary');
            } else {
                btn.classList.add('btn-outline');
            }
        });
    }

    setupKeyboardNavigation() {
        document.addEventListener('keydown', (e) => {
            if (e.ctrlKey || e.metaKey) return;
            
            switch(e.key) {
                case 'ArrowLeft':
                    e.preventDefault();
                    document.getElementById('prevDateBtn').click();
                    break;
                case 'ArrowRight':
                    e.preventDefault();
                    document.getElementById('nextDateBtn').click();
                    break;
                case '1':
                    e.preventDefault();
                    this.breakfastBtn.click();
                    break;
                case '2':
                    e.preventDefault();
                    this.dinnerBtn.click();
                    break;
            }
        });
    }

    setupSwipeGestures() {
        let startX = null;
        let startY = null;

        document.addEventListener('touchstart', (e) => {
            startX = e.touches[0].clientX;
            startY = e.touches[0].clientY;
        });

        document.addEventListener('touchend', (e) => {
            if (!startX || !startY) return;

            const endX = e.changedTouches[0].clientX;
            const endY = e.changedTouches[0].clientY;
            const diffX = startX - endX;
            const diffY = startY - endY;

            // Check if horizontal swipe is more significant than vertical
            if (Math.abs(diffX) > Math.abs(diffY) && Math.abs(diffX) > 50) {
                if (diffX > 0) {
                    // Swipe left - next date
                    document.getElementById('nextDateBtn').click();
                } else {
                    // Swipe right - previous date
                    document.getElementById('prevDateBtn').click();
                }
            }

            startX = null;
            startY = null;
        });
    }

    setupLoadingStates() {
        const form = document.getElementById('menuForm');
        const submitBtns = form.querySelectorAll('button[type="button"]');
        
        submitBtns.forEach(btn => {
            btn.disabled = true;
            const icon = btn.querySelector('i');
            if (icon && !icon.classList.contains('fa-spin')) {
                icon.dataset.originalClass = icon.className;
                icon.className = 'fas fa-spinner fa-spin';
            }
        });

        // Show loading overlay
        this.showLoadingOverlay();
    }

    showLoadingOverlay() {
        const existing = document.getElementById('loadingOverlay');
        if (existing) return;

        const overlay = document.createElement('div');
        overlay.id = 'loadingOverlay';
        overlay.className = 'fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 loading-overlay';
        overlay.innerHTML = `
            <div class="bg-white dark:bg-gray-800 rounded-lg p-6 flex items-center space-x-3">
                <div class="animate-spin rounded-full h-6 w-6 border-b-2 border-blue-600"></div>
                <span class="text-gray-700 dark:text-gray-300">Menü yükleniyor...</span>
            </div>
        `;
        document.body.appendChild(overlay);
    }

    showToast(message, type = 'info') {
        const toast = document.createElement('div');
        const toastId = 'toast-' + Date.now();
        toast.id = toastId;
        toast.className = `toast fixed top-4 right-4 p-4 rounded-lg text-white z-50 transform transition-all duration-300 translate-x-full`;
        
        const bgColor = {
            'success': 'bg-green-500',
            'error': 'bg-red-500',
            'warning': 'bg-yellow-500',
            'info': 'bg-blue-500'
        }[type] || 'bg-blue-500';
        
        const icon = {
            'success': 'fas fa-check-circle',
            'error': 'fas fa-exclamation-circle',
            'warning': 'fas fa-exclamation-triangle',
            'info': 'fas fa-info-circle'
        }[type] || 'fas fa-info-circle';
        
        toast.classList.add(bgColor);
        toast.innerHTML = `
            <div class="flex items-center space-x-2">
                <i class="${icon}"></i>
                <span>${message}</span>
                <button onclick="document.getElementById('${toastId}').remove()" class="ml-2 text-white hover:opacity-75">
                    <i class="fas fa-times"></i>
                </button>
            </div>
        `;
        
        document.body.appendChild(toast);
        
        // Animate in
        setTimeout(() => {
            toast.classList.remove('translate-x-full');
        }, 100);
        
        // Remove after 4 seconds
        setTimeout(() => {
            if (toast.parentNode) {
                toast.classList.add('translate-x-full');
                setTimeout(() => {
                    if (toast.parentNode) {
                        toast.remove();
                    }
                }, 300);
            }
        }, 4000);
    }
}

// Initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    new MenuInterface();
});

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
                this.form.submit();
            });
        });
    }

    setupCityChange() {
        const citySelect = document.getElementById('CityId');
        if (citySelect) {
            citySelect.addEventListener('change', () => {
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
}

// Initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    new MenuInterface();
});

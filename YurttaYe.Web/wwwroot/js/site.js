// Please see documentation at https://learn.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

document.addEventListener('DOMContentLoaded', function () {
    const menuForm = document.getElementById('menuForm');
    const dateInput = document.getElementById('Date');
    const mealTypeInput = document.getElementById('MealType');
    const breakfastBtn = document.getElementById('breakfastBtn');
    const dinnerBtn = document.getElementById('dinnerBtn');
    const prevDateBtn = document.getElementById('prevDateBtn');
    const nextDateBtn = document.getElementById('nextDateBtn');
    const citySelect = document.getElementById('CityId');

    function submitForm() {
        if (menuForm) {
            menuForm.submit();
        }
    }

    // Date navigation - MOVED TO menu-interface.js
    /*
    if (prevDateBtn) {
        prevDateBtn.addEventListener('click', function () {
            const currentDate = new Date(dateInput.value);
            currentDate.setDate(currentDate.getDate() - 1);
            dateInput.value = currentDate.toISOString().split('T')[0];
            submitForm();
        });
    }

    if (nextDateBtn) {
        nextDateBtn.addEventListener('click', function () {
            const currentDate = new Date(dateInput.value);
            currentDate.setDate(currentDate.getDate() + 1);
            dateInput.value = currentDate.toISOString().split('T')[0];
            submitForm();
        });
    }
    
    // Date strip selection
    const dateStripItems = document.querySelectorAll('.date-strip-item');
    dateStripItems.forEach(item => {
        item.addEventListener('click', function() {
            dateInput.value = this.dataset.date;
            submitForm();
        });
    });

    // Meal type selection
    function updateMealButtons() {
        const mealType = mealTypeInput.value;
        if (mealType === 'Kahvaltı') {
            breakfastBtn.classList.add('active');
            dinnerBtn.classList.remove('active');
        } else {
            dinnerBtn.classList.add('active');
            breakfastBtn.classList.remove('active');
        }
    }

    if (breakfastBtn) {
        breakfastBtn.addEventListener('click', function () {
            mealTypeInput.value = 'Kahvaltı';
            updateMealButtons();
            submitForm();
        });
    }

    if (dinnerBtn) {
        dinnerBtn.addEventListener('click', function () {
            mealTypeInput.value = 'Akşam Yemeği';
            updateMealButtons();
            submitForm();
        });
    }
    
    if (citySelect) {
        citySelect.addEventListener('change', function() {
            submitForm();
        });
    }

    // Set initial state for meal buttons
    if (mealTypeInput) {
        updateMealButtons();
    }
    
    // Dynamic theme for meal type
    if (menuForm) {
        const mealType = mealTypeInput.value;
        const body = document.body;
        if (mealType === 'Kahvaltı') {
            body.classList.remove('theme-evening');
            body.classList.add('theme-morning');
        } else {
            body.classList.remove('theme-morning');
            body.classList.add('theme-evening');
        }
    }
    */
});

const rangeSlider = document.getElementById("rs-range-line");
const rangeBullet = document.getElementById("rs-bullet");

if (rangeSlider) {
  rangeSlider.addEventListener("input", showSliderValue, false);
}

function showSliderValue() {
  if (rangeBullet) {
    rangeBullet.innerHTML = rangeSlider.value / 2;
    const bulletPosition = (rangeSlider.value / rangeSlider.max);
    rangeBullet.style.left = (bulletPosition * 100) + "%";
  }
}

export { showSliderValue };

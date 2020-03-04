const selectCheckbox = () => {

  const checkboxes = document.querySelectorAll(".icon-border")
  checkboxes.forEach((checkbox) => {
    checkbox.addEventListener("click", (event) => {
      checkbox.classList.toggle('selected-box');
    });
  })
};


export { selectCheckbox };

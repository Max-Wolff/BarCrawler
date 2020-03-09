const changeActiveTab = () => {
  const tabs = document.querySelectorAll('.menu-button');
  const tabContent = document.querySelectorAll('.tab-content');
  if (tabs.length > 0) {
    tabs.forEach((tab) => {
      tab.addEventListener('click', () => {
        tabs.forEach((tab) => tab.classList.remove('active-tab'));
        tab.classList.add('active-tab');
        tabContent.forEach((content) => content.classList.add('hide-content'))
        document.getElementById(tab.dataset.show).classList.remove('hide-content');
      });
    });
  }
}

export { changeActiveTab };

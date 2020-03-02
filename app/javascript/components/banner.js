const bannerCarousel = () => {
  let slideIndex = 0;
  const bannerPictures = document.querySelectorAll(".banner-picture");

  if (bannerPictures.length > 0) {
    const changeBanner = () => {
      if (slideIndex >= bannerPictures.length) {slideIndex = 0}
      if (slideIndex < 0) {slideIndex = bannerPictures.length} ;
      for (let i = 0; i < bannerPictures.length; i++) {
        bannerPictures[i].classList.add('hidden');
      }
      bannerPictures[slideIndex].classList.remove('hidden');

      slideIndex ++
    }

    setInterval(function() {
      changeBanner()
    }, 4000);
  }
}

export { bannerCarousel };

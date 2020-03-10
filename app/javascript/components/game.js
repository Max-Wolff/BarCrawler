
const gameCarousel = () => {

  const delayInMilliseconds = 3000; //n second
  setTimeout(function() {
    const button = document.getElementById("next-game")
    button.addEventListener("click", (event) => {
      const game = document.querySelector(".active-game")
      game.classList.remove("active-game")
      const randomArray = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eight", "ninth" ]
      const randomElement = randomArray[Math.floor(Math.random() * randomArray.length)];
      const rand = document.querySelector(`#${randomElement}`);
      rand.classList.add("active-game");
    });
    //your code to be executed after n second
  }, delayInMilliseconds);
}

export { gameCarousel };

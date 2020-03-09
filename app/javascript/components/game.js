
const gameCarousel = () => {
  const games = document.querySelectorAll(".game-element")

  games.forEach((game) => {
    game.addEventListener("click", (event) => {
      const randomArray = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eight", "ninth" ]
      // randomArray
      event.currentTarget.setAttribute("style","display:none;");
      const randomElement = randomArray[Math.floor(Math.random() * randomArray.length)];
      const rand = document.querySelector(`#${randomElement}`);
      rand.setAttribute("style", "display:block");
    });

    // document.getElementById("next-game").addEventListener("click", (event) => {
    //   const randomArray = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh" ]
    //   // randomArray
    //   debugger
    //   event.target.setAttribute("style","display:none;");
    //   const randomElement = randomArray[Math.floor(Math.random() * randomArray.length)];
    //   const rand = document.querySelector(`#${randomElement}`);
    //   rand.setAttribute("style", "display:block");
    // });
  });


// $('#toggle > span').click(function() {
//     var ix = $(this).index();

//     $('#first').toggle( ix === 0 );
//     $('#second').toggle( ix === 1 );
//     $('#third').toggle( ix === 2 );
//     $('#fourth').toggle( ix === 3 );
//     $('#fifth').toggle( ix === 4 );
//     $('#sixth').toggle( ix === 5 );
//     $('#seventh').toggle( ix === 6 );
// });

}

export { gameCarousel };

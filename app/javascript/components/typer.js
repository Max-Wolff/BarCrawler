import 'typer-js'
const typer = require('typer-js')

const typerJs = () => {
  const element = document.querySelector('.typer-js');
  if (element) {
      typer(element, 100).cursor({block: false, blink: 'hard', color: 'white'})
      .line('Other Groups chose the following names:').pause(2000)
      .line('The Brew Crew 🍻').pause(1000).back('all').continue('Raging Alcoholics 🤫').pause(1000).back('all')
      .continue('Saturdays are for the Boys').pause(1000).back('all').continue('Two girls 10 cups ').pause(2000).continue('😑').pause(1000).back('all')
      .continue('Uncreative Drinkers 😉').pause(1000).back('all').continue('The drinkers & the lightweight').pause(1000).back('all').continue('We all know who this is 😁')
  }
}


export { typerJs };

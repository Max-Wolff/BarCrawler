import 'typer-js'
const typer = require('typer-js')

const typerJs = () => {
  const element = document.querySelector('#typer-js');
  if (element) {
    typer(element, 100).cursor({block: false, blink: 'hard', color: 'white'})
    .line('Please type in an epic group name:').pause(2000).back(16).continue('<em style="color:red">epic</em> group name:').pause(2000).empty()
    .line('Let the advanced AI assisst you 🧐:').pause(1000)
    .line('*Obligatory "AI in Process" pause*').pause(2000).back('all')
    .line('That was cringe... Lets start.').pause(2000).back('all')
    .line('The Brew Crew 🍻').pause(1000).back('all').continue('Raging Alcoholics 🤫').pause(1000).back('all').continue('Saturdays are for the Boys').pause(1000).back('all').continue('Two girls 10 cups ').pause(2000).continue('😑').pause(1000).empty()
    .line('Seriously...').pause(2000).continue(' This is getting akward 😳').pause(3000).empty()
    .line('Just plz press enter:');
  }
}


export { typerJs };

import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { bannerCarousel } from '../components/banner';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { showSliderValue } from '../components/range_slider';
import { selectCheckbox } from '../components/select_checkboxes';
import { initMapbox } from '../plugins/init_mapbox';
import { changeActiveTab } from '../components/change_tab';
import { initSecondMap } from '../plugins/init_secondmap';
import { gameCarousel } from '../components/game';
import { typerJs } from '../components/typer';


bannerCarousel();
initAutocomplete();
showSliderValue();
selectCheckbox();
initMapbox();
changeActiveTab();
initSecondMap();
gameCarousel();
typerJs();

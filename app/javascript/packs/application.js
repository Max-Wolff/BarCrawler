import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { bannerCarousel } from '../components/banner';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { showSliderValue } from '../components/range_slider';
import { selectCheckbox } from '../components/select_checkboxes';
import { initMapbox } from '../plugins/init_mapbox';
import { initSecondMap } from '../plugins/init_secondmap';

bannerCarousel();
initAutocomplete();
showSliderValue();
selectCheckbox();
initMapbox();
initSecondMap();

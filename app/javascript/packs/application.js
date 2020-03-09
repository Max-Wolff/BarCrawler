import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { bannerCarousel } from '../components/banner';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { showSliderValue } from '../components/range_slider';
import { selectCheckbox } from '../components/select_checkboxes';
import { initMapbox } from '../plugins/init_mapbox';
import { changeActiveTab } from '../components/change_tab';

bannerCarousel();
initAutocomplete();
showSliderValue();
selectCheckbox();
initMapbox();
changeActiveTab();

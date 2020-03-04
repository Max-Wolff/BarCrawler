import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { bannerCarousel } from '../components/banner';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { showSliderValue } from '../components/range_slider';
import { initMapbox } from '../plugins/init_mapbox';

bannerCarousel();
initAutocomplete();
showSliderValue();
initMapbox();

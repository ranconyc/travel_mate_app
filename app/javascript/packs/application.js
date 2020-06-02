// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// External imports
import "bootstrap";

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initSelect2 } from '../plugins/init_select2';
import { initFlashMessageAnimate } from '../plugins/flash_message_animate'
import { scrollCategories } from '../plugins/category_scroller'
import { changeButtonBorder } from '../packs/searchButtonBorder'
import { initActivityAutocomplete, initUserAutocomplete } from '../plugins/init_activity_and_user_location_autocomplete'
import { initActivityCable } from '../channels/activity_channel'



document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initSelect2();
  initFlashMessageAnimate();
  scrollCategories();
  changeButtonBorder();
  initActivityAutocomplete();
  initUserAutocomplete();
  initActivityCable();
});

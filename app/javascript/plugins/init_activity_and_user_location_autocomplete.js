import places from 'places.js';

const initActivityAutocomplete = () => {
  const activityLocationInput = document.getElementById('activity_location');
  if (activityLocationInput) {
    places({ container: activityLocationInput }).configure({language: 'en'});
  }
};

const initUserAutocomplete = () => {
  const userLocationInput = document.getElementById('user_location');
  if (userLocationInput) {
    places({ container: userLocationInput }).configure({language: 'en'});
  }
};

export { initActivityAutocomplete, initUserAutocomplete };

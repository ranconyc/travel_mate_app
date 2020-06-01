import places from 'places.js';

const initActivityAutocomplete = () => {
  const activityLocationInput = document.getElementById('activity_location');
  if (activityLocationInput) {
    places({ container: activityLocationInput });
  }
};

const initUserAutocomplete = () => {
  const userLocationInput = document.getElementById('user_location');
  if (userLocationInput) {
    places({ container: userLocationInput });
  }
};

export { initActivityAutocomplete, initUserAutocomplete };

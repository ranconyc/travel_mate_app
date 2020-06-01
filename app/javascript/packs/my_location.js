const myLocation = document.getElementById("my-location");

myLocation.addEventListener("click", event => {
  if(!navigator.geolocation) {
    console.log('Geolocation is not supported by your browser');
  } else {
    navigator.geolocation.getCurrentPosition(success, error);
  }
});

function success(position) {
  const latitude  = position.coords.latitude;
  const longitude = position.coords.longitude;
  window.location.href = `/?lat=${latitude}&lon=${longitude}`;
  // console.log(latitude, longitude);
}

function error() {
  console.log("Unable to retrieve your location");
}

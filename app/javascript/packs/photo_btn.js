const previewImageOnFileSelect = () => {
  // we select the photo input
  const input = document.getElementById('photo-input');
  const btn = document.getElementById('upload-photo');
  const label = document.querySelector('.selected')
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      btn.classList.add('input_var');
      label.innerHTML = "You Look Good!";
    });
  };
};

previewImageOnFileSelect();
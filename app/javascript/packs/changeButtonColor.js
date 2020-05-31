const changeButtonColor = () => {
  const btns = document.querySelectorAll('.btns-requests-activities');

  btns.forEach((btn) => {
    btn.addEventListener('click', (event) => {
      console.log("abbbb");
      btn.classList.toggle("btn-select");
    })
  });
}

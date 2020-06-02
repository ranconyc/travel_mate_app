const signupToggle = () => {
  // we select the photo input
  const btn = document.getElementById('forward');
  const part1 = document.getElementById('part_1')
  const part2 = document.getElementById('part_2')
  if (btn) {
    // we add a listener to know when a new picture is uploaded
    btn.addEventListener('click', () => {
      part1.setAttribute("hidden", true);
      part2.removeAttribute("hidden", false);
    })
  } 
}


signupToggle();
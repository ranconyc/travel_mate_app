const scrollCategories = () => {
  // check if we're on the right page
  const scroller = document.querySelector('.category-scroll')
  if (!scroller) {
    return
  }

  // check if we have a category to scroll to
  const params = new URLSearchParams(window.location.search)
  const category = params.get('cat')
  if (!category) {
    return
  }

  // find the element to scroll into view
  const element = document.querySelector(`[data-activity-category="${category}"]`)
  if (element) {
    element.scrollIntoView({ behavior: 'smooth', block: 'end', inline: 'center' })
  }
}

export { scrollCategories }

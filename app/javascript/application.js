// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// ----------------------------------------------------- //

let searchingBar = document.querySelector('#search-bar')

searchingBar.addEventListener('keyup', () => {
  const filter = searchingBar.value.toLowerCase()
  const listArticles = document.querySelectorAll('.articles-container')

  listArticles.forEach((article) => {
    let text = article.textContent
    if(text.toLocaleLowerCase().includes(filter.toLowerCase())) {
      article.style.display = ''
    } else {
      article.style.display = 'none'
    }
  })
})

// ----------------------------------------------------- //

let delay;

searchingBar.addEventListener('input', () => {
    window.clearTimeout(delay);
    delay = window.setTimeout(() => {
      console.log(searchingBar.value);
    }, 3000);
});

// ----------------------------------------------------- //

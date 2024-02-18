// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"



document.addEventListener('DOMContentLoaded', function() {
  const nodeLinks = document.querySelectorAll('.node-link');

  nodeLinks.forEach(link => {
    link.addEventListener('click', function(event) {
      event.preventDefault();
      const targetId = this.getAttribute('data-target');
      const target = document.getElementById(targetId);

      if (target) {
        target.classList.toggle('expanded');
      }
    });
  });
});


  

function setActiveNavLink() {
  const page = document.body.getAttribute('data-page');
  const navLinks = document.querySelectorAll('.nav a[data-link]');
  navLinks.forEach((link) => {
    const linkPage = link.getAttribute('data-link');
    if (linkPage === page) {
      link.classList.add('active');
    } else {
      link.classList.remove('active');
    }
  });
}

function scrollToSection(id) {
  const el = document.getElementById(id);
  if (!el) return;
  el.scrollIntoView({ behavior: 'smooth', block: 'start' });
}

function initContactForm() {
  const form = document.getElementById('contactForm');
  if (!form) return;

  const status = document.getElementById('formStatus');

  form.addEventListener('submit', (event) => {
    event.preventDefault();

    const name = /** @type {HTMLInputElement|null} */ (document.getElementById('name'))?.value.trim();
    const email = /** @type {HTMLInputElement|null} */ (document.getElementById('email'))?.value.trim();
    const message = /** @type {HTMLTextAreaElement|null} */ (document.getElementById('message'))?.value.trim();

    if (!name || !email || !message) {
      if (status) {
        status.textContent = 'Please fill in all fields before sending.';
        status.classList.remove('success');
        status.classList.add('error');
      }
      return;
    }

    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      if (status) {
        status.textContent = 'Please enter a valid email address.';
        status.classList.remove('success');
        status.classList.add('error');
      }
      return;
    }

    if (status) {
      status.textContent = 'Thanks! Your message has been captured locally (no data is sent anywhere).';
      status.classList.remove('error');
      status.classList.add('success');
    }

    form.reset();
  });
}

function initYear() {
  const yearEl = document.getElementById('year');
  if (!yearEl) return;
  yearEl.textContent = new Date().getFullYear().toString();
}

document.addEventListener('DOMContentLoaded', () => {
  setActiveNavLink();
  initContactForm();
  initYear();
});


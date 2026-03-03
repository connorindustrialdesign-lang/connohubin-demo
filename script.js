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

function setActiveCategoryLink() {
  const page = document.body.getAttribute('data-page');
  if (!page) return;

  const pageName = page.toLowerCase();
  const categoryPageMap = {
    'shope-concrete': 'engineering',
    'engineering-design-1-2': 'engineering',
    'shope-portfolio': 'engineering',
    'letter-recommendation': 'engineering'
  };

  let resolvedCategoryPage = pageName;
  
  // portfolio-wheel has its own scroll detection, skip
  if (pageName === 'portfolio-wheel') {
    return;
  }
  
  if (pageName.startsWith('project-')) {
    resolvedCategoryPage = 'industrial-design';
  } else if (pageName.startsWith('fabrication')) {
    resolvedCategoryPage = 'fabrication';
  } else if (pageName.startsWith('fine-arts')) {
    resolvedCategoryPage = 'fine-arts';
  } else {
    resolvedCategoryPage = categoryPageMap[pageName] || pageName;
  }

  const categoryLinks = document.querySelectorAll('.category-bar a');
  categoryLinks.forEach((link) => {
    const href = link.getAttribute('href');
    const hrefName = href.toLowerCase().replace('.html', '').replace('#', '-');
    if (hrefName.includes(resolvedCategoryPage)) {
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

function initCategoryBarMode() {
  const page = document.body.getAttribute('data-page');
  if (!page) return;

  const pageName = page.toLowerCase();
  const projectPages = new Set([
    'shope-concrete',
    'engineering-design-1-2',
    'shope-portfolio',
    'letter-recommendation'
  ]);

  const currentPath = window.location.pathname;
  const isProjectDetailPage = currentPath.includes('-detail.html') || 
                               pageName.startsWith('project-') || 
                               projectPages.has(pageName);
  
  if (isProjectDetailPage) {
    document.body.classList.add('project-detail-page');

    const categoryBar = document.querySelector('.category-bar');
    if (!categoryBar) return;

    const barContent = categoryBar.querySelector('.category-bar-content') || categoryBar;
    const allowedHrefs = [
      'industrial-design.html',
      'engineering.html',
      'fabrication.html',
      'fine-arts.html',
      'about.html'
    ];

    const links = Array.from(barContent.querySelectorAll('a'));
    links.forEach((link) => {
      const href = (link.getAttribute('href') || '').trim();
      if (!allowedHrefs.includes(href) && !link.classList.contains('category-logo')) {
        link.remove();
      }
    });

    if (!barContent.querySelector('a[href="about.html"]')) {
      const aboutLink = document.createElement('a');
      aboutLink.href = 'about.html';
      aboutLink.textContent = 'About';
      barContent.appendChild(aboutLink);
    }

    if (barContent.querySelector('.category-logo')) return;

    const logoLink = document.createElement('a');
    logoLink.href = 'index.html';
    logoLink.className = 'category-logo';
    logoLink.textContent = 'Connor Hubin';
    barContent.prepend(logoLink);
  }
}

document.addEventListener('DOMContentLoaded', () => {
  initCategoryBarMode();
  setActiveNavLink();
  setActiveCategoryLink();
  initContactForm();
  initYear();
});


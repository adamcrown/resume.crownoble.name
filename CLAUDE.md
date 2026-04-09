# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal resume website for Adam Crownoble, built with [Hugo](https://gohugo.io/) and a custom theme located at `themes/resume/`. It is deployed via rsync to a static hosting server.

## Development

**Run local dev server (via Docker):**
```bash
docker compose up
```
This starts Hugo at http://localhost:1313 with live reload.

**Build static output:**
```bash
hugo
```

**Deploy to production:**
```bash
bin/deploy
```
This runs `hugo` and rsyncs the `public/` directory to `codenoble.com:/srv/static/resume.crownoble.name/`.

## Architecture

The site uses a custom Hugo theme (`themes/resume/`) rather than a third-party one. The theme is tightly coupled to the content structure.

**Content:** The entire resume lives in `content/_index.html` as raw HTML with semantic CSS classes. Hugo renders it as the homepage via the `home.html` layout template.

**Theme structure:**
- `themes/resume/layouts/_default/baseof.html` — base HTML shell
- `themes/resume/layouts/partials/header.html` — name, title, and contact links (hardcoded)
- `themes/resume/assets/css/main.sass` — all styles, including print-specific rules via `@media print`
- `themes/resume/assets/js/main.js` — minimal JS

**Content HTML conventions:**
- Employers use `<li class="company">` with `<strong class="employer">`
- Each position uses `<li class="position">` with `<span class="position">` and `<span class="tenure">`
- Individual accomplishments use `<li class="project">`

**Print mode:** The `.print-only` CSS class hides elements by default and shows them when printing. LinkedIn/GitHub links show their URL text only in print.

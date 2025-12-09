# Chelsea Medical Marketing - Multi-Domain Hugo Site

Specialist digital marketing and SEO services for healthcare and medical aesthetics practices.

## About

This is a multi-domain Hugo website using the **Hugo Scroll** theme. The content is shared across multiple domains, with domain-specific configuration files for branding and contact information.

## Technology Stack

- **[Hugo](https://gohugo.io/)** - Static site generator (Extended v0.146.0+)
- **[Hugo Scroll](https://github.com/zjedi/hugo-scroll)** - Single-page, smooth-scrolling theme
- **Node.js** - For build tools (PostCSS, autoprefixer)

## Multi-Domain Setup

### How It Works

1. **Shared Content** - All content in `content/en/` is shared across domains
2. **Domain-Specific Configs** - Each domain has its own `hugo.DOMAIN.yaml` file
3. **Build Per Domain** - Use `hugo --config hugo.DOMAIN.yaml` to build for specific domain

### Available Domains

- `chelseahairclinic.co.uk` - Primary domain
- Add more domains as needed

### Adding a New Domain

1. Copy `hugo.example-domain2.com.yaml` to `hugo.your-domain.com.yaml`
2. Update the configuration:
   - `baseURL`
   - `title` and `params.title`
   - `copyright`
   - `params.contacts` (email, phone, social media)
3. Build: `hugo --config hugo.your-domain.com.yaml`

## Development

### Prerequisites

- [Hugo Extended](https://gohugo.io/installation/) v0.146.0 or later
- [Node.js](https://nodejs.org/) v16+ (for build tools)

### Local Development

1. Clone the repository:
```bash
git clone https://github.com/chelseahairclinic/chelseahairclinic.co.uk.git
cd chelseahairclinic.co.uk
```

2. Install dependencies:
```bash
npm install
```

3. Run development server (default domain):
```bash
hugo server
```

4. Run development server for specific domain:
```bash
hugo server --config hugo.your-domain.com.yaml
```

The site will be available at `http://localhost:1313`

### Build for Production

Build for default domain:
```bash
npm run build:production
```

Build for specific domain:
```bash
hugo --config hugo.your-domain.com.yaml --cleanDestinationDir --minify
```

### Deploy Multiple Domains

You can automate builds for all domains with a script:

```bash
#!/bin/bash
# Build all domains
for config in hugo.*.yaml; do
  if [[ $config != "hugo.example-domain2.com.yaml" ]]; then
    domain=$(basename $config .yaml | sed 's/hugo.//')
    echo "Building for $domain..."
    hugo --config $config --cleanDestinationDir --minify --destination "public-$domain"
  fi
done
```

## Content Structure

- `content/en/_index.md` - Homepage header configuration
- `content/en/homepage/` - Single-page sections:
  - `opener.md` - Hero/welcome section
  - `services.md` - Services overview
  - `about.md` - About the company
  - `portfolio.md` - Case studies and results
  - `contact.md` - Contact information

## Customization

### Update Contact Information

Edit the domain-specific config file (`hugo.DOMAIN.yaml`):

```yaml
params:
  contacts:
    - label: email
      value: your-email@domain.com
      url: mailto:your-email@domain.com
      icon: fa fa-envelope
```

### Update Content

Edit files in `content/en/homepage/` - changes apply to all domains.

### Update Branding

- Logo: Update `header_logo` in `content/en/_index.md`
- Cover image: Update `header_image` in `content/en/_index.md`
- Favicon: Replace `static/images/favicon.png`

## Docker Development

Run the site using Docker:

```bash
docker-compose up
```

## License

Copyright © 2023-2025 Chelsea Medical Marketing Ltd. All rights reserved.

# Quick Start Guide

This guide will get your JSJ Music website up and running in minutes.

## Local Development

```bash
# 1. Install dependencies
npm install

# 2. Start development server
npm run dev

# 3. Open in browser
# Visit http://localhost:3000
```

## Build for Production

```bash
# Build static site
npm run build

# Output will be in the 'out' directory
```

## Deploy with Docker + Caddy

### Quick Deploy

```bash
# One-command deployment
./deploy.sh
```

### Manual Deploy

```bash
# 1. Build the site
npm run build

# 2. Start Docker container
docker-compose up -d

# 3. View your site
# Visit http://localhost
```

## Stop the Server

```bash
docker-compose down
```

## View Logs

```bash
docker-compose logs -f web
```

## Production Setup (with HTTPS)

1. Copy production Caddyfile:
```bash
cp Caddyfile.production.example Caddyfile
```

2. Edit `Caddyfile` and replace:
   - `your-domain.com` with your actual domain
   - `your-email@example.com` with your email

3. Update DNS to point to your server

4. Deploy:
```bash
npm run build
docker-compose up -d
```

Caddy will automatically get SSL certificates from Let's Encrypt!

## Troubleshooting

### Port 80 already in use?

Edit `docker-compose.yml` and change:
```yaml
ports:
  - "8080:80"  # Use different port
```

Then access at `http://localhost:8080`

### Need to rebuild?

```bash
docker-compose down
docker-compose up -d --build
```

### Clean start?

```bash
# Remove old files
rm -rf node_modules .next out

# Fresh install and build
npm install
npm run build
docker-compose up -d
```

## File Structure

- `out/` - Built static files (served by Caddy)
- `Caddyfile` - Web server configuration
- `docker-compose.yml` - Container configuration
- `app/` - Next.js source code
- `components/` - React components

## Need Help?

Check the full [README.md](README.md) for detailed documentation.

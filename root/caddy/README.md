# Caddy

Install caddy first:

```bash
./modules/caddy/install_caddy_debian.sh
INIT=true ./scripts/link.sh caddy
```

Then, you can use caddy to serve your website.


## Restart caddy

```bash
sudo systemctl restart caddy
```

or 
```bash
rca
```
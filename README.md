# unifi

Collection of bash scripts to create a [Unifi Controller](https://www.ubnt.com/software/) with [Let's Encrypt](https://letsencrypt.org/) certificate.

By default it uses a 4gb droplet. It can be changed with SIZE env. variable. Droplets is based on the ubuntu 16.04 image.

After the installation you can ssh to the node and run letsencrypt.sh to obtain a SSL certificate and import it into Java's keystore.

## Requires

- [DigitalOcean](https://www.digitalocean.com/) account (DIGITALOCEAN_ACCESS_TOKEN)
- [doctl](https://github.com/digitalocean/doctl) and [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

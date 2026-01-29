# Terraform Infrastructure

This directory contains Terraform/OpenTofu configurations for managing the homelab infrastructure. The infrastructure is divided into three main components: Authentik (identity provider), Kestra (workflow orchestration), and Proxmox (virtualization platform).

## Directory Structure

```plaintext
terraform/
├── authentik/          # Authentik identity provider configuration
├── kestra/             # Kestra workflow orchestration configuration
└── proxmox/            # Proxmox virtualization platform configuration
```

## Components

### Authentik

Manages the Authentik identity provider infrastructure, including:

- **OAuth2 Applications**: Integration with various services (Grafana, Minio, Immich, Kestra, etc.)
- **Proxy Providers**: Forward authentication for services (Glances, Prometheus, Traefik, Uptime Kuma, etc.)
- **Groups and Users**: User management and access control
- **Authentication Flows**: Custom authentication and passwordless flows
- **Certificates**: SSL/TLS certificate management

#### Authentik Modules

- `authentik_config/`: Core Authentik configuration (flows, certificates, properties)
- `groups/`: User groups, outposts, and service accounts management
- `oauth2/`: OAuth2 provider configurations for integrated applications
- `proxy/`: Forward authentication proxy providers
- `rac/`: Remote Access Control (SSH) configurations

### Kestra

Manages Kestra workflow orchestration platform resources:

- **Key-Value Store**: Configuration and secrets management
- **Flows**: Workflow definitions and automation

#### Kestra Modules

- `kv/`: Key-value store configurations
- `flows/`: Workflow definitions

### Proxmox

Manages Proxmox virtualization infrastructure:

- **ACME**: SSL certificate automation with Cloudflare DNS
- **DNS**: DNS server configuration
- **Metrics**: InfluxDB metrics integration
- **Groups**: User and permission groups
- **SDN**: Software-defined networking
- **LXC**: Linux container configurations
- **VMs**: Virtual machine definitions
- **Kubernetes**: Kubernetes cluster setup

#### Proxmox Modules

- `acme/`: ACME certificate management with DNS plugins
- `dns/`: DNS configuration
- `metrics/`: Metrics and monitoring setup
- `groups/`: Proxmox user groups and permissions
- `sdn/`: Software-defined networking
- `lxc/`: LXC container definitions
- `kube/`: Kubernetes infrastructure
- `vms/`: Virtual machine configurations
- `firewall/`: Firewall rules (if applicable)

## Prerequisites

- [OpenTofu](https://opentofu.org/) >= 1.6
- Access credentials for each service:
  - Authentik API token
  - Kestra API credentials
  - Proxmox API credentials

## Configuration

Each subdirectory contains:

- `main.tf`: Main module composition
- `provider.tf`: Provider configuration
- `variables.tf`: Input variable definitions
- `secrets.auto.tfvars`: Secret values (git-ignored)
- `.env`: Environment variables for credentials (git-ignored)

### Setting Up Secrets

Create a `secrets.auto.tfvars` file in each subdirectory:

**authentik/secrets.auto.tfvars**:

```hcl
akadmin  = "your-admin-token"
username = "your-username"
domain   = "your-domain.com"
```

**kestra/secrets.auto.tfvars**:

```hcl
minio_endpoint = "https://minio.example.com"
openrouter_api = "your-openrouter-api-key"
local_nas      = "your-nas-path"
pihole_sync    = "your-pihole-config"
```

**proxmox/secrets.auto.tfvars**:

```hcl
proxmox_node_name    = "your-node-name"
cloudflare_email     = "your-email@example.com"
cloudflare_api_token = "your-cloudflare-token"
dns                  = "your-dns-server"
influxdb_host        = "your-influxdb-host"
influxdb_token       = "your-influxdb-token"
```

### Environment Variables

Create a `.env` file in each subdirectory with the necessary credentials:

**authentik/.env**:

```bash
AUTHENTIK_TOKEN=your-authentik-token
AUTHENTIK_URL=https://authentik.example.com
```

**kestra/.env**:

```bash
KESTRA_URL=https://kestra.example.com
KESTRA_API_TOKEN=your-kestra-token
```

**proxmox/.env**:

```bash
PROXMOX_VE_ENDPOINT=https://proxmox.example.com:8006
PROXMOX_VE_API_TOKEN=your-api-token
PROXMOX_VE_INSECURE=true
```

## Usage

### Initialize

Navigate to the desired subdirectory and initialize Terraform:

```bash
cd authentik  # or kestra, or proxmox
terraform init
```

### Plan

Review the changes that will be applied:

```bash
terraform plan
```

### Apply

Apply the infrastructure changes:

```bash
terraform apply
```

### Destroy

Remove the managed infrastructure (use with caution):

```bash
terraform destroy
```

## Common Workflows

### Adding a New OAuth2 Application (Authentik)

1. Create a new `.tf` file in `authentik/modules/oauth2/`
2. Define the provider configuration using the oauth2 module pattern
3. Run `terraform plan` and `terraform apply` from the `authentik/` directory

### Adding a New Proxy Provider (Authentik)

1. Create a new `.tf` file in `authentik/modules/proxy/`
2. Define the proxy provider configuration
3. Run `terraform plan` and `terraform apply` from the `authentik/` directory

### Creating a New Kestra Flow

1. Add flow definition in `kestra/modules/flows/`
2. Run `terraform plan` and `terraform apply` from the `kestra/` directory

### Deploying a New VM/LXC (Proxmox)

1. Define the resource in the appropriate module (`vms/` or `lxc/`)
2. Run `terraform plan` and `terraform apply` from the `proxmox/` directory

## State Management

Terraform state files are stored locally in each subdirectory:

- `terraform.tfstate`: Current state
- `terraform.tfstate.backup`: Previous state backup

**Important**: State files contain sensitive information. Ensure they are properly secured and backed up.

Consider migrating to remote state storage (S3, Terraform Cloud, etc.) for better collaboration and state management.

## Best Practices

1. **Always run `terraform plan`** before applying changes
2. **Review the plan output** carefully to understand what will change
3. **Use version control** for all `.tf` files
4. **Never commit** `.tfvars`, `.env`, or state files to version control
5. **Use modules** to promote code reuse and maintainability
6. **Document changes** and maintain this README
7. **Test in a non-production environment** when possible
8. **Keep providers updated** but test for breaking changes

## Troubleshooting

### Authentication Issues

- Verify `.env` files are properly sourced
- Check API token validity and permissions
- Ensure service URLs are accessible

### State Lock Issues

If you encounter state lock errors:

```bash
terraform force-unlock <LOCK_ID>
```

### Provider Version Conflicts

Update provider versions:

```bash
terraform init -upgrade
```

## Security Considerations

- All `.tfvars` and `.env` files containing secrets should be in `.gitignore`
- Use strong API tokens with minimal required permissions
- Regularly rotate credentials
- Review Terraform plans for unintended changes
- Enable audit logging on all services

## Contributing

When modifying the infrastructure:

1. Create a feature branch
2. Make your changes
3. Test with `terraform plan`
4. Document changes in commit messages
5. Submit for review before applying to production

## License

This infrastructure configuration is part of the homelab project.

## Support

For issues or questions, please refer to the main project documentation in the root README.

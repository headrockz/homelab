# Repository Guidelines

## Project Structure & Module Organization
This repository is an infrastructure monorepo for a homelab.
- `docker-compose/`: service stacks, each in its own folder with a `docker-compose.yaml` (for example `docker-compose/traefik/`).
- `ansible/`: operational playbooks by domain (`docker/`, `system/`, `traefik/`, `mqtt/`, `postgres/`).
- `terraform/`: OpenTofu IaC grouped by platform (`authentik/`, `kestra/`, `proxmox/`) with reusable modules under each platform’s `modules/`.
- `scripts/`: utility shell scripts for backups, setup, and maintenance.
- `test/`: infra test/scratch artifacts and sample compose/OpenTofu configs.

## Build, Test, and Development Commands
- `poetry install`: install Python tooling used by hooks and checks.
- `poetry run pre-commit install`: enable local commit and commit-msg hooks.
- `poetry run pre-commit run --all-files`: run linters/formatters across the repo.
- `ansible-playbook ansible/traefik/docker-deploy-traefik.yaml -e "hosts=lxc"`: run a playbook against a host group from `ansible/inventory/`.
- `cd terraform/<authentik|kestra|proxmox> && tofu init && tofu plan`: validate and preview IaC changes before apply.
- `docker compose -f docker-compose/<stack>/docker-compose.yaml config`: validate a stack’s compose syntax.

## Coding Style & Naming Conventions
Use 2 spaces in YAML and standard OpenTofu formatting (`tofu fmt` or `terraform fmt` via pre-commit). Python is formatted with `black` and import-sorted with `isort`; lint with `flake8`; security scan with `bandit`; YAML style with `yamllint`. Name OpenTofu files by feature or service (for example `grafana.tf`, `dns.tf`) and keep compose stacks in lowercase kebab-case directories.

## Testing Guidelines
There is no unit-test framework here; testing is tool-based validation.
- Run `poetry run pre-commit run --all-files` before opening a PR.
- For OpenTofu changes, run `tofu validate` and `tofu plan` in the affected component directory.
- For compose changes, run `docker compose ... config` and smoke-test the stack locally when possible.

## Commit & Pull Request Guidelines
Commit messages follow Conventional Commits (enforced by `cz check`), e.g. `feat: add rustfs oauth2 provider`, `fix: correct traefik middleware rule`. Keep PRs scoped to one subsystem. Include:
- What changed and why.
- Impacted paths (for example `terraform/authentik/modules/oauth2/`).
- Validation evidence (`pre-commit`, `tofu plan`, compose config output).
- Screenshots only for UI/service dashboard changes.

## Security & Configuration Tips
Never commit secrets, `.env`, `secrets.auto.tfvars`, or OpenTofu state. Use git-ignored local files for credentials and review plans for accidental sensitive output.

# OpenLDAP and phpLDAPadmin Docker Setup

This repository provides a Docker Compose configuration to set up an OpenLDAP server alongside phpLDAPadmin for easy management.

## Prerequisites

- Docker
- Docker Compose

## Getting Started

1. **Clone the repository**:

```
git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY_NAME.git

cd YOUR_REPOSITORY_NAME
```

2. **Configuration via .env file**:
   A `.env-example` file is provided in the repository. Copy it as `.env`:

```
cp .env-example .env
```

Edit the `.env` file to specify your desired `LDAP_ROOTPASS`:

```
LDAP_ROOTPASS=your_ldap_root_password
```

3. **Start the Containers**:
   With Docker Compose, you can easily bring up the OpenLDAP and phpLDAPadmin services:

```
docker-compose up -d
```

4. **Access phpLDAPadmin**:
   Once the containers are up and running, navigate to `http://localhost:8080` in your web browser to access the phpLDAPadmin dashboard.

**Login Details**:

- **Login DN**: `cn=admin,dc=nodomain` (or based on your configuration)
- **Password**: The value you set for `LDAP_ROOTPASS` in the `.env` file.

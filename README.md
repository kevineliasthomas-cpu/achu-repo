# MongoDB Atlas Terraform Deployment

This repository uses Terraform to provision MongoDB Atlas clusters via GitHub Actions.

## Setup Instructions

### 1. Local Development (Do NOT commit to GitHub)

```bash
# Copy the example file
cp example.tfvars terraform.tfvars

# Edit with your actual values
# DO NOT commit terraform.tfvars to GitHub!
```

### 2. GitHub Secrets Setup

Add the following secrets to your GitHub repository:
- Go to **Settings** → **Secrets and variables** → **Actions**
- Click **New repository secret**

**Required Secrets:**

| Secret Name | Value | Source |
|---|---|---|
| `MONGODB_ATLAS_PUBLIC_KEY` | Your public API key | MongoDB Atlas → Account Settings → API Keys |
| `MONGODB_ATLAS_PRIVATE_KEY` | Your private API key | MongoDB Atlas → Account Settings → API Keys |
| `MONGODB_ATLAS_ORG_ID` | Your organization ID | MongoDB Atlas → Settings |
| `MONGODB_PROJECT_NAME` | Desired project name | Your choice |
| `MONGODB_DB_USERNAME` | Database username | Your choice |
| `MONGODB_DB_PASSWORD` | Database password | Your choice (strong password) |
| `MONGODB_ACCESS_LIST_IP` | Your IP address | Your machine IP (use tool like whatismyipaddress.com) |
| `MONGODB_CLUSTER_NAME` | Cluster name | Your choice |
| `MONGODB_PROVIDER_REGION` | Region (e.g., US_EAST_2) | Your choice |
| `MONGODB_INSTANCE_SIZE` | Instance size (M0, M2, M5) | Your choice |
| `MONGODB_VERSION` | MongoDB version (e.g., 8.0) | Your choice |

### 3. How It Works

✅ **GitHub Actions Flow:**
1. When you push to `main`, the workflow triggers
2. Secrets are passed as environment variables to Terraform
3. Terraform uses `TF_VAR_*` prefixed variables automatically
4. No sensitive data is stored in your repo

✅ **Why This Approach?**
- `terraform.tfvars` is in `.gitignore` (never committed)
- `example.tfvars` shows the template (safe to commit)
- Secrets are encrypted in GitHub
- Pipeline reads from secrets at runtime

### 4. File Structure

```
.
├── .gitignore                    # Excludes terraform.tfvars
├── example.tfvars                # Safe template (commit this)
├── terraform.tfvars              # Local only (DO NOT commit)
├── main.tf                        # Terraform resources
├── variable.tf                    # Variable definitions
├── .github/workflows/pipeline.yml # GitHub Actions workflow
└── README.md                      # This file
```

### 5. Local Testing

```bash
# Initialize Terraform
terraform init

# Create/use your terraform.tfvars file locally
terraform plan

# Apply changes
terraform apply
```

## Important Notes

⚠️ **Never commit `terraform.tfvars` to Git!** It contains sensitive credentials.

✅ You can safely commit:
- `main.tf`
- `variable.tf`
- `example.tfvars`
- `.github/workflows/pipeline.yml`
- `.gitignore`

## Troubleshooting

**"Error: variable not set"**
- Ensure all required GitHub secrets are added
- Check secret names match exactly

**"Invalid credentials"**
- Verify MongoDB API keys in secrets
- Keys are case-sensitive

**"Access denied for IP"**
- Update `MONGODB_ACCESS_LIST_IP` secret with your current IP

# cloudflare-management
Cloudflare managed by Terraform

Made for fun and the experience, not that I really need it.

.env.example has two options;

- on disk
- fetch it using unlocked Bitwarden CLI

If you care about security, use Bitwarden CLI option.

To import in your shell;

```
source .env
```

Cloudflare token needs:
- Zone / Dynamic Redirect / Edit
- Zone / Page Rules / Edit
- Zone / DNS / Edit

- Zone / Web3 Hostnames / Edit
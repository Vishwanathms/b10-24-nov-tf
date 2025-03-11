# Terraform Output Example

## ✅ Example of Terraform Output in JSON Format

When you run:
```bash
terraform output -json pub_ip
```
You might get an output like this:
```json
{
  "value": [
    "18.208.161.109",
    "44.202.115.229"
  ],
  "type": [
    "list",
    "string"
  ]
}
```
OR, it may directly be:
```json
[
  "18.208.161.109",
  "44.202.115.229"
]
```

---

## ✅ How to Extract Only the IPs Using `jq`

If Terraform outputs **only the list**, use:
```bash
terraform output -json pub_ip | jq -r '.[]'
```
**Expected Output:**
```
18.208.161.109
44.202.115.229
```

If Terraform wraps it in a JSON object (`"value": [...]`), use:
```bash
terraform output -json pub_ip | jq -r '.value[]'
```

---

## ✅ Example Terraform Output Definition

Here’s an example Terraform configuration defining this output:

```hcl
output "pub_ip" {
  value = [aws_instance.example1.public_ip, aws_instance.example2.public_ip]
}
```
This would output a JSON list of IP addresses when you run:
```bash
terraform output -json pub_ip
```

---


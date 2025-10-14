alias tf='TF_VAR_vault_token="$(vt)" terraform'
alias tfi='TF_VAR_vault_token="$(vt)" terraform init'
alias tfp='TF_VAR_vault_token="$(vt)" terraform plan'
alias tfip='export TF_VAR_vault_token="$(vt)"; terraform init && terraform plan'

foreach ($item in 1..1) {
    $start = Get-Date
    terraform fmt; terraform validate
    terraform apply --auto-approve
    $end = Get-Date

    Write-Output "Script started at $start and ended at $end"


}
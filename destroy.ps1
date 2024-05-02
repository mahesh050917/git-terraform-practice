foreach ($item in 1..1) {
    $start = Get-Date
    terraform destroy --auto-approve
    $end = Get-Date
    Write-Output "Script started at $start and ended at $end"
}
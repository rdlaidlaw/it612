Get-Process | Select-Object Name, Id, CPU, WorkingSet | Format-List

Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 Name, Id, CPU

Get-Process | Where-Object { $_.Name -like "*code*" }

Get-Process | Measure-Object WorkingSet -Sum -Average -Maximum

Get-ChildItem -Path /workspace -Recurse -File | Measure-Object

Get-Process | Select-Object Name, Id, CPI, @{Name='MemMB';Expression={[math]::Round($_WorkingSet/1MB,1)}} | Export-Csv -Path ./process-report.csv -NoTypeInformation 
Import-Csv ./process-report.csv | Select-Object -First 5 | Format-Table


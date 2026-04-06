Get-Command *Content*
Get-Process | Get-Member

Get-Process | Sort-Object WorkingSet64 -Descending | Select-Object -First 5 Name, @{N='MB';E={[math]::Round($_.WorkingSet64/1MB,1)}}

Get-ChildItem -Recurse -File | Group-Object Extension | Sort-Object Count -Descending | Select-Object Count, Name

@'
 [
   {"name": "Alice", "course": "CS101", "grade": 92, "semester": "Fall"},
   {"name": "Bob", "course": "CS101", "grade": 78, "semester": "Fall"},
   {"name": "Charlie", "course": "CS201", "grade": 88, "semester": "Fall"},
   {"name": "Alice", "course": "CS201", "grade": 95, "semester": "Fall"},
   {"name": "Diana", "course": "CS101", "grade": 65, "semester": "Spring"},
   {"name": "Bob", "course": "CS201", "grade": 82, "semester": "Spring"},
   {"name": "Eve", "course": "CS101", "grade": 91, "semester": "Spring"},
   {"name": "Charlie", "course": "CS101", "grade": 73, "semester": "Spring"},
   {"name": "Alice", "course": "CS301", "grade": 97, "semester": "Spring"},
   {"name": "Diana", "course": "CS201", "grade": 71, "semester": "Spring"},
   {"name": "Frank", "course": "CS101", "grade": 84, "semester": "Fall"},
   {"name": "Eve", "course": "CS201", "grade": 89, "semester": "Fall"}
]
'@ | Set-Content students.json

$students = Get-Content students.json | ConvertFrom-Json
$students

$students | Where-Object { $_.course -eq "CS101" }

$students | Group-Object course | ForEach-Object {
     [PSCustomObject]@{
         Course = $_.Name
         Average = [math]::Round(($_.Group | Measure-Object grade -Average).Average, 1)
         Count   = $_.Count
     }
 }
$letter = 'c:'
$valueToReturn = "TotalSpace"


if($valueToReturn -eq "FreeSpace") {
    Get-WmiObject win32_logicaldisk -Filter "DeviceId='$letter'" | Select FreeSpace
} 
elseif ($valueToReturn -eq "TotalSpace") {
    Get-WmiObject win32_logicaldisk -Filter "DeviceId='$letter'" | Select Size
}
else {
    Get-WmiObject win32_logicaldisk -Filter "DeviceId='$letter'" | Select @{n="Used"; e={$_.Size - $_.FreeSpace}}
}

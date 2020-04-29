
foreach($line in [System.IO.File]::ReadLines("C:\tmp\es\PDFsFinal.txt"))
{
      
    $start_time = Get-Date
        
    $Filename = [System.IO.Path]::GetFileName($line)
    $dest = "C:\tmp\es\books\$Filename"

    $wc = New-Object System.Net.WebClient
    $wc.DownloadFile($source, $dest)

	Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
}




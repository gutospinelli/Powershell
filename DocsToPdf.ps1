# the path where your documents live (no recursive)
$documents_path = 'C:\tmp\es'

# the MsWord application as a com object used to convert docs to pdf
$msword = New-Object -ComObject Word.Application

# finds .doc and .docx (doc?) and performs pdf conversion using MsWord's SaveAs functionality
Get-ChildItem -Path $documents_path -Filter *.doc? | ForEach-Object {

    $document = $msword.Documents.Open($_.FullName)

    $pdf_filename = "$($_.DirectoryName)\$($_.BaseName).pdf"

    $document.SaveAs([ref] $pdf_filename, [ref] 17)

    $document.Close()
}
# closes the MsWord app
$msword.Quit()
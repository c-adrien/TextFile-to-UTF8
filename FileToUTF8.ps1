# Get current directory
$directory = $MyInvocation.MyCommand.Path
$directory = Split-Path -Path $directory

# Empty new object
$Utf8File = New-Object System.Text.UTF8Encoding($False)

# For .txt and .srt files in current directory
Get-ChildItem $directory\* -Include *.txt, *.srt |
Foreach-Object {

    $filename = $_.Fullname
    Write-Host $filename    
    $content = get-content $filename

    if ($content) {
        [System.IO.File]::WriteAllLines($filename, $content, $Utf8File)
    }
}

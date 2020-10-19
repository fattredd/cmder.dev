$packageName = 'fattredd.cmder.dev'
$url = 'https://github.com/cmderdev/cmder/releases/download/v1.3.16/cmder.7z'

try { 
  $installDir = "C:\bin" 
  
  if (![System.IO.Directory]::Exists($installDir)) {[System.IO.Directory]::CreateDirectory($installDir)}
  
  $tempDir = "$env:TEMP\chocolatey\$($packageName)"
  if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}

  # Get the latest Cmder 7z file
  $repo = "cmderdev/cmder"
  $file = "cmder.7z"
  $releases = "https://api.github.com/repos/$repo/releases"
  Write-Host Determining latest release
  $tag = (Invoke-WebRequest $releases -UseBasicParsing | ConvertFrom-Json)[0].tag_name
  $url = "https://github.com/$repo/releases/download/$tag/$file"

  $file = Join-Path $tempDir "$($packageName).7z"
  Get-ChocolateyWebFile "$packageName" "$file" "$url"

  Start-Process "7za" -ArgumentList "x -o`"$installDir`" -y `"$file`"" -Wait

  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}
#>
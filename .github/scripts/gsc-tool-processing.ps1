param (
    [string]$relativeDirectory
)
$errors = @()

    $cwd= (Get-Location).Path
    $directory = Join-Path -Path $cwd -ChildPath $relativeDirectory
    $files = Get-ChildItem -Path $directory -Recurse -Include *.gsc, *.csc
    $files | ForEach-Object {
        $relativePath = "."+$_.FullName.Substring($cwd.Length)
        Write-Output "Processing $relativePath"
        $output = & "gsc-tool.exe" -m comp -g t6 -s pc $relativePath 2>&1 | Where-Object { $_ } | Tee-Object -Variable outputErrors
        if ($output -match "ERROR") {

            $errors += $outputErrors
        }
    }


if ($errors) {

    Write-Output $errors
    exit 1
}
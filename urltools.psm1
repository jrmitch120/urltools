# Urltools PowerShell Module
# Provides the following utilities:
# - urlencode: URL-encodes a given string
# - urldecode: URL-decodes a given string
function urlencode {
    param([Parameter(Position=0, ValueFromPipeline)][string]$InputObject)

    process {
        if ($InputObject -in '--help','-h') {
            Write-Host "urlencode <string>  - URL-encodes the given string"
            Write-Host ""
            Write-Host "Example:"
            Write-Host "  urlencode 'https://github.com/ohmyzsh/ohmyzsh/search?q=urltools&type=Code'"
            return
        }
        if ([string]::IsNullOrEmpty($InputObject)) { return }
        [System.Uri]::EscapeDataString($InputObject)
    }
}

function urldecode {
    param([Parameter(Position=0, ValueFromPipeline)][string]$InputObject)

    process {
        if ($InputObject -in '--help','-h') {
            Write-Host "urldecode <string>  - URL-decodes the given string"
            Write-Host ""
            Write-Host "Example:"
            Write-Host "  urldecode 'https%3A%2F%2Fgithub.com%2Fohmyzsh%2Fohmyzsh%2Fsearch%3Fq%3Durltools%26type%3DCode'"
            return
        }
        if ([string]::IsNullOrEmpty($InputObject)) { return }
        [System.Uri]::UnescapeDataString($InputObject)
    }
}

Export-ModuleMember -Function urlencode, urldecode
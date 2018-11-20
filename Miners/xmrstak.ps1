. .\Include.ps1

$Path = ".\Bin\CryptoNight-FireIce260\xmr-stak.exe"
$Uri = "https://github.com/nemosminer/xmr-stak/releases/download/v2.6/xmr-stak-win64-2.6.0.7z"

$Name = Get-Item $MyInvocation.MyCommand.Path | Select-Object -ExpandProperty BaseName
$Port = 3335

$Commands = [PSCustomObject]@{
    "cryptonight_heavy" = "" # CryptoNight-Heavy(cryptodredge faster)
    "cryptonight_lite"  = "" # CryptoNight-Lite
    "cryptonight_v7"    = "" # CryptoNightV7(cryptodredge faster)
    # "monero"     = "" # Monero(v8)
    "cryptonight_v8"    = "" # CryptoNightV8
}

$Commands | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name | ForEach-Object {

    $Algorithm_Norm = Get-Algorithm $_

    ([PSCustomObject]@{
            pool_list       = @([PSCustomObject]@{
                    pool_address    = "$($Pools.$Algorithm_Norm.Host):$($Pools.$Algorithm_Norm.Port)"
                    wallet_address  = "$($Pools.$Algorithm_Norm.User)"
                    pool_password   = "$($Pools.$Algorithm_Norm.Pass)"
                    use_nicehash    = $true
                    use_tls         = $Pools.$Algorithm_Norm.SSL
                    tls_fingerprint = ""
                    pool_weight     = 1
                    rig_id = ""
                }
            )
            currency        = if ($Pools.$Algorithm_Norm.Info) {"$($Pools.$Algorithm_Norm.Info -replace '^monero$', 'monero7' -replace '^aeon$', 'aeon7')"} else {"$_"}
            call_timeout    = 10
            retry_time      = 10
            giveup_limit    = 0
            verbose_level   = 3
            print_motd      = $true
            h_print_time    = 60
            aes_override    = $null
            use_slow_memory = "warn"
            tls_secure_algo = $true
            daemon_mode     = $false
            flush_stdout    = $false
            output_file     = ""
            httpd_port      = $Port
            http_login      = ""
            http_pass       = ""
            prefer_ipv4     = $true
        } | ConvertTo-Json -Depth 10
    ) -replace "^{" -replace "}$" | Set-Content "$(Split-Path $Path)\$($Pools.$Algorithm_Norm.Name)_$($Algorithm_Norm)_$($Pools.$Algorithm_Norm.User)_Nvidia.txt" -Force -ErrorAction SilentlyContinue

    [PSCustomObject]@{
        Type      = "NVIDIA"
        Path      = $Path
        HashSHA256 = $HashSHA256
        Arguments = "-C $($Pools.$Algorithm_Norm.Name)_$($Algorithm_Norm)_$($Pools.$Algorithm_Norm.User)_Nvidia.txt --noAMD --noCPU -i 4068"
        HashRates = [PSCustomObject]@{$Algorithm_Norm = $Stats."$($Name)_$($Algorithm_Norm)_HashRate".Day}
        API       = "fireice"
        Port      = 4068
        URI       = $Uri
    }
}
. .\Include.ps1

$Path = ".\Bin\NVIDIA-trex080\t-rex.exe"
$Uri = "https://github.com/trexminer/T-Rex/releases/download/0.8.0/t-rex-0.8.0-win-cuda10.0.zip"

$Commands = [PSCustomObject]@{
"balloon" = "" #Balloon(fastest)
"polytimos" = "" #Poly(fastest)
"bcd" = "" #Bcd(fastest)
"skunk" = "" #Skunk(fastest)
"hsr" = "" #Hsr(Testing)
"bitcore" = "" #Bitcore(fastest)
"lyra2z" = "" #Lyra2z (cryptodredge faster)
"tribus" = "" #Tribus(CryptoDredge faster)
"c11" = "" #C11(fastest)
"x17" = "" #X17(fastest)
"x16s" = "" #X16s(fastest)
"x16r" = "" #X16r(fastest)
"sonoa" = "" #SonoA(fastest)
"hmq1725" = "" #Hmq1725(fastest)
"sha256t" = "" #Sha256t(fastest)
"x22i" = "" #Suqa
"timetravel" = "" #Timetravel(fastest)
}

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Commands | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {
    [PSCustomObject]@{
        Type = "NVIDIA"
        Path = $Path
        Arguments = "-b 127.0.0.1:4068 -d $SelGPUCC -a $_ -o stratum+tcp://$($Pools.(Get-Algorithm($_)).Host):$($Pools.(Get-Algorithm($_)).Port) -u $($Pools.(Get-Algorithm($_)).User) -p $($Pools.(Get-Algorithm($_)).Pass)$($Commands.$_)"
        HashRates = [PSCustomObject]@{(Get-Algorithm($_)) = $Stats."$($Name)_$(Get-Algorithm($_))_HashRate".Day * .99} # substract 1% devfee
        API = "Ccminer"
        Port = 4068
        Wrap = $false
        URI = $Uri
        User = $Pools.(Get-Algorithm($_)).User
    }
}
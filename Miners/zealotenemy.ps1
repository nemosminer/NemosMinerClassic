. .\Include.ps1

$Path = ".\Bin\NVIDIA-zealotenemy124v3\z-enemy.exe"
$Uri = "https://nemosminer.com/data/optional/z-enemy.1-24-cuda10.0_ver3.7z"

$Commands = [PSCustomObject]@{
    "aeriumx"    = "" #AeriumX(RTX)
    "bcd"        = "" #Bcd(RTX)
    "hsr"        = " -i 21" #Hsr
    "phi"        = "" #Phi (RTX)
    "phi2"       = "" #Phi2 (RTX)
    "poly"       = "" #Polytimos(RTX) 
    "bitcore"    = "" #Bitcore (RTX)
    "x16r"       = "" #X16r (RTX)
    "x16s"       = "" #X16s (RTX)
    "sonoa"      = "" #SonoA (RTX)
    "skunk"      = "" #Skunk (RTX)
    "timetravel" = "" #Timetravel (RTX)
    "tribus"     = "" #Tribus (RTX)
    "c11"        = " -i 21" #C11 (RTX)
    "xevan"      = "" #Xevan (RTX)
    "x17"        = " -i 21" #X17(RTX)
    "hex"        = "" #Hex (RTX)
}

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Commands | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {
    [PSCustomObject]@{
        Type = "NVIDIA"
        Path = $Path
        Arguments = "-b 4068 -a $_ -o stratum+tcp://$($Pools.(Get-Algorithm($_)).Host):$($Pools.(Get-Algorithm($_)).Port) -u $($Pools.(Get-Algorithm($_)).User) -p $($Pools.(Get-Algorithm($_)).Pass)$($Commands.$_)"
        HashRates = [PSCustomObject]@{(Get-Algorithm($_)) = $Stats."$($Name)_$(Get-Algorithm($_))_HashRate".Day * .99} # substract 1% devfee
        API = "Ccminer"
        Port = 4068
        Wrap = $false
        URI = $Uri
        User = $Pools.(Get-Algorithm($_)).User
    }
}
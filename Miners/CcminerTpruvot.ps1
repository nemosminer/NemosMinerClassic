. .\Include.ps1

$Path = ".\Bin\NVIDIA-TPruvot\ccminer.exe"
$Uri = "https://github.com/tpruvot/ccminer/releases/download/2.2.5-tpruvot/ccminer-x86-2.2.5-cuda9.7z"

$Commands = [PSCustomObject]@{
    "polytimos" = " -d $SelGPUCC --api-remote" #Polytimos
    #"hsr" = " -d $SelGPUCC --api-remote" #Hsr
    #"phi" = " -N 1 -d $SelGPUCC --api-remote" #Phi
    #"bitcore" = " -d $SelGPUCC --api-remote" #Bitcore
    "jha" = " -d $SelGPUCC --api-remote" #Jha
    #"blake2s" = " -d $SelGPUCC --api-remote" #Blake2s
    #"blakecoin" = " -d $SelGPUCC" #Blakecoin
    #"vanilla" = "" #BlakeVanilla
    #"cryptonight" = " -i 10 -d $SelGPUCC" #Cryptonight
    #"decred" = "" #Decred
    #"equihash" = "" #Equihash
    #"ethash" = "" #Ethash
    #"groestl" = " -d $SelGPUCC --api-remote" #Groestl
    #"hmq1725" = " -d $SelGPUCC -i 20 --api-remote" #hmq1725
    #"keccakc" = " -d $SelGPUCC --api-remote" #Keccakc
    "lbry" = " -d $SelGPUCC --api-remote" #Lbry
    #"lyra2v2" = " -N 1 -d $SelGPUCC --api-remote" #Lyra2RE2
    "lyra2z" = " -r 0 -d $SelGPUCC --api-remote" #Lyra2z
    #"myr-gr" = "" #MyriadGroestl
    #"neoscrypt" = " -d $SelGPUCC" #NeoScrypt
    #"nist5" = " -d $SelGPUCC --api-remote" #Nist5
    #"pascal" = "" #Pascal
    #"qubit" = "" #Qubit
    #"scrypt" = "" #Scrypt
    "sha256t" = " -d $SelGPUCC" #Sha256t
    #"sia" = "" #Sia
    #"sib" = " -d $SelGPUCC --api-remote" #Sib
    #"skein" = "" #Skein
    #"skunk" = " -d $SelGPUCC" #Skunk
    #"timetravel" = " -d $SelGPUCC --api-remote" #Timetravel
    #"tribus" = " -d $SelGPUCC --api-remote" #Tribus
    #"c11" = " -d $SelGPUCC --api-remote" #C11
    #"veltor" = "" #Veltor
    "x11evo" = " -d $SelGPUCC --api-remote" #X11evo
    #"x17" = " -N 1 -d $SelGPUCC --api-remote" #X17
    #"yescrypt" = "" #Yescrypt
}

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Commands | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {
    [PSCustomObject]@{
        Type = "NVIDIA"
        Path = $Path
        Arguments = "-b 4068 -a $_ -o stratum+tcp://$($Pools.(Get-Algorithm($_)).Host):$($Pools.(Get-Algorithm($_)).Port) -u $($Pools.(Get-Algorithm($_)).User) -p $($Pools.(Get-Algorithm($_)).Pass)$($Commands.$_)"
        HashRates = [PSCustomObject]@{(Get-Algorithm($_)) = $Stats."$($Name)_$(Get-Algorithm($_))_HashRate".Day}
        API = "Ccminer"
        Port = 4068
        Wrap = $false
        URI = $Uri
    }
}

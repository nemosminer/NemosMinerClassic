# NemosMinerClassic-v2.5.4
multi algo profit switching NVIDIA miner 
### 
 
 Instructions at bottom of the page.
*****
NemosMinerClassic Monitors mining pools in real-time in order to find the most profitable Algo /
 Auto Benchmarks Each algo to get optimal speeds / 
 Fully automated / 
 Auto Downloads Miners

*****
Additional features list

   prerun
   
      Ability to run a batch prior switching to a specific algo.
      For example, can be used to set per algo OC via nvidiaInspector
      Simply create a file named <AlgoName>.bat in prerun folder
      If <AlgoName>.bat does not exist, will try to launch prerun/default.bat
      Use overclock with caution

   Earnings Tracking
   
      Displays BTC/H and BTC/D as well a estimation of when the pool payment threshold will be reached.
      Supported pools:
            ahashpool
            zergpool
            zpool
            nicehash
      If mining more that one pools, shows stats for any supported pool
      Enabled by default. use "-TrackEarnings $false" in start<pool>.bat to fully disable.
      Press key e in the window to show/hide earnings

   Algo switching log
   
      Simple algo switching log in csv switching.log file found in Logs folder.
      You can easily track switching rate.
      
   Display Options
   
      Use -UIStyle Light or -UIStyle Full in start.bat
            Full = Usual display (Default)
            Light = Show only currently mining info 
      UIStyle automaticaly swtiches to Full during benchmarking.

   In session display toggle
   
      Press key s in the window to switch between light and full display
      Press key e in the window to show/hide earnings 
      Will toggle(switch) display at next refresh
      
 Update Notifier 
  
     Will show update meassage when a new version of NemosMiner is Avavilible 
     
*****

instructions:

edit startpoolname.bat

1.change BTC address to yours

2.select how many gpu's you have eg: (1gpu dstm 0 cc 0) (2gpu dstm 0 1 cc 0,1) (6gpu dstm 0 1 2 3 4 5 cc 0,1,2,3,4,5)

3.remove any algos you do not want to mine

4.save & run startpoolname.bat

note. instruction number 1 : is different for miningpoolhub, you need to change user name and worker name

*****
 
If you have Windows 7, 8, or 8.1, please update PowerShell:
https://www.microsoft.com/en-us/download/details.aspx?id=54616

CCMiner may need 'MSVCR120.dll' if you don't already have it:
https://www.microsoft.com/en-gb/download/details.aspx?id=40784

CCMiner may need 'VCRUNTIME140.DLL' if you don't already have it:
https://www.microsoft.com/en-us/download/details.aspx?id=48145

running multiple cards its recommended to increase Virtual Memory 64gb is optimal

recommended/optimal Nvidia driver 416.94 / http://us.download.nvidia.com/Windows/416.94/416.94-desktop-win10-64bit-international-whql.exe

Made For & Tested with 6x1060 6gb 6x1070 6x1070ti 6x1080ti 6x2070 6x2080 6x2080ti (users have reported up to 12cards working have not tested myself)
Some miners do not support more that 9 cards

*****


there is a default 5minute per day fee (0.3%) that can be disabled by changing -Donate 5 to 0

-ActiveMinerGainPct (percent of advantage that active miner has over candidates in term of profit (default 3%)

24hr.bats.. eg. startahashpool24hr.bat  startzpool24hr.bat.. (uses last 24hour Actual API too request profit)
   -Low switching rate
normal .bats uses estimates.. eg. startahashpool.bat   startzpool.bat..   (uses current estimate API too request profit)

This is a free project
Feel free to donate to the original creators:

aaronsace = 1MsrCoAt8qM53HUMsUxvy9gMj3QVbHLazH

nemo = 1QGADhdMRpp9Pk5u5zG1TrHKRrdK5R81TE

MrPlus = 134bw4oTorEJUUVFhokDQDfNqTs7rBMNYy

Licensed under the GNU General Public License v3.0
Permissions of this strong copyleft license are conditioned on making available complete source code of licensed works and modifications, which include larger works using a licensed work, under the same license. Copyright and license notices must be preserved. Contributors provide an express grant of patent rights. https://github.com/nemosminer/NemosMinerClassic/blob/master/LICENSE

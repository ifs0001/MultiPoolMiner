﻿@cd /d %~dp0

@if not "%GPU_FORCE_64BIT_PTR%"=="1" (setx GPU_FORCE_64BIT_PTR 1) > nul
@if not "%GPU_MAX_HEAP_SIZE%"=="100" (setx GPU_MAX_HEAP_SIZE 100) > nul
@if not "%GPU_USE_SYNC_OBJECTS%"=="1" (setx GPU_USE_SYNC_OBJECTS 1) > nul
@if not "%GPU_MAX_ALLOC_PERCENT%"=="100" (setx GPU_MAX_ALLOC_PERCENT 100) > nul
@if not "%GPU_SINGLE_ALLOC_PERCENT%"=="100" (setx GPU_SINGLE_ALLOC_PERCENT 100) > nul
@if not "%CUDA_DEVICE_ORDER%"=="PCI_BUS_ID" (setx CUDA_DEVICE_ORDER PCI_BUS_ID) > nul

@set "command=& .\multipoolminer.ps1 -Wallet 1Q24z7gHPDbedkaWDTFqhMF8g7iHMehsCb -UserName aaronsace -WorkerName multipoolminer -Region europe -Currency btc,usd,eur -DeviceName amd,nvidia,cpu -PoolName miningpoolhubcoins,zpool,nicehash -Algorithm blake2s,cryptonightV7,cryptonightheavy,decrednicehash,ethash,ethash2gb,ethash3gb,equihash,keccak,lbry,lyra2re2,lyra2z,m7m,neoscrypt,pascal,sib,skein,skunk,x16r -Donate 24 -Watchdog -MinerStatusURL https://multipoolminer.io/monitor/miner.php -SwitchingPrevention 2"

powershell -executionpolicy bypass .\Wrapper.ps1

pwsh -noexit -executionpolicy bypass  -command "%command%"  > .\Logs\MainWindow.txt
powershell -version 5.0 -noexit -executionpolicy bypass  -command "%command%" > .\Logs\MainWindow.txt
pwsh -noexit -executionpolicy bypass  -command "%command%" >.\Logs\MainWindow.txt

pause

﻿@cd /d %~dp0

@if not "%GPU_FORCE_64BIT_PTR%"=="1" (setx GPU_FORCE_64BIT_PTR 1) > nul
@if not "%GPU_MAX_HEAP_SIZE%"=="100" (setx GPU_MAX_HEAP_SIZE 100) > nul
@if not "%GPU_USE_SYNC_OBJECTS%"=="1" (setx GPU_USE_SYNC_OBJECTS 1) > nul
@if not "%GPU_MAX_ALLOC_PERCENT%"=="100" (setx GPU_MAX_ALLOC_PERCENT 100) > nul
@if not "%GPU_SINGLE_ALLOC_PERCENT%"=="100" (setx GPU_SINGLE_ALLOC_PERCENT 100) > nul
@if not "%CUDA_DEVICE_ORDER%"=="PCI_BUS_ID" (setx CUDA_DEVICE_ORDER PCI_BUS_ID) > nul

@set "command=& .\multipoolminer.ps1 -Wallet 1Q24z7gHPDbedkaWDTFqhMF8g7iHMehsCb -UserName aaronsace -WorkerName multipoolminer -Region europe -Currency btc,usd,eur -DeviceName amd,nvidia,cpu -PoolName miningpoolhubcoins,zpool,nicehash -Algorithm blake2s,cryptonightV7,cryptonightheavy,decrednicehash,ethash,ethash2gb,ethash3gb,equihash,keccak,lbry,lyra2re2,lyra2z,m7m,neoscrypt,pascal,sib,skein,skunk,x16r -Donate 24 -Watchdog -MinerStatusURL https://multipoolminer.io/monitor/miner.php -SwitchingPrevention 2"

start pwsh -noexit -executionpolicy bypass -command "& .\reader.ps1 -log 'MultiPoolMiner_\d\d\d\d-\d\d-\d\d\.txt' -sort '^[^_]*_' -quickstart"
start pwsh -noexit -executionpolicy bypass -command "& .\reader.ps1 -log '^((?!MultiPoolMiner_.+\.txt).)*$' -sort '^[^_]*_' -quickstart"

pwsh -noexit -executionpolicy bypass -windowstyle maximized -command "%command%"
powershell -version 5.0 -noexit -executionpolicy bypass -windowstyle maximized -command "%command%"
msiexec -i https://github.com/PowerShell/PowerShell/releases/download/v6.0.4/PowerShell-6.0.4-win-x64.msi -qb!
pwsh -noexit -executionpolicy bypass -windowstyle maximized -command "%command%"

pause

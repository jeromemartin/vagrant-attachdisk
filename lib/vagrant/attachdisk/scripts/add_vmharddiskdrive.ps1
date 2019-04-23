#Requires -Modules VagrantMessages

param(
    [Parameter(Mandatory=$true)]
    [string]$VmId,
    [parameter (Mandatory=$true)]
    [string] $DiskPath
)

$VM = Get-VM -Id $VmId

try {
    Add-VMHardDiskDrive -VM $VM -Path $DiskPath
} catch {
    $ErrorMessage = $_.Exception.Message
    Write-ErrorMessage "Failed to attache VHD to VM $VmId : $ErrorMessage"
    exit 1    
}

$imageProfile = "ESXi-6.7.0-20221001001s-standard" # ESXi-6.7.0-20221001001s-standard
$newProfileName = "ESXi-6.7.0-20221001001s-yuki"
$drv_nic = "net-igb"
$drv_nvme = "nvme-community"

Add-EsxSoftwareDepot "ESXi-6.7.0-20221001001s-standard.zip"
Add-EsxSoftwareDepot "net-igb-5.3.2-99-offline_bundle.zip"
Add-EsxSoftwareDepot "net55-r8168-8.045a-napi-offline_bundle.zip"
Add-EsxSoftwareDepot "r8125-bundle.zip"
Add-EsxSoftwareDepot "Net-Community-Driver_1.2.7.0-1vmw.700.1.0.15843807_19480755.zip"
#Add-EsxSoftwareDepot "nvme-community-driver_1.0.1.0-1vmw.670.0.0.8169922-offline_bundle-17658145.zip"
Add-EsxSoftwareDepot "nvme-community-driver_1.0.1.0-3vmw.700.1.0.15843807-component-18902434.zip"

Get-EsxSoftwarePackage | ft Name


New-EsxImageProfile -CloneProfile "ESXi-6.7.0-20221001001s-standard" -Name "ESXi-6.7.0-20221001001s-yuki" -Vendor "Kenzo" -AcceptanceLevel CommunitySupported

Add-EsxSoftwarePackage -ImageProfile "ESXi-6.7.0-20221001001s-yuki" -SoftwarePackage "nvme-community" -Force
Add-EsxSoftwarePackage -ImageProfile "ESXi-6.7.0-20221001001s-yuki" -SoftwarePackage "net-igb" -Force
Add-EsxSoftwarePackage -ImageProfile "ESXi-6.7.0-20221001001s-yuki" -SoftwarePackage "net-r8125" -Force
Add-EsxSoftwarePackage -ImageProfile "ESXi-6.7.0-20221001001s-yuki" -SoftwarePackage "net55-r8168" -Force
Add-EsxSoftwarePackage -ImageProfile "ESXi-6.7.0-20221001001s-yuki" -SoftwarePackage "net-community" -Force

Export-ESXImageProfile -ImageProfile "ESXi-6.7.0-20221001001s-yuki" -ExportToIso -FilePath "ESXi-6.7.0-20221001001s-yuki.iso" -Force

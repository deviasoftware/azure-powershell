#Powershell help for DNS records: https://docs.microsoft.com/en-us/azure/dns/dns-operations-recordsets
#Office 365 Azure DNS help (if you want to do it manually or follow along): https://support.office.com/en-us/article/Create-DNS-records-for-Azure-DNS-zones-fbcef2d7-ebaf-40d0-ba1f-cdaeff9f50ef
#Double check the values listed below for changes. These were current as of March 10, 2017

#If you tried manually and failed and you are turning to this script, use the portal to delete the DNS records.


#Provide resource group, zone
$rgName = "YOUR RESOURCE GROUP"
$zoneName = "You zone (example: contoso.com)"
$office365domainkey = "o365 domain key (example contoso-com) Look at your MX record "
$exchangevalue = $office365domainkey + ".mail.protection.outlook.com"

#optionally create new zone in rgName
#New-AzureRmDnszone -Name $zoneName -ResourceGroupName $rgName


New-AzureRmDnsRecordSet -Name "@" -RecordType MX -ZoneName $zoneName -ResourceGroupName $rgName -Ttl 3600 -DnsRecords (New-AzureRmDnsRecordConfig -Exchange $exchangevalue -Preference 10)


New-AzureRmDnsRecordSet -Name "autodiscover" -RecordType CNAME -ZoneName $zoneName -ResourceGroupName $rgName -Ttl 3600 -DnsRecords (New-AzureRmDnsRecordConfig -Cname "autodiscover.outlook.com")
New-AzureRmDnsRecordSet -Name "sip" -RecordType CNAME -ZoneName $zoneName -ResourceGroupName $rgName -Ttl 3600 -DnsRecords (New-AzureRmDnsRecordConfig -Cname "sipdir.online.lync.com")
New-AzureRmDnsRecordSet -Name "lyncdiscover" -RecordType CNAME -ZoneName $zoneName -ResourceGroupName $rgName -Ttl 3600 -DnsRecords (New-AzureRmDnsRecordConfig -Cname "webdir.online.lync.com")
New-AzureRmDnsRecordSet -Name "msoid" -RecordType CNAME -ZoneName $zoneName -ResourceGroupName $rgName -Ttl 3600 -DnsRecords (New-AzureRmDnsRecordConfig -Cname "clientconfig.microsoftonline-p.net")
New-AzureRmDnsRecordSet -Name "enterpriseregistration" -RecordType CNAME -ZoneName $zoneName -ResourceGroupName $rgName -Ttl 3600 -DnsRecords (New-AzureRmDnsRecordConfig -Cname "enterpriseregistration.windows.net")
New-AzureRmDnsRecordSet -Name "enterpriseenrollment" -RecordType CNAME -ZoneName $zoneName -ResourceGroupName $rgName -Ttl 3600 -DnsRecords (New-AzureRmDnsRecordConfig -Cname "enterpriseenrollment.manage.microsoft.com")

New-AzureRmDnsRecordSet -Name "@" -RecordType TXT -ZoneName $zoneName -ResourceGroupName $rgName -Ttl 3600 -DnsRecords (New-AzureRmDnsRecordConfig -Value "v=spf1 include:spf.protection.outlook.com -all")


New-AzureRmDnsRecordSet -Name "_sip._tls" -RecordType SRV -ZoneName $zoneName -ResourceGroupName $rgName -Ttl 3600 -DnsRecords (New-AzureRmDnsRecordConfig -Priority 100 -Weight 1 -Port 443 -Target "sipdir.online.lync.com")
New-AzureRmDnsRecordSet -Name "_sipfederationtls._tcp" -RecordType SRV -ZoneName $zoneName -ResourceGroupName $rgName -Ttl 3600 -DnsRecords (New-AzureRmDnsRecordConfig  -Priority 100 -Weight 1 -Port 5061 -Target "sipfed.online.lync.com")

$group = "groupe AD"
$fileUser = Get-Content c:\_admin\_script\AD\liste_remove_ad_group.txt
$infoGroup = Get-ADGroup -Identity $group


$i = 0


foreach ($item in $fileUser)
{
	$InfoUser = Get-ADuser -Identity $item
	$getGroupAdUser = Get-ADPrincipalGroupMembership $item | select name
	foreach ($groupname in $getGroupAdUser)
	{
		if ($groupname -match "$group")
		{
			$Appartient = $true
		}
	}
	
	if ($Appartient -eq $true)
	{
		Try
		{
			Write-Host "Supression du groupe $group user : $InfoUser"
			remove-adgroupmember -Identity $infoGroup.DistinguishedName -Member $InfoUser.DistinguishedName  -Confirm:$false
			Write-Host "Supression du groupe $group : OK"
		}
		Catch
		{
			Write-Host "Supression du groupe $group : ERROR"
		}
	}
	else
	{
		Write-Host "L'utilisateur $item ne fait pas parti du groupe : $group "
	}
	Write-Host ""
}

Write-Host "FIN"

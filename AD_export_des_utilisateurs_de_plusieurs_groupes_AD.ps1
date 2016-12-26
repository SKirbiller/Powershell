$groupfile = Get-Content c:\_admin\_script\AD\liste_groupe_PCT.txt

foreach ($Adgroup in $groupfile)
{
	$group = get-adgroupmember $Adgroup
	$i = 0
	
	foreach ($item in $group)
	{
		$user = $item.name
		
		Try
		{
			$info = Get-ADuser -Identity $item -Properties GivenName
			Write-Host $Adgroup ","  $user "," $info.givenname "," $info.surname
			$i = $i+1
		}
		Catch
		{
			Write-Host $user
		}
		
	}
}
Write-Host $i
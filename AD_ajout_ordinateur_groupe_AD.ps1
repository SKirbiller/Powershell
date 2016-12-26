$computer_file = Get-Content c:\_admin\_script\AD\liste_computer_ad.txt
$LogFile = "c:\_admin\_Script\AD\add_user_to_group_log.txt"

function add_group_function
{
	PARAM(
         [String]$GroupSite,
         [String]$itemF
       	 )
		 
	#Write-Host "$item en cours - $GroupSite"
	#Write-Host $GroupSite
	#Write-Host $itemF
	Write-Host "Add-ADGroupMember -id $GroupSite -Members $itemF"
	try 
	{
		Add-ADGroupMember -id $GroupSite -Members $itemF
		$MyLine = "$item ajouté avec succès à $GroupSite"
		add-content $LogFile $MyLine
	}
	catch
	{
		$MyLine = "$itemF ERREUR"
		add-content $LogFile $MyLine			
	}
}

foreach ($item in $computer_file)
{
	$pc = Get-ADComputer $item
	$pcDN = $pc.DistinguishedName
	
	add_group_function -GroupSite "Groupe-SoftwareXXX" -itemF $pcDN

}
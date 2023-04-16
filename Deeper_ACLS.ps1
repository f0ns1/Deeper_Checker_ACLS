
# Input parameters
param (
    [string]$users = $(throw "-users is required.")
    #[string]$ActiveDirectoryRights = $(throw "-ActiveDirectoryRights is required.GenericRead/GenericAll/ReadProperty/WriteProperty") 
)

# Requiered imports
# 
Import-Module C:\AD\Tools\ADModule-master\Microsoft.ActiveDirectory.Management.dll
Import-Module C:\AD\Tools\ADModule-master\ActiveDirectory\ActiveDirectory.psd1
Import-Module C:\AD\Tools\PowerView.ps1

# Extract recursive groups for input user
function Get-ADPrincipalGroupMembershipRecursive ($SamAccountName)
{
    $groups = @(Get-ADPrincipalGroupMembership -Identity $SamAccountName | select -ExpandProperty distinguishedname)
    $groups
    if ($groups.count -gt 0)
    {
        foreach ($group in $groups)
        {
            Get-ADPrincipalGroupMembershipRecursive $group
        }
    }
}
# Deepr ACLs
function deeper-acls($filter){
   # if (-not ($filter -contains "Domain Users")){
     #   if( -not ($filter -contains "Users" )){
            Get-DomainObjectAcl | select -expandProperty ObjectDN  | Get-Unique | 
            %{$permissions=@(Get-Acl AD:\$_ | 
            select -ExpandProperty Access | 
            ?{$_.IdentityReference -like "*$filter*"} | Format-Table);
            if($permissions){Write-Host $_; Get-ADObject -SearchBase $_ | 
            select name, objectclass ;$permissions}}
     #   }
    #}
}



####
#
# Main Script
# Required user list 
####
Write-Host "Input users to check $users"
foreach($user in $users.Split(" ")){
    Write-Host "User : $user"
    Get-ADPrincipalGroupMembershipRecursive "$user" |
     %{ $filter=$_.Split("=")[1].Split(",")[0]; 
     Write-Host "ACLS for membership $user - $_ - $filter"; 
     deeper-acls $filter} 

}

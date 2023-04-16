# ACLs Deeper Enumeration For Active directory Domain
## Powershell Script

## Script Description
```
Step 1:
  Recursive user group membership checker
Step 2:
  For each user group Membership, the script evaluate every ACL permisions for the target Group across all objects on Active directory domain 
```
## Output
```
If the input group macth with ACL for access on specific Domain object the:
  - Search For the specific object and childs on Domain controller
  - Write table with Access permissions
```

## Requirements

```
  - AD module
  - PowerView Module
```

## Usage 
```
.\Deeper_ACLS.ps1 -users 'mgmtadmin', 'studentuser17'
```
## Output Example
```
CN=Windows Virtual Machine,CN=US-MGMT,OU=Mgmt,DC=us,DC=techcorp,DC=local

name                    objectclass
----                    -----------
Windows Virtual Machine {top, leaf, connectionPoint, serviceConnectionPoint}



      ActiveDirectoryRights InheritanceType ObjectType                           InheritedObjectType                                                          ObjectFlags AccessControlType IdentityReference IsInherited InheritanceFlags
      --------------------- --------------- ----------                           -------------------                                                          ----------- ----------------- ----------------- ----------- ----------------
ReadProperty, WriteProperty     Descendents bf9679c0-0de6-11d0-a285-00aa003049e2 bf967a9c-0de6-11d0-a285-00aa003049e2 ObjectAceTypePresent, InheritedObjectAceTypePresent             Allow US\managers              True ContainerInherit
   CreateChild, DeleteChild             All bf967a9c-0de6-11d0-a285-00aa003049e2 00000000-0000-0000-0000-000000000000                                ObjectAceTypePresent             Allow US\managers              True ContainerInherit
               ReadProperty     Descendents 00000000-0000-0000-0000-000000000000 4828cc14-1437-45bc-9b07-ad6f015e5f28                       InheritedObjectAceTypePresent             Allow US\managers              True ContainerInherit
               ReadProperty     Descendents 00000000-0000-0000-0000-000000000000 bf967aba-0de6-11d0-a285-00aa003049e2                       InheritedObjectAceTypePresent             Allow US\managers              True ContainerInherit
                 GenericAll     Descendents 00000000-0000-0000-0000-000000000000 bf967a9c-0de6-11d0-a285-00aa003049e2                       InheritedObjectAceTypePresent             Allow US\managers              True ContainerInherit


CN=MachineAdmins,OU=Mgmt,DC=us,DC=techcorp,DC=local

name          objectclass
----          -----------
MachineAdmins {top, group}



      ActiveDirectoryRights InheritanceType ObjectType                           InheritedObjectType                                                          ObjectFlags AccessControlType IdentityReference IsInherited InheritanceFlags
      --------------------- --------------- ----------                           -------------------                                                          ----------- ----------------- ----------------- ----------- ----------------
ReadProperty, WriteProperty             All bf9679c0-0de6-11d0-a285-00aa003049e2 bf967a9c-0de6-11d0-a285-00aa003049e2 ObjectAceTypePresent, InheritedObjectAceTypePresent             Allow US\managers              True ContainerInherit
   CreateChild, DeleteChild             All bf967a9c-0de6-11d0-a285-00aa003049e2 00000000-0000-0000-0000-000000000000                                ObjectAceTypePresent             Allow US\managers              True ContainerInherit
               ReadProperty     Descendents 00000000-0000-0000-0000-000000000000 4828cc14-1437-45bc-9b07-ad6f015e5f28                       InheritedObjectAceTypePresent             Allow US\managers              True ContainerInherit
               ReadProperty     Descendents 00000000-0000-0000-0000-000000000000 bf967aba-0de6-11d0-a285-00aa003049e2                       InheritedObjectAceTypePresent             Allow US\managers              True ContainerInherit
                 GenericAll             All 00000000-0000-0000-0000-000000000000 bf967a9c-0de6-11d0-a285-00aa003049e2                       InheritedObjectAceTypePresent             Allow US\managers              True ContainerInherit

```




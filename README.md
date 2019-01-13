# Google Drive Integration with Salesforce

## Dev, Build and Test

`Getting Started`
```
sfdx force:org:create -f ./config/project-scratch-def.json -a <Scratch Org Name> -s -d 7
sfdx force:package:installed:list -u <Org/Sandbox name e.g. CatchDev>
sfdx force:package:install -p 04tA00000003HLnIAM -w 30 -u <Scratch Org Name>
sfdx force:package:install -p 04tB0000000JwEiIAK -w 30 -u <Scratch Org Name>
sfdx force:source:push -u <Scratch Org Name>
```

`Giving permission sets to the scratch org user`
```
sfdx force:user:permset:assign -n Buyer -u <Scratch Org Name>
```

## Resources


## Description of Files and Directories


## Issues



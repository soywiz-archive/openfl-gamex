rm deploy.zip
7za a -tzip -mx=9 deploy.zip -r -x!.git -x!obj -x!project/obj -xr!*.pdb -xr!all_objs -x!tools -x!out -x!*.iws -x!deploy.bat -x!example -x!.DS_Store -x!project -x!deploy -x!tests -x!build*.bat -x!build*.sh
haxelib submit deploy.zip
rm deploy.zip

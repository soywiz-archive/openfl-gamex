@echo off
pushd %~dp0
del deploy.zip 2> NUL
"%~dp0\tools\7z" a -tzip -mx=9 deploy.zip -r -x!.git -x!obj -x!project/obj -xr!*.pdb -xr!all_objs -x!tools -x!out -x!*.iws -x!deploy.bat -x!example -x!.DS_Store -x!project -x!deploy -x!tests -x!build*.bat -x!build*.sh
haxelib submit deploy.zip
del deploy.zip 2> NUL
popd
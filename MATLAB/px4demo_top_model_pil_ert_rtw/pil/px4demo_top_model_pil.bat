@echo off

cd .

if "%1"=="" ("C:\PROGRA~1\MATLAB\R2020b\bin\win64\gmake"  -f px4demo_top_model_pil.mk postdownload_preexecute all) else ("C:\PROGRA~1\MATLAB\R2020b\bin\win64\gmake"  -f px4demo_top_model_pil.mk postdownload_preexecute %1)
@if errorlevel 1 goto error_exit

exit 0

:error_exit
echo The make command returned an error of %errorlevel%
exit 1
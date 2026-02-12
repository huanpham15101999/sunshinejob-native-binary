for %%f in ("C:\Users\ADMIN\Documents\New folder\*.jar") do (
  mvn install:install-file -Dfile="%%f" -DgroupId=ext.lib -DartifactId=%%~nf -Dversion=1.0 -Dpackaging=jar
)

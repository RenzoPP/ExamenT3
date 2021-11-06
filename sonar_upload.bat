dotnet C:\SonarScaner\SonarScanner.MSBuild.dll begin /k:"N00126080_T3" /d:sonar.login="99a90b4a3180896ae2c900f5b15f94fdfa4c77a4" /d:sonar.host.url="https://sonar.lumenes.tk"

dotnet build

dotnet sonarscanner end /d:sonar.login="99a90b4a3180896ae2c900f5b15f94fdfa4c77a4"
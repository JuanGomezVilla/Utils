9. Crear una carpeta *assets* y pegar dentro un *icon.ico*
10. Abrir el archivo *.csproj* y añadir
    ```xml
    <PropertyGroup>
        ...
        <ApplicationIcon>assets/icon.ico</ApplicationIcon>
        ...
    </PropertyGroup>

    <ItemGroup>
        <Folder Include="assets\" />
        <Resource Include="assets/icon.ico" />
    </ItemGroup>
    ```
11. En el archivo *MainWindow.xaml*:
    ```xml
    <Window ...
        Icon="/assets/icon.ico"
        ...>
    ```


## Bajo estudio
- ¿Qué hace este fragmento en *MainWindow.xaml*?
    ```xml
	<Window.Resources>
		<ResourceDictionary>
			<ResourceDictionary.MergedDictionaries>
				<ResourceDictionary
					Source="pack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.ToggleButton.xaml" />
			</ResourceDictionary.MergedDictionaries>
		</ResourceDictionary>
	</Window.Resources>
    ```




dotnet publish -c Release -r win-x64 --self-contained true


dotnet publish -c Release -r win-x64 --self-contained true ^
 /p:PublishReadyToRun=false ^
 /p:DebugType=None ^
 /p:DebugSymbols=false


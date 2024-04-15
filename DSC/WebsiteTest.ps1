Configuration WebsiteTest {

    # Import the module that contains the resources we're using.
    Import-DscResource -ModuleName PsDesiredStateConfiguration

    # Specifies which targets this configuration will be applied to.
    Node 'localhost' {

        # Ensures that the Web-Server (IIS) feature is enabled.
        WindowsFeature WebServer {
            Ensure = "Present"
            Name   = "Web-Server"
        }

        # Ensures that the website content copied to the website root folder.
        File WebsiteContent {
            Ensure = "Present"
            SourcePath = "C:\DSC\Index.htm"
            DestinationPath = "C:\inetpub\wwwroot"
        }
    }
}
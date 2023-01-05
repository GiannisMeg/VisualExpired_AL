codeunit 50120 TresholdSetupManagement
{
    procedure RunTresholdSetup(var TresholdSetupNotification: Notification)
    var
        ThresholdSetupPage: Page ThresholdSetup;

    begin
        ThresholdSetupPage.Run();
    end;


}
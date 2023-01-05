codeunit 50120 ThresholdSetupManagement
{
    local procedure RunThresholdSetup(var TresholdSetupNotification: Notification)
    var
        ThresholdSetupPage: Page ThresholdSetup;

    begin
        ThresholdSetupPage.Run();
    end;


}
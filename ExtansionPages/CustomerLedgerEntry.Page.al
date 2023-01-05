pageextension 50121 CustomerLedgerEntryExts extends "Customer Ledger Entries"
{
    layout
    {
        // control1 is the name of the extended table repeater
        addlast(Control1)
        {
            // after we add the write parameter in the addlast section accept the value of NumberOFDaysExpired
            field(NumberofDaysExpired; NumberofDaysExpired)
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Number of days';
                ToolTip = 'The number of days this entry is expired, bsed upon Due date and today.';
                StyleExpr = DaysExpiredStyle;
            }
        }
    }

    views
    {
        addfirst
        {
            view("Open Entries")
            {
                Caption = 'Open entries';
                OrderBy = ascending("Due Date");
                Filters = where(Open = const(true));
                SharedLayout = false;

                layout
                {
                    movefirst(Control1; NumberOfDaysExpired)
                    moveafter(NumberOfDaysExpired; "Due Date")
                }
            }
        }
    }

    var
        NumberofDaysExpired: Integer;
        DaysExpiredStyle: Text;
        TresholdSetup: Record ThresholdSetup; // directs to table ThreshholdSetup

    trigger OnOpenPage()
    begin
        if not TresholdSetup.Get() then begin
            ShowThresholdSetupNotification();
            CurrPage.Update();
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        NumberofDaysExpired := rec.GetNumberOfDaysExpired();
        case NumberofDaysExpired of
            TresholdSetup."Threshold 1 Value" .. TresholdSetup."Threshold 2 Value":
                DaysExpiredStyle := format(TresholdSetup."Threshold 1 Style");
            TresholdSetup."Threshold 2 Value" .. 99999:
                DaysExpiredStyle := format(TresholdSetup."Threshold 2 Style");
            else
                DaysExpiredStyle := 'None';
        end;
    end;

    local procedure ShowThresholdSetupNotification()
    var
        TresholdSetupNotification: Notification;
        // when we define a label should end in Tt,Msg,Lbl,Qst,Tok.Err so we need to use the write Suffix
        TresholdSetupNotificarionMsg: Label 'You need to run the Treshold Setup:';
        TresholdSetupNotificarionActionLbl: Label 'Click here to run the TresholdSetup';
    begin
        TresholdSetupNotification.Message(TresholdSetupNotificarionMsg);
        TresholdSetupNotification.AddAction(TresholdSetupNotificarionActionLbl, Codeunit::"TresholdSetupManagement", 'RunTresholdSetup');
        TresholdSetupNotification.Send();
    end;
}
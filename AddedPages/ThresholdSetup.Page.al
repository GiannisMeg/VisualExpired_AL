page 50102 ThresholdSetup
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ThresholdSetup;
    InsertAllowed = false;
    DeleteAllowed = false;
    Caption = 'Threshold Setup';


    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Threshold 1 Style"; Rec."Threshold 1 Style")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Threshold 1 Style field.';
                }
                field("Threshold 2 Style"; Rec."Threshold 2 Style")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Threshold 2 Style field.';
                }
                field("Threshold 1 Value"; Rec."Threshold 1 Value")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Threshold 1 Value field.';
                }
                field("Threshold 2 Value"; Rec."Threshold 2 Value")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Threshold 2 Value field.';
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {


        }
    }
    // trigger OnOpenPage()
    // begin
    //     if not Get() then Insert();
    // end;

}
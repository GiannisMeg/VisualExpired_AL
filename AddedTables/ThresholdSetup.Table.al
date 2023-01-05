table 50110 ThresholdSetup
{
    DataClassification = CustomerContent;
    Caption = 'Threshhold Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Primary Key';
        }
        field(2; "Threshold 1 Value"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Threshold 1 Value';

        }
        field(3; "Threshold 2 Value"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Threshold 2 Value';
        }
        field(4; "Threshold 1 Style"; Enum "Style Type")


        {
            DataClassification = CustomerContent;
            Caption = ' Threshold 1 Style';
        }
        field(5; "Threshold 2 Style"; Enum "Style Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Threshold 2 Style';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
tableextension 50120 CustomerLedgerEntryExts extends "Cust. Ledger Entry"
{
    // we have to declare after the procedure the datatype of outcome instead to prevent errors
    procedure GetNumberOfDaysExpired(): Integer

    begin
        // Today is a built in funtion we can use it globaly
        if Today() <= "Due Date" then
            // exit the calc 
            exit(0);

        // we can calculate direclty after the begin start without to make use of a specific mehtod()
        NumberOfDays := "Due Date" - Today();
        // Dont forget to exit and then pass the method or value in it 
        exit(Abs(NumberOfDays));
    end;

    var
        // store numbr of days we want to calculate in a var
        NumberOfDays: Integer;
}
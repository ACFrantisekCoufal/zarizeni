table 50101 "Zařízení"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "ID"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Editable = false;

        }


        field(2; "Název"; Text[20])
        {
            DataClassification = ToBeClassified;

        }

        field(3; "Popis"; Text[50])
        {
            DataClassification = ToBeClassified;

        }

        field(4; "Množství"; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if Rec."Množství" < 0 then begin
                    Message('Zadejte kladné číslo'); //podmínka
                    Rec."Množství" := 0; //přiřazení
                    rec.Modify();
                end;
            end;

        }
    }



    keys
    {
        key(PK1; ID)
        {
            Clustered = true;
        }
    }
}

page 50111 "Zařízení na vypůjčení"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Zařízení";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;

                }
                field("Název"; Rec."Název")
                {
                    ApplicationArea = All;

                }
                field(Popis; Rec.Popis)
                {
                    ApplicationArea = All;

                }
                field("Množství"; Rec."Množství")
                {
                    ApplicationArea = All;

                }
            }
        }
    }

}
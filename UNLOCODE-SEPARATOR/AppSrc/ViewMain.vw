Use Windows.pkg
Use DFClient.pkg
Use cProgressBar.pkg
Use cLinkLabel.pkg
Use cSplitButton.pkg
Use TrckBr.pkg

Use Update.pkg
Use Search.pkg

Open Locode
Open Maintenance

String sValueTextBox

tSfor tsSfor2

Integer iSearchFunctionNumber iSearchBy

Activate_View Activate_oViewMain for oViewMain
Object oViewMain is a dbView

    Set Border_Style to Border_Thick
    Set Size to 62 220
    Set Location to 0 1
    Set Label to "Unlocode Separator"

    Object oButton2 is a Button
        Set Size to 14 53
        Set Location to 6 160
        Set Label to "Update DB"
    
        // fires when the button is clicked
        Procedure OnClick
            Send initUpdate
        End_Procedure
    
    End_Object

   Object oButton1 is a cSplitButton
       Set Size to 14 73
    Set Location to 6 9
    Set Label to 'Search By'
    Move 0 to iSearchBy    
   
    Procedure OnClick
        
        Get Value of oForm1 to sValueTextBox
        
        If (sValueTextBox eq "") Procedure_Return
        Get SearchingFN sValueTextBox iSearchFunctionNumber iSearchBy to tsSfor2
        
        Showln ("CHANGE : "+tsSfor2.sChange)
        Showln ("LOCODE : "+tsSfor2.sLocode)
        Showln ("NAME : "+tsSfor2.sName)
        Showln ("SUBDIV : "+tsSfor2.sSubDiv)
        Showln ("STATUS : "+tsSfor2.sStatus)
        Showln ("IATA : "+tsSfor2.sIata)
        Showln ("COORDINATES : "+tsSfor2.sCoordinates)
        Showln ("REMARKS : "+tsSfor2.sRemarks)
    End_Procedure

    Object oButtonMenu is a cCJContextMenu
        Object oMenuItem1 is a cCJMenuItem
            Set psCaption to "Search By Name"

            Procedure OnExecute Variant vCommandBarControl
                Delegate Set Label to "Search By Name"
                Move 1 to iSearchBy
            End_Procedure
        End_Object
    End_Object

    Set phoButtonPopup to oButtonMenu 
End_Object

    Object oRadioGroup1 is a RadioGroup
        Set Location to 23 9
        Set Size to 34 204
        Set Label to "Function"
    
        Object oRadio1 is a Radio
            Set Label to "Ports"
            Set Size to 10 34
            Set Location to 10 5
        End_Object
    
        Object oRadio2 is a Radio
            Set Label to "RailTerminals"
            Set Size to 10 62
            Set Location to 10 45
        End_Object
    
        Object oRadio3 is a Radio
            Set Label to "RoadTerminals"
            Set Size to 10 61
            Set Location to 10 127
        End_Object
        
        Object oRadio4 is a Radio
            Set Label to "Airports"
            Set Size to 10 35
            Set Location to 21 5
        End_Object
         
        Object oRadio5 is a Radio
            Set Label to "PostalExchangeOffices"
            Set Size to 10 78
            Set Location to 22 45
        End_Object
          
        Object oRadio6 is a Radio
            Set Label to "MultimodalFunctions"
            Set Size to 10 77
            Set Location to 22 127
        End_Object
    
        Procedure Notify_Select_State Integer iToItem Integer iFromItem
            Handle hoRadio
            
            Forward Send Notify_Select_State iToItem iFromItem
           
            Case Begin
                Case (iToItem = 0)
                        Move 1 to iSearchFunctionNumber
                    Case Break
                Case (iToItem = 1)
                        Move 2 to iSearchFunctionNumber
                    Case Break
                Case (iToItem = 2)
                        Move 3 to iSearchFunctionNumber
                    Case Break
                Case (iToItem = 3)
                        Move 4 to iSearchFunctionNumber
                    Case Break
                Case (iToItem = 4)
                        Move 5 to iSearchFunctionNumber
                    Case Break
                Case (iToItem = 5)
                        Move 6 to iSearchFunctionNumber
                    Case Break
            Case End
        End_Procedure   
    End_Object

    Object oForm1 is a Form
        Set Size to 13 69
        Set Location to 6 86
        
        Procedure OnChange
            String sValue
        
            Get Value to sValue
        End_Procedure
    
    End_Object
End_Object

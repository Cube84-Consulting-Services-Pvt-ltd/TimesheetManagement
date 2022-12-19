@isTest
private class timesheetmanagement_Test{
    
    @TestSetup
    public static void setup(){
        Case caseObj = new Case();
        insert caseObj;
        List<Timesheet_Entry__c> lstTimesheets = new List<Timesheet_Entry__c>();
        Timesheet_Entry__c drTimesheet_Entry=new Timesheet_Entry__c(Program__c='Recruitment',Week_Start_Date__c=Date.today());
        Timesheet_Entry__c drTimesheet_Entry2=new Timesheet_Entry__c(Program__c='Recruitment',Week_Start_Date__c=Date.today().toStartofWeek()+1, Request__c=caseObj.Id);
        lstTimesheets.add(drTimesheet_Entry);
        lstTimesheets.add(drTimesheet_Entry2);
        Database.insert(lstTimesheets,false);
    }
    
    @isTest
    private static void onloadfunction_Test(){
        Case caseObj = [select Id from Case Limit 1];
        Test.startTest();
        timesheetmanagement obj = new timesheetmanagement(null);
        obj.caseId = caseObj.Id;
        obj.onloadfunction();
        obj.timesheetEntry.Week_Start_Date__c = System.today().toStartofWeek()+1;
        obj.timesheetEntry.Program__c = 'Screening';
        obj.otherentries = new List<Timesheet_Entry__c>{obj.timesheetEntry};
        obj.onloadfunction();
        Test.stopTest();
    }
    @isTest
    private static void getotherentrylist_Test(){
        Test.startTest();
        timesheetmanagement obj = new timesheetmanagement(null);
        obj.getotherentrylist();
        Test.stopTest();
    }
    @isTest
    private static void addrowothers_Test(){
        Test.startTest();
        timesheetmanagement obj = new timesheetmanagement(null);
        obj.addrowothers();
        Test.stopTest();
    }
    @isTest
    private static void savetimesheet_Test(){
        Case caseObj = [select Id from Case Limit 1];
        Test.startTest();
        timesheetmanagement obj = new timesheetmanagement(null);
        obj.caseId = caseObj.Id;
        obj.onloadfunction();
        obj.timesheetEntry.Week_Start_Date__c = System.TODAY();
        obj.timesheetEntry.Program__c = 'Recruitment';
        obj.otherentries = new List<Timesheet_Entry__c>{obj.timesheetEntry,obj.timesheetEntry};
        obj.savetimesheet();
        Test.stopTest();
    }
    @isTest
    private static void sumDoubles_Test(){
        Test.startTest();
        timesheetmanagement obj = new timesheetmanagement(null);
        obj.sumDoubles(1.1,1.1);
        obj = new timesheetmanagement(null);
        obj.sumDoubles(null,1.1);
        Test.stopTest();
    }
}
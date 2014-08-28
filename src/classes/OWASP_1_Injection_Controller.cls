public with sharing class OWASP_1_Injection_Controller {
	public List<Order__c> orders {public get; private set;}

	public OWASP_1_Injection_Controller() {

		// Anti-pattern - use of un-sanitised input from the id parameter 
		// before using in a query. Either sanitise the content of the id
		// parameter, use a placeholder (e.g. :customerID), or use 
		// non-Dynamic SOQL syntax.

		// Demo explanation:
		// This page was intended to allow customers to see their orders via a URL
		// they are sent by an Account Manager, without requiring the customer to 
		// login. Because it is vulnerable to SOQL injection, the URL parameter
		// can be modified to return more data than the developer intended.

		// Demo instructions:
		// 0. Make sure there are Orders (Custom object) in the system that 
		//    belong to different customers.
		// 1. View /apex/OWASP_1_Injection?<CustomerID> (where <CustomerID>
		//    is the record ID of a Contact used on an order) - only customer's
		//	  orders are shown
		// 2. View /apex/OWASP_1_Injection?Customer__c=<CustomerID>%27%20or%20Customer__c!=%
		//    All orders where Customer__c != '' are shown.

		// Get ID Parameter
		String customerID = ApexPages.currentPage().getParameters().get('Customer__c');

		orders = new List<Order__c>();

		String queryString = 'select Name, Address__c, Customer__r.Name, ' + 
								'Order_Date__c, Product_Purchased__r.Name ' +
								'from Order__c where Customer__c = \'';

		orders = Database.query(queryString + customerID + '\'');
	}
}
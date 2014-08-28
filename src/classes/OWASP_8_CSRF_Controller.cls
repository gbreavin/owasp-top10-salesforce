/* OWASP_8_CSRF_Controller
	Controller for the OWASP_8_CSRF page which can be used to demonstrate a CSRF
	vulnerability. The page mark up explains this in detail.
*/
public with sharing class OWASP_8_CSRF_Controller {
	private ApexPages.StandardController standardController;

	public OWASP_8_CSRF_Controller(ApexPages.StandardController cont) {
		this.standardController = cont;
	}

	public PageReference setOrderToShipped() {
		System.debug(standardController);

		Order__c order = (Order__c) standardController.getRecord();
		System.debug(order);

		// Anti-pattern
		// This method is called from a Page's action attribute, and this method
		// modifies data in the system. This potentially leads to modification of
		// data in GET requests to the page, which a user's browser can be tricked 
		// into making

		if(order.ID != null) {
			order.Status__c = 'Paid';
			Database.update(order);
			
			return new PageReference('/' + order.ID);	
		} else {
			return new PageReference('/home/home.jsp');	
		}
	}
}
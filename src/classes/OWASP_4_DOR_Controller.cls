/* OWASP_4_DOR_Controller
	Controller for the OWASP_4_DOR page that demonstrates Insecure Direct Object References
	vulnerability - see the page markup for explanation of the scenario and how it exhibits
	the problem.
*/
public with sharing class OWASP_4_DOR_Controller {
	public Order__c order {get; private set;}

	public OWASP_4_DOR_Controller() {
		// Anti-pattern
		// When used on a public page, and the parameter obviously conforms to a particular
		// pattern (such as an auto-number), trying other record IDs is trivial, and may
		// expose data to unintended audiences.

		// There are two alternatives:
		// 1. Using authentication and database features to control visibility of data. This
		// 	  way, the data will not be exposed by the database unless the requester is
		// 	  authorise to view it.
		//
		// 2. Use a non-guessable, non-predictable identifier instead. For example, a random
		//	  string that is generated as the record is created. Doing this well is easier 
		// 	  said than done, and out of scope - make sure you understand what you are doing 
		//	  well enough to be sure what you are doing is sensible and works.
		//
		//	  For example, hashing the ID of a record may seem like a good way of producing
		// 	  a random string, but is not infallible - if someone can see the hash, and the 
		// 	  details used to create that hash, they may try different combinations of details 
		//    to see if they can recreate their hash. If they succeed (in this case, using the 
		//	  ID), they can generate a bunch of IDs, hash them, and see which ones worked.
		//
		// 	  Even encryption poorly applied can produce bad results, and worse, a false sense
		// 	  of security. This is not to scare anybody off of this approach, but approach with
		// 	  care.


		String orderNumber = ApexPages.currentPage().getParameters().get('order_number');

		if(orderNumber != null) {

			order = [select Order__c.Customer__r.Name, Order__c.Name, 
							Order__c.Address__c, Order__c.Product_Purchased__r.Name, 
							Order__c.Price_Paid__c, Order__c.Status__c
					from Order__c
					where Name = :orderNumber];
		} else {
			order = new Order__c();
		}

	}
}
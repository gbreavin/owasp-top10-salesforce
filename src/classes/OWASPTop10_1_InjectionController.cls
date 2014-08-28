public with sharing class OWASPTop10_1_InjectionController {
	public List<Case> cases {get; set;}
	public String contactNumber = '';

	public OWASPTop10_1_InjectionController() {
		// Get Parameter from URL
		contactNumber = ApexPages.currentPage().getParameters().get('cn');

		// Query for cases that match
		cases = Database.query('select ID from Case where CaseNumber = :contactNumber');
		
	}
}
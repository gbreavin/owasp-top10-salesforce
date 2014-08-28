/* OWASP_3_XSS_Controller
	Controller for the OWASP_3_XSS VF page that demonstrates XSS in Visualforce
	pages. See the page markup for more details.
*/
public with sharing class OWASP_3_XSS_Controller {
	public String searchTerm {public get; private set;}

	public OWASP_3_XSS_Controller() {
		if(ApexPages.currentPage().getParameters().containsKey('query')) {
			searchTerm = ApexPages.currentPage().getParameters().get('query');
		} else {
			searchTerm = '';
		}
	}

	@RemoteAction
    public static String doASearch(String searchTerm) {
        Account account = [SELECT Id, Name, Phone, Type, NumberOfEmployees, Description
                   FROM Account WHERE Name = :searchTerm limit 1];
        return System.JSON.serialize(account);
    }
}
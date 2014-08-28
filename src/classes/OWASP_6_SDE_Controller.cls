/* OWASP_6_SDE_Controller
	Controller for the OWASP_6_SDE page that demonstreates Secure Data Exposure. Part of
	the vulnerability is actually the fields that exist on Contact - see the page markup
	for more explanation. The login() method herealso logs the details entered.
*/
public with sharing class OWASP_6_SDE_Controller {
	public String username {get; set;}
	public String password {get; set;}
	public String result {get; set;}

	public OWASP_6_SDE_Controller() {
		
	}

	public PageReference login() {
		// Anti-pattern
		// Simply put - if you're handling sensitive data, avoid logging it!

		System.debug(username);
		System.debug(password);

		result = 'Authenticated!';

		return null;
	}
}
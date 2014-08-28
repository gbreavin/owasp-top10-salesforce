public with sharing class OWASP_10_URF_Controller {
	public String returnURL {public get; private set;}

	public OWASP_10_URF_Controller() {
		// Anti-pattern
		// Return URL is plucked from the URL parameter, but not check is done.
		// As this URL is used to direct the user when they are finished, this
		// could take a user anywhere, simply by changing the URL parameter 
		// value and sending it to someone who clicks on it.

		// To deal with this, a list of valid values for returnURL could be
		// mapped to the actual URLs - the value in the URL could then be 
		// cross-referenced with a URL in a map - see example below.

		returnURL = ApexPages.currentPage().getParameters().get('returnURL');

		/*
			// This map would likely be class-level. Alternatively, could be 
			// achieved with Custom Settings
			Map<String, String> urlCodeToURL = new Map<String, String>() {
				'con' => '/003/o',
				'acc' => '/001/o'
			}

			if(urlCodeToURL.containsKey(returnURL)) {
				returnURL = urlCodeToURL.get(returnURL); 
			} else {
				returnURL = '/home/home.jsp';
			}
		*/
	}

	public PageReference returnToRecord() {
		return new PageReference(returnURL);
	}
}
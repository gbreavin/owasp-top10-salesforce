owasp-top10-salesforce
======================

A collection of examples of what OWASP Top 10 vulnerabilities look like on Salesforce, including examples you can use to see how these vulnerabilities work.

Purpose
-------
The [OWASP Top 10](https://www.owasp.org/index.php/Top_10_2013-Top_10) lists the top 10 most critical web application vulnerabilities to help educate those who buils such applications about the possible threats. This repo contains example code that demonstrates how these vulnerabilities can occur on Force.com

Background
----------
These examples were presented at the August 2014 Sydney Salesforce Developers meetup. The accompanying [slide deck](http://www.slideshare.net/gbreavin/owasp-top10salesforce) provides more examples on each of the vulnerabilities, as well as prevention against them.

Scenario
--------
The examples are created with an overarching scenario in mind. This codebase is part of a fictional company's Salesforce customisation, and in the codebase, they've made a number of errors that potentially leave them vulnerable in a number of ways.

The company sell products to customers. Customers are represented as Accounts and Contacts, and their purchases represented as Orders - in this case, a Custom Object has been created rather than the standard Order object.

I have tried to explain the relevant scenario for each example, but broadly, customers place an order in the system, and are contacted at a later date for payment. Once an order is paid for, it is marked as Shipped. Customers are usually external, but employees can also make purchases. The company has measures in place to prevent employees working on their own orders - though these measures aren't included here in this repo.

In some examples, the Visualforce pages are intended for internal users, though occasionally there are pages intended for customers. In these cases, the company have tried to avoid incurring extra license costs, so there are no authentication mechanisms in place i.e. these are intended to be exposed on a Force.com Site.

FAQs
----
**Why aren't there examples for all vulnerabilities in the top 10?**

Generally speaking, some of the vulnerabilities don't apply to the Force.com platform. For example, you don't have to maintain the software stack the server runs, so items that relate to software updates don't really apply (though having said that, don't forget about libraries you may be using).

Some vulnerabilities relate more to sharing and security setup within Salesforce.com. Capturing such examples in metadata is pretty laborious, for little gain. Therefore, the focus of this repo is to capture examples that require code.

**Aren't these examples a little 'out there'?**

The word I used when presenting this was 'tortured'. However, the examples are supposed to give enough context to highlight the vulnerabilities without needing to be overly specific and detailed. The point is not to consider these threats when you're making an application in the same context of the scenario explained above, but to consider these threats whenever or wherever they may rear their head. The details of a more realistic example would possibly get in the way of the core points of each vulnerability.

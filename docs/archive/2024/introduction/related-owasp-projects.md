# Related OWASP Projects

OWASP is a volunteer-driven organization. Those volunteers contributed many useful documents, and this section points to some related OWASP documents and projects:

## OWASP Top 10

The best-known OWASP document is the [OWASP Top 10](https://owasp.org/Top10/). They detail the most common web application vulnerabilities and are also the base for this document. In contrast, this document is focused on defensive techniques and controls as opposed to risks. Each control in this document will map to one or more items in the risk-based OWASP Top 10. This mapping information is included at the end of each control description.

## OWASP ASVS

[The OWASP Application Security Verification Standard (ASVS)](https://owasp.org/www-project-application-security-verification-standard/) is a catalog of available security requirements and verification criteria. OWASP ASVS can be a source of detailed security requirements for development teams. Security requirements are categorized into different buckets based on a shared higher order security function. For example, the ASVS contains categories such as authentication, access control, error handling / logging, and web services. Each category contains a collection of requirements that represent the best practices for that category drafted as verifiable statements.

## OWASP SAMM

[Software Assurance Maturity Model (SAMM)](https://www.opensamm.org/) is an open framework to help organizations implement a strategy for maturing the software security tailored to the specific risks of the organization. . [SAMM](https://owaspsamm.org/about/) supports the complete software life cycle and can be used to identify what

## Threat Modeling in General

Threat Modeling is an important part of secure application development, which can help identify potential security threats, derive security requirements, and tailor security controls to prevent potential threats. Successful use of security requirements involves four steps: discovery, documentation, implementation, and verification of the correct implementation of the functionality within an application. Threat modelling is one way to derive security requirements. Other sources are: industry standards, applicable laws, history of past vulnerabilities. Modeling tools, like [OWASP Threat Dragon](https://owasp.org/www-project-threat-dragon/) can be used to create threat model diagrams as part of a secure development life cycle.

## Domain-Specific Documents

It is important to notice that this document primarily focuses on web applications, but other Top 10s could apply to your application, too. Examples of those are:

- OWASP API Top 10
- OWASP Mobile Application Top 10

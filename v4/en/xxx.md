---

layout: col-sidebar
tags: OWASP Top Ten Proactive Controls 2024, Appendix
document: OWASP Top Ten Proactive Controls 2024
order: 15

---

Appendix

# Document Security Requirements and automatically test them

Threat Modeling and Security Design Review are an important part of secure application development. Alas this OWASP document focuses upon Security Controls and thus we have a chicken-and-egg problem: a document with a list of proactive security controls should not start with “perform threat modeling to gather security controls”.
We still believe threat modeling to be essential and thus have added it to the appendix.

## Description

Threat modeling can be applied to identify potential security threats, derive security requirements, and tailor security controls to prevent those.
A security requirement is a statement of needed security functionality that ensures one of many different security properties of software is being satisfied. Security requirements are derived from industry standards, applicable laws, and a history of past vulnerabilities. Security requirements define new features or additions to existing features to solve a specific security problem or eliminate a potential vulnerability.
Security requirements provide a foundation of vetted security functionality for an application. Instead of creating a custom approach to security for every application, standard security requirements allow developers to reuse the definition of security controls and best practices. Those same vetted security requirements provide solutions for security issues that have occurred in the past. Requirements exist to prevent the repeat of past security failures.

## Implementation

Successful use of security requirements involves four steps. The process includes discovering / selecting, documenting, implementing, and then confirming correct implementation of new security features and functionality within an application.

### Discovery and Selection / Threat Modeling

Perform Threat Modeling to identify and rank potential security controls.
The process begins with discovery and selection of security requirements. In this phase, the developer is understanding security requirements from a standard source such as ASVS and choosing which requirements to include for a given release of an application. The point of discovery and selection is to choose a manageable number of security requirements for this release or sprint, and then continue to iterate for each sprint, adding more security functionality over time.

### Investigation and Documentation

During investigation and documentation, the developer reviews the existing application against the new set of security requirements to determine whether the application currently meets the requirement or if some development is required. This investigation culminates in the documentation of the results of the review.

### Secure Implementation

After the need is determined for development, the developer must now modify the application in some way to add the new functionality or eliminate an insecure option. In this phase the developer first determines the design required to address the requirement, and then completes the code changes to meet the requirement.

### Test with Misuse Cases

Test cases should be created to confirm the existence of the new functionality or disprove the existence of a previously insecure option.
The ASVS requirements are basic verifiable statements which can be expanded upon with user stories and misuse cases. The advantage of a user story or misuse case is that it ties the application to exactly what the user or attacker does to the system, versus describing what the system offers to the user.
Here is an example of expanding on an ASVS 3.0.1 requirement. From the “Authentication Verification Requirements” section of ASVS 3.0.1, requirement 2.19 focuses on default passwords.
2.19 Verify there are no default passwords in use for the application framework or any components used by the application (such as "admin/password").
This requirement contains both an action to verify that no default passwords exist, and also carries with it the guidance that no default passwords should be used within the application.
An abuse case is an automated test that tries to break the system. It is an inverted user story that should fail if the attacker is able to abuse the system, e.g.:
As an attacker, I can enter in a default username and password to gain access.
This story contains the same message as the traditional requirement from ASVS, with additional user or attacker details to help make the requirement more testable.

## Vulnerabilities Prevented

Security requirements define the security functionality of an application. Better security built in from the beginning of an applications life cycle results in the prevention of many types of vulnerabilities and overall design flaws

- OWASP Top 10 2021-A04_2021-Insecure Design

## References

- ​​[OWASP Application Security Verification Standard (ASVS)](https://owasp.org/www-project-application-security-verification-standard/)
- [OWASP Mobile Application Security Verification Standard (MASVS)](https://owasp.org/www-project-mobile-security-testing-guide/)
- [OWASP Top Ten](https://owasp.org/www-project-top-ten/)
- OWASP Cheat Sheet : [Abuse Case](https://cheatsheetseries.owasp.org/cheatsheets/Abuse_Case_Cheat_Sheet.html)
1. <https://securitypatterns.io/what-is-a-security-pattern/> [↑](#footnote-ref-1)
2. <https://www.cisa.gov/sites/default/files/2023-06/principles_approaches_for_security-by-design-default_508c.pdf> [↑](#footnote-ref-2)

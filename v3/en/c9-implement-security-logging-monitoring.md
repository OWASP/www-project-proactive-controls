---

layout: col-document
tags: 
document: OWASP Top Ten Proactive Controls 2018
order: 13

---

# C9: Implement Security Logging and Monitoring

## Description
Logging is a concept that most developers already use for debugging and diagnostic purposes. Security logging is an equally basic concept: to log security information during the runtime operation of an application. Monitoring is the live review of application and security logs using various forms of automation. The same tools and patterns can be used for operations, debugging and security purposes.

## Benefits of Security Logging
Security logging can be used for:
1. Feeding intrusion detection systems
2. Forensic analysis and investigations
3. Satisfying regulatory compliance requirements

## Security Logging Implementation
The following is a list of security logging implementation best practices.

* Follow a common logging format and approach within the system and across systems of an organization. An example of a common logging framework is the Apache Logging Services which helps provide logging consistency between Java, PHP, .NET,  and C++ applications.
* Do not log too much or too little. For example, make sure to always log the timestamp and identifying information including the source IP and user-id, but be careful not to log private or confidential data.
* Pay close attention to time syncing across nodes to ensure that timestamps are consistent.


### Logging for Intrusion Detection and Response
Use logging to identify activity that indicates that a user is behaving maliciously. Potentially malicious activity to log includes:

* Submitted data that is outside of an expected numeric range.
* Submitted data that involves changes to data that should not be modifiable (select list, checkbox or other limited entry component).
* Requests that violate server-side access control rules.
* A more comprehensive list of possible detection points is available [here])https://www.owasp.org/index.php/AppSensor_DetectionPoints).

When your application encounters such activity, your application should at the very least log the activity and mark it as a high severity issue.  Ideally, your application should also respond to a possible identified attack, by for example invalidating the user’s session and locking the user's account. The response mechanisms allows the software to react in realtime to possible identified attacks. 

## Secure Logging Design
Logging solutions must be built and managed in a secure way. Secure Logging design may include the following:

* Encode and validate any dangerous characters before logging to prevent [log injection](https://www.owasp.org/index.php/Log_Injection) or [log forging](https://www.owasp.org/index.php/Log_Forging) attacks.
* Do not log sensitive information. For example, do not log password, session ID, credit cards, or social security numbers.
* Protect log integrity. An attacker may attempt to tamper with the logs. Therefore, the permission of log files and log changes audit should be considered.
* Forward logs from distributed systems to a central, secure logging service. This will sure log data cannot be lost if one node is compromised. This also allows for centralized monitoring.

## References
* [OWASP AppSensor Detection Points](https://www.owasp.org/index.php/AppSensor_DetectionPoints) - Detection points used to identify a malicious user probing for vulnerabilities or weaknesses in application.
* [OWASP Log injection](https://www.owasp.org/index.php/Log_Injection)
* [OWASP Log forging](https://www.owasp.org/index.php/Log_Forging)
* [OWASP Cheat Sheet: Logging](https://www.owasp.org/index.php/Logging_Cheat_Sheet>`_ How to properly implement logging in an application 
* [OWASP Development Guide: Logging](https://www.owasp.org/index.php/Error_Handling,_Auditing_and_Logging#Logging)
* [OWASP Code Review Guide: Reviewing Code for Logging Issues](https://www.owasp.org/index.php/Reviewing_Code_for_Logging_Issues)

## Tools
* [OWASP Security Logging Project](https://www.owasp.org/index.php/OWASP_Security_Logging_Project)
* [Apache Logging Services](https://logging.apache.org/)

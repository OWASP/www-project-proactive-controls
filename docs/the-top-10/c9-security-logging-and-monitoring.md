# C9: Implement Security Logging and Monitoring

## Description

Logging is a concept that most developers already use for debugging and diagnostic purposes. Security logging is an equally basic concept: to log security information during the runtime operation of an application.

Monitoring is the live review of application and security logs using various forms of automation. The same tools and patterns can be used for operations, debugging and security purposes.

The goal of secruity logging is to detect and respond to potential security incidents.

### Benefits of Security Logging

Security logging can be used for:

1. Feeding intrusion detection systems
2. Forensic analysis and investigations
3. Satisfying regulatory compliance requirements

### Logging for Intrusion Detection and Response

Use logging to identify activity that indicates that a user is behaving maliciously. Potentially malicious activity to log includes:

- Submitted data that is outside of an expected numeric range.
- Submitted data that involves changes to data that should not be modifiable (select list, checkbox or other limited entry component).
- Requests that violate server-side access control rules.
- A more comprehensive list of possible detection points is available [here](https://cheatsheetseries.owasp.org/cheatsheets/Application_Logging_Vocabulary_Cheat_Sheet.html).

When your application encounters such activity, your application should at the very least log the activity and mark it as a high severity issue. Ideally, your application should also respond to a possible identified attack, by for example invalidating the user’s session and locking the user’s account. The response mechanisms allow the software to react in realtime to possible identified attacks.

### Secure Logging Design

Logging solutions must be built and managed in a secure way. Secure Logging design may include the following:

- Allow expected characters only and/or encode the input based on the target to prevent [log injection](https://www.owasp.org/index.php/Log_Injection) attacks. The preferred approach would be that the logging solution performs input escaping instead of dropping data: otherwise the logging solution might discard data which would be needed for a later analysis.
- Do not log sensitive information. For example, do not log password, session ID, credit cards, or social security numbers.
- Protect log integrity. An attacker may attempt to tamper with the logs. Therefore, the permission of log files and log changes audit should be considered.
- Forward logs from distributed systems to a central, secure logging service. This will ensure log data cannot be lost if one node is compromised. This also allows for centralized or even automated monitoring.

## Threats

- An attacker could perform log injection attacks by manipulating log entries, potentially inserting malicious data or commands into log files.
- An attacker could gain unauthorized access to sensitive information through overly verbose logging practices that inadvertently capture and store confidential data.
- An attacker could engage in log tampering to cover tracks of malicious activities, potentially erasing or modifying evidence of their intrusion.
- An attacker could launch denial of service attacks by overwhelming logging systems with a flood of data, potentially disrupting normal system operations or obscuring other malicious actions.
- An attacker could gain unauthorized access to log files due to improper access controls, potentially exposing sensitive system information or user data.
- An attacker could engage in log forging to create false audit trails, potentially misleading investigators or framing innocent parties for malicious activities.
- An attacker could take advantage of insufficient logging practices to conduct malicious activities without detection, potentially prolonging their unauthorized access to systems.
- An attacker could exploit log file race conditions in multi-threaded applications, potentially corrupting log data or gaining unauthorized access to sensitive information.
- An attacker could perform replay attacks using information gleaned from logs, potentially reusing captured data to impersonate legitimate users or repeat authenticated actions.

## Implementation

The following is a list of security logging implementation best practices.

- Follow a common logging format and approach within the system and across systems of an organization. An example of a common logging framework is the Apache Logging Services which helps provide logging consistency between Java, PHP, .NET, and C++ applications.
- Do not log too much or too little. For example, make sure to always log the timestamp and identifying information including the source IP and user-id, but be careful not to log private (such as username) or confidential data (such as business data) unless extra care is taken.
- Pay close attention to time syncing across nodes to ensure that timestamps are consistent.

## Vulnerabilities Prevented

- Brute-Force Attacks against Login-Mechanisms

## References

- [Logging Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Logging_Cheat_Sheet.html)
- [OWASP Logging Guide](https://owasp.org/www-pdf-archive/OWASP_Logging_Guide.pdf)

## Tools

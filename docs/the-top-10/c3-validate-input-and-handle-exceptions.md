# C3: Validate all Input & Handle Exceptions

## Description

Input validation is a programming technique that ensures only properly formatted data may enter a software system component. When the injection attack targets a client (for example JavaScript based attacks), web servers can perform quoting/encoding on the attacker-provided data before forwarding it to the client.

Injection attacks commonly occur if an application confuses data input as executable commands and are often possible where input validation is forgotten or implemented wrong. For example, imagine that a web application accepts an email address as input from a user. The email address would be the expected “data”. Attackers now search for ways to confuse applications to execute this (supposed) data as commands. Different injection attacks target different areas:

- When an attacker tricks an application into interpreting user input (data) as SQL commands (or parts thereof), there is a SQL injection attack. The injected command executes within the database server.
- Remote command injection (RCE) happens if an application confuses user data with commands that execute on the web application server/host. Server-Side Template Injections are another example of injections executed within the application server.
- When Javascript-Injections happen, a web application has accepted user data but is coerced to execute that data as code. Injected javascript code is typically executed within another user’s web browser, thus not directly attacking the web server but other users.

### Syntactic and Semantic Validity

An application should check that data is **syntactically** and **semantically** valid (in that order) before using it in any way (including displaying it back to the user).

- **Syntactic validity** means that the data is in the expected form. For example, an application may allow users to select a four-digit “account ID” to perform some operation. The application should assume the user is entering a SQL injection payload and check that the data entered by the user is precisely four digits in length and consists only of numbers (in addition to utilizing proper query parameterization).

- **Semantic validity** includes only accepting input within an acceptable range for application functionality and context. For example, a start date must be before an end date when choosing date ranges.

## Threats

- An attacker could exploit SQL injection vulnerabilities by submitting malicious input to manipulate database queries, potentially gaining unauthorized access to sensitive data.
- An attacker could perform cross-site scripting (XSS) attacks by injecting malicious scripts into web pages, which are then executed in other users' browsers, potentially stealing session tokens or personal information.
- An attacker could execute arbitrary code remotely by injecting malicious commands into system calls or APIs, potentially taking control of the target system.
- An attacker could trigger buffer overflow errors by supplying input exceeding expected lengths, potentially overwriting memory and executing arbitrary code.
- An attacker could launch denial of service attacks by overwhelming systems with malformed or excessive input, potentially rendering services unavailable to legitimate users.
- An attacker could access unauthorized files and directories through path traversal attacks, potentially exposing sensitive system files or configuration data.
- An attacker could insert malicious payloads into XML documents to exploit XML parsing vulnerabilities, potentially leading to information disclosure or system compromise.
- An attacker could inject malicious templates into server-side template engines, potentially achieving remote code execution on the server.
- An attacker could confuse applications and bypass security controls through HTTP parameter pollution attacks, potentially manipulating application logic or accessing restricted functionality.

## Implementation

Protection against Injection Attacks is typically based upon a defense-in-depth approach and incorporates input filtering, output escaping, and utilization of hardening mechanisms. The former two are only dependent upon implemented security measures, and the latter is mostly dependent upon client-support, e.g., when protecting against XSS, filtering XSS from input and escaping output data server-side would prevent XSS regardless of the used web browser; adding a Content-Security-Policy prevents XSS, but only if the user’s browser supports it. Due to this, security must never depend upon optional hardening measures alone.

### Prevent malicious data from entering the system

Never trust provided data! Screen all data for malicious patterns or, even better, check all data against an allow list.

#### Allowlisting vs Denylisting

There are two general approaches to performing syntactic validation, commonly known as allow and deny lists:

- Denylisting or **denylist validation** attempts to check that given data does not contain “known bad” content. For example, a web application may block input containing the exact text &lt;SCRIPT&gt; to help prevent XSS. However, this defense could be evaded with a lowercase script tag or a script tag of mixed case.
- Allowlisting or **allowlist validation** attempts to check that a given data matches a set of “known good” rules. For example, a allowlist validation rule for a US state would be a 2-letter code that is only one of the valid US states.
Allowlisting is the recommended minimal approach. Denylisting is prone to error, can be bypassed with various evasion techniques, and can be dangerous when dependent on itself. Even though denylisting is often evaded, it can be useful to help detect obvious attacks. So while allowlisting helps limit the attack surface by ensuring data is of the right syntactic and semantic validity, denylisting helps detect and potentially stop obvious attacks.

#### Client side and Server side Validation

Always perform Input validation on the server side for security. While client-side validation is useful for both functional and security purposes, it is easily bypassed. Therefore, client-side validation is performed for usability purposes, but the application’s security must not depend upon it. For example, JavaScript validation may alert the user that a particular field must consist of numbers. Still, the server-side application must validate that the submitted data only consists of numbers in the appropriate numerical range for that feature. Another benefit of using both client AND server-side validation is that any server-side validation warnings can be logged to inform operations of a potential hacker as the client-side validation had been bypassed.

#### Regular Expressions

Regular expressions offer a way to check whether data matches a specific pattern. Let’s start with a basic example.
The following regular expression defines an allowlist rule to validate usernames.

~~~ regexp
^\[a-z0-9_\]{3,16}$
~~~

This regular expression allows only lowercase letters, numbers, and the underscore character. The username is also restricted to a length of 3 and 16 characters.

Caution: Potential for Denial of Service

Care should be exercised when creating regular expressions. Poorly designed expressions may result in potential denial of service conditions (aka [ReDoS](https://www.owasp.org/index.php/Regular_expression_Denial_of_Service_-_ReDoS) ). Various tools can be tested to verify that regular expressions are not vulnerable to ReDoS.

Caution: Complexity

Regular expressions are just one way to accomplish validation. Regular expressions can be difficult to maintain or understand for some developers. Other validation alternatives involve writing validation methods programmatically, which can be easier to maintain for some developers.

#### Unexpected User Input (Mass Assignment)

Some frameworks support automatic binding of HTTP requests parameters to server-side objects used by the application. This auto-binding feature can allow an attacker to update server-side objects that were not meant to be modified. The attacker can possibly modify their access control level or circumvent the intended business logic of the application with this feature.
This attack has a number of names including: mass assignment, autobinding and object injection.
As a simple example, if the user object has a field privilege which specifies the user’s privilege level in the application, a malicious user can look for pages where user data is modified and add privilege=admin to the HTTP parameters sent. If auto-binding is enabled in an insecure fashion, the server-side object representing the user will be modified accordingly.

Two approaches can be used to handle this:

- Avoid binding input directly and use Data Transfer Objects (DTOs) instead.
- Enable auto-binding but set up allowlist rules for each page or feature to define which fields are allowed to be auto-bound.

More examples are available in the [OWASP Mass Assignment Cheat Sheet](https://www.owasp.org/index.php/Mass_Assignment_Cheat_Sheet)

### Limits of Input Validation

Input validation does not always make data “safe” since certain complex input forms may be “valid” but still dangerous. For example, a valid email address may contain a SQL injection attack, or a valid URL may contain a Cross Site Scripting attack. Additional defenses besides input validation should always be applied to data, such as query parameterization or escaping.

### Use mechanisms that uphold the separation of data and commands

Even if malicious data has passed the input checking, applications can prevent injection attacks by never executing those malicious data as commands/code. Multiple measures can achieve this goal, most of them are technology-dependent. For Example:

- When using relational databases through SQL, utilize Prepared-Statements. SQL Injection attacks typically happen if an attacker can provide input data that “escapes” from SQL-Commands created through string concatenation. Using Prepared Statements allows the computer to automatically encode input data in a way that does not allow it to “escape” from the command template.
- When using an ORM, be sure that you know how objects are mapped to SQL commands. While their layer of indirection might prevent common SQLi, specially prepared attacks are often still feasible.
- Server-Side Template Injection (SSTI) uses a templating engine on the server-side to dynamically generate content that is then displayed to the user. SSTI engines often allow configuration of sandboxing, i.e., only allow execution of a limited amount of methods.
- Executing System Commands with user input as parameters is prone to injection attacks. If feasible, this should be avoided.

#### JavaScript Injection Attacks

A special case are JavaScript based Injection attacks (XSS). The injected malicious code is commonly executed within a victim’s browser. Typically, attackers try to steal the user’s session information from the browser and not directly execute commands (as they do on the server-side). In addition to server-side input filtering and output escaping, multiple client-side hardening measurements can be taken (these also protect against the special case of DOM-based XSS where no server-side logic is involved and thus cannot filter malicious code):

- Mark sensitive cookies with httpOnly so JavaScript cannot access them
- Utilize a Content-Security-Policy to reduce the attack-surface for JavaScript-based Attacks
- Use a secure by default framework like Angular

#### Validating and Sanitizing HTML

Consider an application that needs to accept HTML from users (via a WYSIWYG editor that represents content as HTML or features that directly accept HTML in input). In this situation, validation or escaping will not help.

- Regular expressions are not expressive enough to understand the complexity of HTML5.
- Encoding or escaping HTML will not help since it will cause the HTML not to render properly.

Therefore, you need a library to parse and clean HTML formatted text. Please see the [XSS Prevention Cheat Sheet on HTML Sanitization](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html) for more information on HTML Sanitization.

### Special Case: Validate Data During Deserialization

Some forms of input are so complex that validation can only minimally protect the application. For example, it’s dangerous to deserialize untrusted data or data that can be manipulated by an attacker. The only safe architectural pattern is to not accept serialized objects from untrusted sources or to only deserialize in limited capacity for only simple data types. You should avoid processing serialized data formats and use easier to defend formats such as JSON when possible.

If that is not possible then consider a series of validation defenses when processing serialized data.

- Implement integrity checks and encryption of the serialized objects to prevent hostile object creation or data tampering.
- Enforce strict type constraints during deserialization before object creation; typically code is expecting a definable set of classes. Bypasses to this technique have been demonstrated.
- Isolate code that deserializes, such that it runs in very low privilege environments, such as temporary containers.
- Log security deserialization exceptions and failures, such as where the incoming type is not the expected type, or the deserialization throws exceptions.
- Restrict or monitor incoming and outgoing network connectivity from containers or servers that deserialize.
- Monitor deserialization, alerting if a user deserializes constantly.

## Vulnerabilities Prevented

- Input validation reduces the attack surface of applications and can sometimes make attacks more difficult against an application.
- Input validation is a technique that provides security to certain forms of data, specific to certain attacks and cannot be reliably applied as a general security rule.
- Input validation should not be used as the primary method of preventing [XSS](https://www.owasp.org/index.php/XSS_%28Cross_Site_Scripting%29_Prevention_Cheat_Sheet), [SQL Injection](https://www.owasp.org/index.php/SQL_Injection_Prevention_Cheat_Sheet) and other attacks.
- [2023 CWE Top 25 - 3 Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')](https://cwe.mitre.org/data/definitions/89.html)
- [2023 CWE Top 25 - 5 Improper Neutralization of Special Elements used in an OS Command ('OS Command Injection')](https://cwe.mitre.org/data/definitions/89.html)
- [2023 CWE Top 25 - 16 Improper Neutralization of Special Elements used in a Command ('Command Injection')](https://cwe.mitre.org/data/definitions/77.html)
- [2023 CWE Top 25 - 23 Improper Control of Generation of Code ('Code Injection')](https://cwe.mitre.org/data/definitions/94.html)

## References

Regarding Input Validation:

- [OWASP Cheat Sheet: Input Validation](https://cheatsheetseries.owasp.org/cheatsheets/Input_Validation_Cheat_Sheet.html)
- [OWASP Testing Guide: Testing for Input Validation](https://www.owasp.org/index.php/Testing_for_Input_Validation)
- [Injection Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Injection_Prevention_Cheat_Sheet.html)
- [Injection Prevention Cheat Sheet in Java](https://cheatsheetseries.owasp.org/cheatsheets/Injection_Prevention_in_Java_Cheat_Sheet.html)
- Hardening with CSP: [CSP with Google](https://csp.withgoogle.com/docs/index.html)
- Deploying CSP in Single Page Applications

## Tools

Helping with Input Validation:

- [OWASP Java HTML Sanitizer Project](https://www.owasp.org/index.php/OWASP_Java_HTML_Sanitizer)
- [Java JSR-303/JSR-349 Bean Validation](http://beanvalidation.org/)
- [Java Hibernate Validator](http://hibernate.org/validator/)[Apache Commons Validator](https://commons.apache.org/proper/commons-validator/)PHP’s [filter functions](https://secure.php.net/manual/en/book.filter.php)

Testing for Injection Attacks:

- Sqlmap.py
- OWASP ZAP-based scans
Helping with Hardening:
- [CSP Evaluator](https://csp-evaluator.withgoogle.com/)

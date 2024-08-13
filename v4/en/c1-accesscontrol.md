---

layout: col-document
tags: OWASP Top Ten Proactive Controls 2024, C1, Implement Access Control
document: OWASP Top Ten Proactive Controls 2024
order: 405
permalink: /v4/en/c1-accesscontrol

---
# C1: Implement Access Control

## Description
Access Control (or Authorization) is allowing or denying specific requests from a user, program or process. With each access control decision a given subject requests access to a given object. Access control is the process that considers the defined policy and determines, if a given subject is allowed to access a given object. Access control also involves the act of granting and revoking those privileges.

Authorization (verifying access to specific features or resources) is not equivalent to authentication (verifying identity).

Access Control often applies on multiple levels, e.g., given an application with a database backend it applies both on the business logic level as well as on a database row level. In addition, applications can offer multiple ways of performing operations (e.g., through APIs or the website). All those different levels and access paths must be aligned, i.e., use the same access control checks to protect against security vulnerabilities.

## Threats

* An attacker could take advantage of a loosely configured access control policy to access data the organization did not intend to make accessible.
* An attacker could discover multiple access control components within an application and exploit the weakest.
* An administrator could forget to decommission an old account; an attacker could discover that account and use it to access data.
* An attacker could gain access to data that had a policy that dropped into a final step of allowing access (lack of default deny).

## Implementation

Below is a minimum set of access control design requirements that should be considered at the initial stages of application development.

### Design Access Control Thoroughly Up Front

Once you have chosen a specific access control design pattern, it is often difficult and time-consuming to re-engineer access control in your application with a new pattern. Access Control is one of the main areas of application security design that must be thoroughly designed up front, especially when addressing requirements like multi-tenancy and horizontal (data dependent) access control.

Two core types of access control design should be considered.

* Role Based Access Control (RBAC) is a model for controlling access to resources where permitted actions on resources are identified with roles rather than with individual subject identities.
* Attribute Based Access Control (ABAC) will grant or deny user access based on arbitrary attributes of the user and arbitrary attributes of the object, and environment conditions that may be globally recognized and more relevant to the policies at hand.

Access Control design may start simple but can often become complex and feature-heavy security control. When evaluating the access control capability of software frameworks, ensure that your access control functionality will allow for customization for your specific access control feature need.

### Force Every Access Request to Go Through an Access Control Check (Zero Trust)

Ensure that **all** access requests are forced to go through an access control verification layer. Technologies like Java filters or other automatic request processing mechanisms are ideal programming components that will ensure that all requests go through an access control check. This is refered to as _Policy Enforcement Point_ in [RFC 2904](https://datatracker.ietf.org/doc/html/rfc2904#section-4.3).

### Consolidate the access control check

Use a **single access control** procedure or routine. This prevents the scenario where you have multiple access control implementations, where most are correct, but some are flawed.

By using a centralized approach, you can focus security resources on reviewing and fixing one central library or function that performs the access control check and then reuse it throughout your code base and organization.

### Deny by Default

Ensure that by default **all** the requests are denied unless they are specifically allowed. This also includes accessing API (REST or webhooks) with missing access controls. There are many ways that this rule will manifest in the application code. Some examples are:

1. Application code may throw an error or exception while processing access control requests. In these cases, access control should always be denied.

2. When an administrator creates a new user or a user registers for a new account, that account should have minimal or no access by default until that access is configured.

3. When a new feature is added to an application, all users should be denied to use it until it’s properly configured.


### Principle of Least Privilege / Just in Time (JIT), Just Enough Access (JEA)

An example of implementing that principle is to create dedicated privileged roles and accounts for **every organization function** that requires highly privileged activities and avoid using an “admin” role / account that is fully privileged daily.

To further improve the security, you can implement Just-in-Time (JIT) or Just-enough-Access (JEA): ensure that all users, programs or processes are only given just enough access to achieve their current mission. This access should be provided just in time when the subject makes the request and the access should be granted for a short time. Be wary of systems that do not provide granular access control configuration capabilities.

### Do not Hardcode Roles

Many application frameworks default to access control that is role based. It is common to find application code filled with checks of this nature.

~~~ java
if (user.hasRole("ADMIN")) || (user.hasRole("MANAGER")) {
   deleteAccount();
}
~~~

Be careful about this type of role-based programming in code. It has the following limitations or dangers:

* Role-based programming of this nature is fragile. It is easy to create incorrect or missing role checks in code.
* Hard-Coded Roles do not allow for multi-tenancy. Extreme measures like forking the code or adding checks for each customer will be required to allow role-based systems to have different rules for different customers.
* Large codebases with many access control checks can make it difficult to audit or verify the overall application access control policy.
* Hard coded roles can also be seen as a backdoor when discovered during audits.

*Attribute-* or *feature-based access control* checks of this nature are the starting point to building well-designed and feature-rich access control systems. This type of programming also allows for greater access control customization capability over time.

#### ABAC Policy Enforcement Point Example

Please consider the following access control enforcement points using this following programming methodology:

~~~ java
if (user.hasPermission("DELETE_ACCOUNT")) {
   deleteAccount();
}
~~~

## Log All Access Control Events
**All** access control events should be logged as these may be indicative of a malicious user probing the application for vulnerabilities.

## Vulnerabilities Prevented

- [OWASP Top 10 2021-A01_2021-Broken Access Control](https://owasp.org/Top10/A01_2021-Broken_Access_Control/)
- [CWE Top 25 - 11:CWE-862 Missing Authorization](https://cwe.mitre.org/data/definitions/862.html)
- [CWE Top 25 - 24:CWE-863 Incorrect Authorization](https://cwe.mitre.org/data/definitions/863.html)

## References

- [OWASP Cheat Sheet: Authorization Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Authorization_Cheat_Sheet.html)
- [OWASP Cheat Sheet: Logging Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Logging_Cheat_Sheet.html)
- [OWASP ASVS V4 Access Control](https://owasp.org/www-project-application-security-verification-standard/)
- [OWASP Testing Guide: Authorization Testing](https://owasp.org/www-project-web-security-testing-guide/stable/4-Web_Application_Security_Testing/05-Authorization_Testing/)
- [OAuth2.0](https://oauth.net/2/) protocol for authorization
- [Draft OAuth2.1](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-v2-1-10)
- [Policy Enforcement in RFC 2904](https://datatracker.ietf.org/doc/html/rfc2904#section-4.3)

## Tools

- [ZAP](https://www.zaproxy.org/) with the optional [Access Control Testing](https://www.zaproxy.org/docs/desktop/addons/access-control-testing/) add-on
- [Open Policy Agent](https://www.openpolicyagent.org/)

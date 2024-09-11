# C4: Address Security from the Start

## Description

When designing a new application, creating a secure architecture prevents vulnerabilities before they even become part of the application. This prevents costly repairs and repudiation problems.

There are design principles that lead to secure architectures:

- **keep it simple, stupid** (KISS): the easier an application is to understand, the easier it is to reason about its components and their interactions. This allows to reason about the application's security behavior.
- **Make it easy to do the right thing**: don't expect the user to read documentation or invest time to "do things the right way". By default the application should behave in a secure manner. To make it insecure, an explicit action by the user has to take place.
- **don't rely on obscurity**: if the only security is due to the intransparency of the application or its source code, the application is not secure at all.
- **Identify and minimize your exposed components** ("attack surface"): attackers cannot attack what's not there.
- **Design for Defense-in-Depth**: think about what happens, if a component is breached and about the potential blast radius of an attack.

### Usage of Third-Party Components such as Libraries and Frameworks

While it might be possible to implement all requirements manually, it is highly recommended to base one's architecture upon established and well-maintained third-party components. This has multiple benefits:

- **Don't reimplement the wheel** and learn from (security) failures of others. Often, existing libraries and frameworks have undergone a security audit and security issues have been identified and eventually remediated. Benefit from the security works of others!
- **Secure Defaults**: more and more frameworks offer defensive and secure defaults. To enable risky behavior, manual developer interaction is needed.
- **But keep them up to date**. While you gain benefits from using maintained frameworks, you know have the maintenance burden of tracking their new releases for security notes.
- **Don't fight the framework**. If using a framework feels like you are fighting it each and every step, then maybe this concrete framework is not a good match for your development style or architecture (or vice versa).

## Threats

- If the application is only protected by security-by-obscurity, an attacker that reverse-engineers the application has full permissions as soon the obfuscation is cleared-up. In addition, an attacker is able to monitor network traffic: while the obfuscation might be performed on the code-level, the operations on the network level can easily be analyzed.
- A web-application with a complex authorization scheme is deployed. A new software developer is tasked with extending one of the components. Due to the complexity, they misconfigure the authorization scheme and an attacker is able to exploit IDOR.
- A web-application with a complex authorization scheme is deployed. A new software developer adds a new plugin to the system. The system makes it hard to do the right thing, and all security configuration must be manually added to the plugin, by-default no security measures are taken. The new developer is not configuring anything thus the new plugin introduces an IDOR into the system.
- A web-application has many components, all of which are exposed to the public internet. The resulting attack surface is massive. For example, a database management tool (e.g., `phpmyadmin`) is deployed. After a 0day was found in `mysqladmin`, the whole database was extracted. During normal use, nobody uses `phpmyadmin`.

## Implementation

The mantra "Complexity is the enemy of security" can be seen throughout this implementation guidance.

### Design for Clarity and Transparency

Architecture should focus upon simplicity: the designed software should be only as complex as the intended user's requirements warrant. Focusing upon simplicity brings multiple benefits for the created software:

- It is easier to reason about a simple system. This allows to reason about potential security impacts of changes.
- Long-term maintenance is aided through the simpler design.
- The design should focus upon transparency, i.e., the security should not depend upon security-by-obscurity.

### Make it easy to do the right thing

Two terms often heard are "security by design" and "security by default". The former implies, that the software system should be usable in a secure manner while the latter means that the initial configuration of the software system is secure.

This implies, that an system administrator has to make an explicit choice to introduce insecure configuration into the system. In contrast, the path of least resistance should always result in a secure system.

When focusing upon end-user interactions, this aspect is important for designing user interfaces and flows. When focusing upon developer interactions, developer-facing facilities such as framework, APIs, network APIs should be designed that when using them with default values, only secure operations should occur. Think about this when designing your configuration files too

### Clearly articulate what's trusted to do what, and ensure those relationships are enforced

Clearly articulate what's trusted to do what, and ensure those relationships are enforced, e.g., trust boundaries delineate blast radius and are enforced by controls, such as firewalls or gateways.

Attenuate what's allowed by careful validation at each step. Go deeper with threat modeling mnemonics like stride or methodologies like stride per element.

### Identify and minimize your exposed components ("attack surface")

Identify all areas that an attacker can access, review them and try to minimize them: attackers cannot attack what's not there.

In addition, exposing only a minimal set of operations makes long-term maintenance easier.

### Use well-known Architecture Patterns

Experts have shared their wisdom about best practices in an easily digestible format called secure architecture patterns. Architecture patterns are reusable and can be applied across multiple applications.

For a solution to be considered a pattern, it must have these characteristics:

- First, a secure architecture pattern must solve a security problem.
- Second, a secure architecture pattern must not be tied to a specific vendor or technology.
- Third, a secure architecture pattern must demonstrate how it mitigates threats.
- Fourth, a [secure architecture pattern](https://securitypatterns.io/what-is-a-security-pattern/) must use standardized terms for threats and controls for easy reuse.

An architecture pattern is a way to solve a problem using a standard solution versus creating a custom solution. A secure architecture pattern is a standard solution that has been reviewed and hardened against known security threats.

Implementation:

1. Identify the problem that requires solving.
2. Consider the catalog of available secure architecture patterns.
3. Choose a secure architecture pattern for the design.
4. Implement the secure architecture pattern.

## Vulnerabilities Prevented

- Business Logic Flaws: These patterns can help in structuring the application to avoid complex and often overlooked business logic vulnerabilities.
- OWASP Top 10 2021-A04 (Insecure Design): Secure architecture patterns directly target the mitigation of risks associated with insecure design, a key concern highlighted by OWASP.

## References

- <https://securitypatterns.io/what-is-a-security-pattern/>
- <https://owasp.org/www-pdf-archive/Vanhilst_owasp_140319.pdf>
- <https://cheatsheetseries.owasp.org/cheatsheets/Microservices_based_Security_Arch_Doc_Cheat_Sheet.html>
- <https://cheatsheetseries.owasp.org/cheatsheets/Secure_Product_Design_Cheat_Sheet.html>

## Tools

- [OWASP Threat Dragon](https://owasp.org/www-project-threat-dragon/)
- [Amazon AWS Threat-Composer](https://github.com/awslabs/threat-composer)
- [StrideGPT](https://github.com/mrwadams/stride-gpt)

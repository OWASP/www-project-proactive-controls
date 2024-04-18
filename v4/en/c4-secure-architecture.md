---

layout: col-document
tags: OWASP Top Ten Proactive Controls 2024, C4, Use Secure Architecture Patterns
document: OWASP Top Ten Proactive Controls 2024
order: 408
permalink: /v4/en/c4-secure-architecture

---

# C4: Address Security from the Start

## Description

When designing a new application, creating a secure architecture prevents vulnerabilties before they even become part of the application. This prevents costly repairs and repudiation problems.

There are design principles that lead to secure architectures:

- **keep it simple, stupid** principle (KISS): the easier an application is to understand, the easier it is to reason about its components and their interactions. This allows to reason about the application's security behavior.
- **don't rely on obscurity**: if the only security is due to the intransparency of the application or its source code, the application is note secure at all.
- **Identify and minimize your exposed components** ("attack surface"): attackers cannot attack what's not there.
- **Design for Defense-in-Depth**: think about what happens, if a component is breached and about the potential blast radius of an attack.
- **Make it easy to do the right thing**

## Implementation

### Design for Clarity and Transparency

- so no security by obscurity
- make it easy to reason about an architecture's security

### Make it easy to do the right thing

- basic idea behind "security by design" and "security by default"
- important for user interfaces and flows
- but also important for anything that other developers are expected to extend (frameworks, plugin systems, etc.)
- think about this when designing your configuration files too

### Identify and minimize your exposed components ("attack surface")

- identify all areas that an attacker can access
- review them and try to minimize those areas
- attackers cannot attack what's not there

### Clearly articulate what's trusted to do what, and ensure those relationships are enforced 

Clearly articulate what's trusted to do what, and ensure those
relationships are enforced (trust boundaries deliniate blast radius
and are enforced by controls, such as firewalls or gateways.)

Attenuate what's allowed by careful validation at each step.

Go deeper with threat modeling mnemonics like stride or methodologies like stride per element

### Use well-known Architecture Patterns

Experts have shared their wisdom about best practices in an easily digestible format called secure architecture patterns. Architecture patterns are reusable and can be applied across multiple applications.

For a solution to be considered a pattern, it must have these characteristics: 
- First, a secure architecture pattern must solve a security problem. 
- Second, a secure architecture pattern must not be tied to a specific vendor or technology. 
- Third, a secure architecture pattern must demonstrate how it mitigates threats. 
- Fourth, a secure architecture pattern must use standardized terms for threats and controls for easy reuse.<sup>[^footnote-1]</sup>

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

[^footnote-1]: https://securitypatterns.io/what-is-a-security-pattern/

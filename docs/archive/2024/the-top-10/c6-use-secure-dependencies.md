# C6: Keep your Components Secure

## Description

It is a common practice in software development to leverage libraries and frameworks. Secure libraries and software frameworks with embedded security help software developers prevent security-related design and implementation flaws.

A developer writing an application from scratch might not have sufficient knowledge, time, or budget to properly implement or maintain security features. Leveraging security frameworks (both open source and vendor) help accomplish security goals more efficiently and accurately.

When possible, the emphasis should be on using the existing secure features of frameworks rather than importing yet another third party libraries, which requires regular updates and maintenance. It is preferable to have developers take advantage of what they're already using instead of forcing yet another library on them.

When incorporating third party libraries or frameworks into your software, it is important to consider the following two categories of best practices:

1. Identify trusted libraries and frameworks to bring into your software.
2. Monitor and update packages to ensure that your software is not vulnerable to the possible security vulnerabilities introduced by the third party components.

## Threats

- An attacker could exploit known vulnerabilities in outdated third-party components to gain unauthorized access or execute malicious code.
- An attacker could conduct supply chain attacks by compromising libraries or frameworks used in the development process, potentially inserting malicious code into the final product.
- An attacker could extract sensitive information by exploiting insecure configurations in third-party components that haven't been properly hardened.
- An attacker could launch denial of service attacks by targeting known vulnerabilities in external libraries, potentially disrupting the availability of services.

## Implementation

Below each of these categories are further detailed to help secure your software.

### Best Practices to Identify Trusted libraries

Below are listed a few criteria you can use to select the next library or framework for your software. This is not an exhaustive list, but is a good start.

1. **Sources**: Download recommended security libraries from official sources over secure links and prefer signed packages to reduce the chance of including a modified, malicious component (See A08:2021-Software and Data Integrity Failures).

2. **Popularity**: Leverage libraries and frameworks used by many applications which have around large communities. Consider data points such as the number of GitHub stars a package’s source code repository has received, and number of downloads from within a package manager.

3. **Activity:** Ensure that the library/ framework is actively maintained and issues are resolved in a timely fashion.

4. **Maturity**: Use stable versions . Projects in early stages of development area higher risk to your software .

5. **Complexity**: A large, complex library with lots of dependencies, is more difficult to incorporate into your software. Also, a high number of dependencies indicates a higher number of future upgrades to ensure all those dependencies are up-to-date and secured.

6. **Security**: If the package is open source, you can use static application security testing (SAST) or [Software Composition Analysis](https://en.everybodywiki.com/Software_Composition_Analysis#:~:text=Software%20Composition%20Analysis%20%28SCA%29%20comprises,been%20integrated%20into%20your%20applications.) (SCA) to help identify malicious code or security weaknesses, before first including them.

### Best Practices to Keep them Secure

New security vulnerabilities are disclosed every day and are published in public databases like the NIST National Vulnerability Database ([NVD](https://nvd.nist.gov/)) which identifies publicly known vulnerabilities using Common Vulnerabilities and Exposures (CVE). Furthermore, exploits made available in public databases allow attackers to automate their attacks. As a result of this, it is important to ensure on a regular basis that your software is free of well-known security vulnerabilities.

1. **Maintain an inventory catalog** of all the third party components. It is recommended to automatically create SBOMs ([Software-Bill-Of-Materials](https://cyclonedx.org/)) from within the build pipeline. A SBOM contains all used third-party dependencies and their versions and can be automatically monitored by a variety of supply chain management tools.

2. **Perform continuous checks.** Use your SBOMs together with periodic or continuous monitoring tools such as OWASP dependency-track to automatically detect well-known publicly disclosed vulnerabilities.

3. **Verify for security early and often** - integrate SCA tools in early stages of software development, to gain visibility in the number and criticality of security vulnerabilities of the software and its dependencies from every stage of the software development life cycle.

4. **Proactively** update libraries and components. Updating software must be a recurring task that occurs throughout the life cycle of the application or product, from ideation to retirement.

## Vulnerabilities Prevented

Secure frameworks and libraries can help to prevent a wide range of web application vulnerabilities. It is critical to keep these frameworks and libraries up to date as described in using [vulnerable and outdated components with known vulnerabilities Top 10 2021](https://owasp.org/Top10/A06_2021-Vulnerable_and_Outdated_Components/).

## References

- OWASP Cheat Sheet: [Third Party JavaScript Management](https://cheatsheetseries.owasp.org/cheatsheets/Third_Party_Javascript_Management_Cheat_Sheet.html#sandboxing-content)
- [OpenSSF Scorecard - Security health metrics for Open Source](https://github.com/ossf/scorecard)

## Tools

- [OWASP Dependency-Check](https://owasp.org/www-project-dependency-check/) ­- to identify project dependencies and check for publicly disclosed vulnerabilities
- [OWASP Dependency-Track](https://owasp.org/www-project-dependency-track/) - periodically monitor SBOM files for new vulnerabilities
- Retire.JS scanner for JavaScript libraries
- [Renovate for automated dependencies updates](https://github.com/renovatebot/renovate)
- [Harbor](https://goharbor.io/) : an open source registry that secures artifacts with policies and role-based access control

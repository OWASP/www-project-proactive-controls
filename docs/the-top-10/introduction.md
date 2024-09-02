# Introduction

For years, developers have suffered through introducing the same security issues into the things they build. The most common issues, which have existed for decades, have been documented by the OWASP Top Ten. Many of the issues in the earliest version still exist in some form today. A mechanism is needed to counter these challenges, and that mechanism is proactive controls.

Proactive controls are a catalog of better practices, a set of items developers can embrace and implement in their code bases to avoid many common security issues. Proactive controls provide positive patterns to implement solutions considered secure by design.

Imagine working on a web-based software, releasing a new version, and then getting reports that it contained a security vulnerability that is now being exploited in the wild. You are now forced to act reactively: analyzing the vulnerability, fixing it, creating a new software release, and getting it to your users. All this is tedious and a bit awkward, esp. When the security vulnerability was critical.

Proactive controls prevent this by focusing on the development itself. Their idea is to prevent common vulnerabilities during an application's inception so that those tedious and embarrassing bug fixes can be avoided altogether. Common knowledge is that a proactive approach will save resources and money in the long run.

The OWASP Top 10 Proactive Controls 2024 is a list of security techniques every software architect and developer should know and heed. The main goal of this document is to provide concrete, practical guidance that helps developers build secure software. These techniques should be applied proactively at the early stages of software development to ensure maximum effectiveness.

Please note that while complying with best proactive practices will reduce the chance of a vulnerability being in your code, there is no guarantee that code is security-bug free. And that’s okay: You have to break an egg to make an omelet — the only way of not introducing any security bugs is not to code at all. We accept that while striving to prevent as many security issues as possible.

## How this List Was Created

This list was originally created by the current project leads with contributions from several volunteers. The document was then shared globally so even anonymous suggestions could be considered. Hundreds of changes were accepted from this open community process.

## Security Controls

The description of each control has the same structure. The control itself has an unique name preceeded by the control number: **Cx: Control Name**, e.g., *C1: Implement Access Control*.

Each control has the same sections:

- **Description**: A detailed description of the control including some best practices to consider.
- **Threat(s):** A threat or threats that this control counters.
- **Implementation**: Best practices and examples to illustrate how to implement each control.
- **Vulnerabilities Prevented**: List of prevented vulnerabilities or risks addressed (OWASP TOP 10 Risk, CWE, etc.)
- **References**: List of references for further study (OWASP Cheat sheet, Security Hardening Guidelines, etc.)
- **Tools**: Set of tools/projects to easily introduce/integrate security controls into your software.

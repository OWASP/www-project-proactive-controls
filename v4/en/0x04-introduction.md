---

layout: col-document
tags: OWASP Top Ten Proactive Controls 2024, Intro
document: OWASP Top Ten Proactive Controls 2024
order: 404
permalink: /v4/en/introduction

---

# Introduction

For years, developers have suffered through introducing the same security issues into the things they build. The most common issues, which have existed for decades, have been documented by the OWASP Top Ten. Many of the issues in the earliest version still exist in some form today. A mechanism is needed to counter these challenges, and that mechanism is proactive controls.

Proactive controls are a catalog of better practices, a set of items developers can embrace and implement in their code bases to avoid many common security issues. Proactive controls provide positive patterns to implement solutions considered secure by design.

Imagine working on a web-based software, releasing a new version, and then getting reports that it contained a security vulnerability that is now being exploited in the wild. You are now forced to act reactively: analyzing the vulnerability, fixing it, creating a new software release, and getting it to your users. All this is tedious and a bit awkward, esp. When the security vulnerability was critical.

Proactive controls prevent this by focusing on the development itself. Their idea is to prevent common vulnerabilities during an application's inception so that those tedious and embarrassing bug fixes can be avoided altogether. Common knowledge is that a proactive approach will save resources and money in the long run.

Please note that while complying with best proactive practices will reduce the chance of a vulnerability being in your code, there is no guarantee that code is security-bug free. And that’s okay: You have to break an egg to make an omelet — the only way of not introducing any security bugs is not to code at all. We accept that while striving to prevent as many security issues as possible.

## The OWASP Top 10 Proactive Controls 2024

The OWASP Top 10 Proactive Controls 2024 is a list of security techniques every software architect and developer should know and heed. The main goal of this document is to provide concrete, practical guidance that helps developers build secure software. These techniques should be applied proactively at the early stages of software development to ensure maximum effectiveness.

***How to Use this Document***

This document’s main purpose is to provide a solid foundation of topics to help drive introductory software security developer training. To be effective, these controls should be used consistently and thoroughly throughout all applications.

However, this document is a starting point rather than a comprehensive set of techniques and practices.

A fully secure development process should include comprehensive requirements from a standard such as the OWASP ASVS in addition to including a range of software development activities described in maturity models such as [OWASP SAMM](https://www.owasp.org/index.php/OWASP_SAMM_Project) and [BSIMM](https://www.bsimm.com/).

***Target Audience***

This document is primarily written for developers. However, development managers, product owners, Q/A professionals, program managers, and anyone involved in building software can also benefit from this document. 

***How this List Was Created***
This list was originally created by the current project leads with contributions from several volunteers. The document was then shared globally so even anonymous suggestions could be considered. Hundreds of changes were accepted from this open community process.

## Relationship to other OWASP Projects
OWASP is a volunteer-driven organization. Those volunteers contributed many useful documents, and this section points to some related OWASP documents and projects:

- The best-known OWASP document is the [OWASP Top 10](https://owasp.org/Top10/). They detail the most common web application vulnerabilities and are also the base for this document. In contrast, this document is focused on defensive techniques and controls as opposed to risks. Each control in this document will map to one or more items in the risk-based OWASP Top 10. This mapping information is included at the end of each control description.
- The OWASP ASVS: [The OWASP Application Security Verification Standard (ASVS)](https://owasp.org/www-project-application-security-verification-standard/) is a catalog of available security requirements and verification criteria. OWASP ASVS can be a source of detailed security requirements for development teams. Security requirements are categorized into different buckets based on a shared higher order security function. For example, the ASVS contains categories such as authentication, access control, error handling / logging, and web services. Each category contains a collection of requirements that represent the best practices for that category drafted as verifiable statements.
- OWASP SAMM [Software Assurance Maturity Model (SAMM)](https://www.opensamm.org/) is an open framework to help organizations implement a strategy for maturing the software security tailored to the specific risks of the organization. . [SAMM] (https://owaspsamm.org/about/) supports the complete software lifecycle and can be used to identify what
- Threat Modeling is an important part of secure application development, which can help identify potential security threats, derive security requirements, and tailor security controls to prevent potential threats. Successful use of security requirements involves four steps: discovery, documentation, implementation, and verification of the correct implementation of the functionality within an application. Threat modelling is one way to derive security requirements. Other sources are: industry standards, applicable laws, history of past vulnerabilities. Modeling tools, like [OWASP Threat Dragon](https://owasp.org/www-project-threat-dragon/) can be used to create threat model diagrams as part of a secure development lifecycle. 

It is important to notice that this document primarily focuses on web applications, but other Top 10s could apply to your application, too. Examples of those are:
- OWASP API Top 10
- OWASP Mobile Application Top 10


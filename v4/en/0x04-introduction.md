---

layout: col-document
tags: OWASP Top Ten Proactive Controls 2024, Intro
document: OWASP Top Ten Proactive Controls 2024
order: 4
permalink: /v4/en/introduction
path: /v4/en/

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

The OWASP Top 10 Proactive Controls is similar to the [OWASP Top 10](https://www.owasp.org/index.php/Category:OWASP_Top_Ten_Project) but is focused on defensive techniques and controls as opposed to risks. Each technique or control in this document will map to one or more items in the *risk based* OWASP Top 10. This mapping information is included at the end of each control description.

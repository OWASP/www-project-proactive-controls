# C8: Protect Data Everywhere

!!! warning "New Version of the Control Available!"

    You are looking at the legacy 2018 version of the OWASP Top 10 Proactive Controls. You can find information about the same control within the [OWASP Top 10 Proactive Controls 2024](./../2024/index.md) within [C2: Use Cryptography to Protect Data](./../2024/the-top-10/c2-crypto.md)!


## Description

Sensitive data such as passwords, credit card numbers, health records, personal information and business secrets require extra protection, particularly if that data falls under privacy laws (EU's General Data Protection Regulation GDPR), financial data protection rules such as PCI Data Security Standard (PCI DSS) or other regulations.

Attackers can steal data from web and web-service applications in a number of ways. For example, if sensitive information in sent over the internet  without communications security, then an attacker on a shared wireless connection could see and steal another user's data. Also, an attacker could use SQL Injection to steal passwords and other credentials from an applications database and expose that information to the public.

## Data Classification

It's critical to classify data in your system and determine which level of sensitivity each piece of data belongs to. Each data category can then be mapped to protection rules necessary for each level of sensitivity. For example, public marketing information that is not sensitive may be categorized as public data which is okay to place on the public website. Credit card numbers may be classified as private user data which may need to be encrypted while stored or in transit.

## Encrypting Data in Transit

When transmitting sensitive data over any network, end-to-end communications security (or encryption-in-transit) of some kind should be considered. TLS is by far the most common and widely supported cryptographic protocol for communications security. It is used by many types of applications (web, web service, mobile) to communicate over a network in a secure fashion. TLS must be properly configured in a variety of ways in order to properly defend secure communications.

The primary benefit of transport layer security is the protection of web application data from unauthorized disclosure and modification when it is transmitted between clients (web browsers) and the web application server, and between the web application server and back end and other non-browser based enterprise components.

## Encrypting Data at Rest

The first rule of sensitive data management is to avoid storing sensitive data when at all possible. If you must store sensitive data then make sure it's cryptographically protected in some way to avoid unauthorized disclosure and modification.

Cryptography (or crypto) is one of the more advanced topics of information security, and one whose understanding requires the most schooling and experience. It is difficult to get right because there are many approaches to encryption, each with advantages and disadvantages that need to be thoroughly understood by web solution architects and developers. In addition, serious cryptography research is typically based in advanced mathematics and number theory, providing a serious barrier to entry.

Instead of building cryptographic capability from scratch, it is strongly recommended that peer reviewed and open solutions be used, such as the [Google Tink](https://github.com/google/tink) project, [Libsodium](https://www.libsodium.org), and secure storage capability built into many software frameworks and cloud services.

### Mobile Application: Secure Local Storage

Mobile applications are at particular risk of data leakage because mobile devices are regularly lost or stolen yet contain sensitive data.

As a general rule, only the minimum data required should be stored on the mobile device. But if you must store sensitive data on a mobile device, then sensitive data should be stored within each mobile operating systems specific data storage directory. On Android this will be the Android keystore and on iOS this will be the iOS keychain.

### Secret Life Cycle

Secret keys can be used in a number of sensitive functions. For example, they can be used to sign JWTs, encrypt credit cards, sign hash, provide various forms of authentication and more. In managing keys, a number of precautious should be adhered including but not limited to the following:

* Ensure that any secret key is protected from unauthorized access
* Store keys in a proper secrets vault as described in *Application Secrets Management*
* Use independent keys when multiple keys are required
* Build support for changing algorithms and keys when needed
* Build application features to handle a key rotation

### Secret Datatype

When an immutable datatype such as `string` is used to store secrets, secrets can remain plaintext in the memory for a long time.
Even if you try to nullify the string value, it still remains in the memory.
`string` is an immutable type and cannot be changed. When you modify a string (try to overwrite it), a new copy of it is created.
This means another copy of the unprotected secret will remain in the memory.
Furthermore, there is no guarantee when garbage collector is going to clean up the secret.
This increases exposure of plaintext secrets in the memory.

If secrets remain unprotected in the memory, they can get disclosed on the disk or external log aggregators
through a number of scenarios: server crash logs, caching, serialisation or memory paging.

A safe way to handle secret is by using **Read Once** pattern.
Read once is a defensive design pattern where a value can be only accessed once. After the first read, value is cleared from memory, and subsequent access is not possible.
For an example implementation see [this post](https://discuss.secdim.com/t/do-not-use-string-to-store-secret-it-gets-disclosed/247).

### Application Secrets Management

Applications contain numerous "secrets" that are needed for security operations. These include certificates, SQL connection passwords, third party service account credentials, passwords, SSH keys, encryption keys and more. The unauthorized disclosure or modification of these secrets could lead to complete system compromise. In managing application secrets, consider the following.

* Don't store secrets in code, config files or pass them through environment variables. Use tools like [GitRob](https://github.com/michenriksen/gitrob) or [TruffleHog](https://github.com/dxa4481/truffleHog) to scan code repositories for secrets.
* Keep keys and your other application-level secrets in a secrets vault like [KeyWhiz](https://github.com/square/keywhiz) or [Hashicorp's Vault project](https://www.vaultproject.io/) or [Amazon KMS](https://aws.amazon.com/kms/) to provide secure storage and access to application-level secrets at run-time.

## Vulnerabilities Prevented

* [OWASP Top 10 2017 - A3: Sensitive Data Exposure](https://www.owasp.org/index.php/Top_10-2017_A3-Sensitive_Data_Exposure)
* [OWASP Mobile Top 10 2016 -M2: Insecure Data Storage](https://owasp.org/www-project-mobile-top-10/2016-risks/m2-insecure-data-storage)

## References

* [OWASP Cheat Sheet: Transport Layer Protection](https://www.owasp.org/index.php/Transport_Layer_Protection_Cheat_Sheet)
* [Ivan Ristic: SSL/TLS Deployment Best Practices](https://www.ssllabs.com/projects/best-practices/index.html)
* [OWASP Cheat Sheet: HSTS](https://www.owasp.org/index.php/HTTP_Strict_Transport_Security_Cheat_Sheet)
* [OWASP Cheat Sheet: Cryptographic Storage](https://cheatsheetseries.owasp.org/cheatsheets/Cryptographic_Storage_Cheat_Sheet.html)
* [OWASP Cheat Sheet: Password Storage](https://www.owasp.org/index.php/Password_Storage_Cheat_Sheet)
* [OWASP Testing Guide: Testing for TLS](https://owasp.org/www-project-web-security-testing-guide/v42/4-Web_Application_Security_Testing/09-Testing_for_Weak_Cryptography/01-Testing_for_Weak_Transport_Layer_Security)
* [Do not use String to store secret. It gets disclosed](https://discuss.secdim.com/t/do-not-use-string-to-store-secret-it-gets-disclosed/247)

## Tools

* [SSLyze](https://github.com/nabla-c0d3/sslyze) - SSL configuration scanning library and CLI tool
* [SSLLabs](https://www.ssllabs.com/ssltest/) - Free service for scanning and checking TLS/SSL configuration
* [OWASP O-Saft TLS Tool](https://www.owasp.org/index.php/O-Saft) - TLS connection testing tool
* [GitRob](https://github.com/michenriksen/gitrob) - Command line tool to find sensitive information in publicly available files on GitHub
* [TruffleHog](https://github.com/dxa4481/truffleHog)  - Searches for secrets accidentally committed
* [KeyWhiz](https://github.com/square/keywhiz) - Secrets manager
* [Hashicorp Vault](https://www.vaultproject.io/) - Secrets manager
* [Amazon KMS](https://aws.amazon.com/kms/) - Manage keys on Amazon AWS

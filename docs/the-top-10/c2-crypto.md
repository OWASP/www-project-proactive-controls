# C2: Use Cryptography the proper way

## Description

Sensitive data such as passwords, credit card numbers, health records, personal information and business secrets require extra protection, particularly if that data falls under privacy laws (EU’s General Data Protection Regulation GDPR), financial data protection rules such as PCI Data Security Standard (PCI DSS) or other regulations.

Attackers can steal data from web and web service applications in a number of ways. For example, if sensitive information is sent over the internet without communications security, then an attacker on a shared wireless connection could capture and steal another user’s data. Also, an attacker could use SQL Injection to steal passwords and other credentials from an applications database and expose that information to the public.

Privacy is assurance that the confidentiality of, and access to, certain information about an entity is protected. Users of the things developers build want their information protected from disclosure.

Protect sensitive data such as passwords, credit card numbers, health records, personal information, and business secrets.

Regulations exist to force companies to protect user’s personal information. The European Union values individual privacy, such that they created the EU General Data Protection Regulation GDPR. Financial data protection rules such as PCI Data Security Standard (PCI DSS) also exist to protect cardholder privacy.

Cryptography is the art or science concerning the principles, means, and methods for rendering plain information unintelligible and restoring encrypted information to intelligible form. Individual user data requires cryptography to ensure it is properly cared for when stored.

### Classify data types in your application

It’s critical to classify data in your system and determine which level of sensitivity each piece of data belongs to. Each data category can then be mapped to protection rules necessary for each level of sensitivity. For example, public marketing information that is not sensitive may be categorized as public data which is ok to place on the public website. Credit card numbers may be classified as private user data which will need to be encrypted while stored, processed or in transit.

Data classification can also be mandated by legislation, e.g., GDPR when serving users within the European Union.

Classify the data sent, processed, and stored in your system and determine what level of sensitivity the data belongs to. Categorize the data to define specific protection rules for each type. The rule creation enables your team to perform data minimization and try not to store sensitive data whenever possible.

For example, public marketing information that is not sensitive may be categorized as public data, which is okay to place on the public website and does not need to be encrypted. Credit card numbers need to be encrypted while stored, processed, and in transit.

## Threats

- An attacker could exploit weak or outdated encryption algorithms to decrypt sensitive information.
- Improperly stored encryption keys could be compromised, leading to unauthorized data access.
- An attacker can perform SQL Injection attacks to steal encrypted data from databases.
- Failure to implement proper key management could result in unauthorized access to encrypted data.

## Implementation

When it comes to cryptography, there are a few simple rules:

- Never transmit plain-text data. The technical capability exists to easily encrypt all data that is sent between any point A and B. Embrace the use of cryptography to protect all data at rest and in transit.
- Do not create your own cryptographic protocols. The creation of a cryptographic protocol is a tricky proposition. When NIST created AES, they had an open competition where the best cryptographers worldwide submitted proposals and then looked for flaws in the other proposals. Instead of using your developer cycles to create a new crypto protocol, use an existing, battle-tested standard. Focus your innovation on making your feature or product better.
- Do not implement cryptographic routines. Use an existing library that implements cryptographic routines.

### Protect data at rest

The first rule of sensitive data management is to avoid storing sensitive data when at all possible. If you must store sensitive data then make sure it is cryptographically protected in some way to avoid unauthorized disclosure and modification.
Cryptography (or crypto) is one of the more advanced topics of information security and one whose understanding requires the most schooling and experience. It is difficult to get right because there are many approaches to encryption, each with advantages and disadvantages that need to be thoroughly understood by web solution architects and developers. In addition, serious cryptography research is typically based on advanced mathematics and number theory, providing a serious barrier to entry.
Designing or building cryptographic algorithms is very error-prone (see side-channel attacks). Instead of building cryptographic capability from scratch, it is strongly recommended that peer-reviewed and open solutions be used, such as the Google `Tink` project, `Libsodium`, and secure storage capability built into many software frameworks and cloud services.

#### Store passwords safely

Most web applications will face the challenge of storing user’s passwords to set up authentication services. Store the passwords safely to ensure an attacker cannot quickly obtain them.
Do not store the passwords in plain text anywhere in the database. Always use a hashing function to store passwords. Enhance the hashing function by adding a random salt for each item to increase the randomness of hashes.

#### Special Case: Application Secrets management

Applications contain numerous “secrets” that are needed for security operations. These include certificates, SQL connection passwords, third party service account credentials, passwords, SSH keys, encryption keys and more. The unauthorized disclosure or modification of these secrets could lead to complete system compromise. In managing application secrets, consider the following:
Don’t store secrets in code, config files or pass them through environment variables. Use tools like GitRob or TruffleHog to scan code repos for secrets. Your code should be written in a way that even if your code would be disclosed, e.g., due to a defective configured github repository, your running applications are still secure.
Keep keys and your other application-level secrets in a secrets vault like KeyWhiz or Hashicorp’s Vault project , Amazon KMS, or AWS Secrets Manager to provide secure storage and access to application-level secrets at run-time. Many web-frameworks such as Ruby on Rails provide integrated ways of dealing with secrets and credentials.

#### Key Lifecycle

Secret keys are used in applications with a number of sensitive functions. For example, secret keys can be used to sign JWTs, protect credit cards, provide various forms of authentication as well as facilitate other sensitive security features. In managing keys, a number of rules should be followed including

- Ensure that any secret key is protected from unauthorized access
- All authorized access to a secret key is logged for forensic purposes
- Store keys in a proper secrets vault as described below
- Use independent keys when multiple keys are required
- Build support for changing cryptographic algorithms to prepare for future needed changes
- Build application features to support and handle key rotation gracefully. This can happen on a periodic base or after a key has been compromised.

### Protect data in transit

Sensitive data such as passwords, credit card numbers, health records, personal information and business secrets require extra protection, particularly if that data falls under privacy laws (EU’s General Data Protection Regulation GDPR), financial data protection rules such as PCI Data Security Standard (PCI DSS) or other regulations.
Attackers can steal data from web and web service applications in a number of ways. For example, if sensitive information is sent over the internet without communications security, then an attacker on a shared wireless connection could capture and steal another user’s data. Also, an attacker could use SQL Injection to steal passwords and other credentials from an applications database and expose that information to the public.

#### Use current cryptographic protocols

When developing web applications, use TLSv1.2 or TLSv1.3, preferably TLSv1.3. If possible, investigate the usage of HTTP/2 or HTTP/3 as they warrant the usage of security TLS versions/algorithms.

- Directly turn off other older protocols to avoid protocol downgrade attacks.
- Do not offer HTTP. Disable both HTTP and SSL compression.
- Always utilize a secure random number generator (RNG).

#### Instruct Clients to enforce Transport Level Encryption

Web servers can instruct web browsers to uphold minimal transport-level security:

- Use the Strict-Transport-Security Header to enforce opportunistic encryption and certificate validation checks.
- Content-Security-Policy allows for automatic client-side upgrade from HTTP to HTTPS.
- When setting cookies, always utilize the “secure” flag to prevent transmission over HTTP.

### Support Cryptographic Agility: Cryptography changes over Time

Cryptographic recommendations change over time. To allow for this, make cryptographic choices such as used algorithms or key sizes configurable. This is called [Cryptographic Agility](https://en.wikipedia.org/wiki/Cryptographic_agility)

If the application needs to support high availability, design key-rollover procedures.

## Vulnerabilities Prevented

- <https://owasp.org/Top10/A02_2021-Cryptographic_Failures/>
- <https://mas.owasp.org/MASVS/controls/MASVS-CRYPTO-1/>

## References

- [OWASP Cheat Sheet: Transport Layer Protection](https://www.owasp.org/index.php/Transport_Layer_Protection_Cheat_Sheet)
- [Ivan Ristic: SSL/TLS Deployment Best Practices](https://www.ssllabs.com/projects/best-practices/index.html)
- [OWASP Cheat Sheet: HSTS](https://www.owasp.org/index.php/HTTP_Strict_Transport_Security_Cheat_Sheet)
- [OWASP Cheat Sheet: Cryptographic Storage](https://www.owasp.org/index.php/Cryptographic_Storage_Cheat_Sheet)
- [OWASP Cheat Sheet: Password Storage](https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html)
- [OWASP Web Security Testing Guide: Testing for Weak Cryptography](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/09-Testing_for_Weak_Cryptography/README)
- [OWASP WrongSecrets](https://github.com/OWASP/wrongsecrets) : vulnerable application with example of how to NOT use secrets

## Tools

- <https://github.com/nabla-c0d3/sslyze>
- <https://testssl.sh/>
- [SSLyze](https://github.com/nabla-c0d3/sslyze) - SSL configuration scanning library and CLI tool
- [SSLLabs](https://www.ssllabs.com/ssltest/) - Free service for scanning and checking TLS/SSL configuration
- [OWASP O-Saft TLS Tool](https://www.owasp.org/index.php/O-Saft) - TLS connection testing tool
- [GitRob](https://github.com/michenriksen/gitrob) - Command line tool to find sensitive information in publicly available files on GitHub
- [TruffleHog](https://github.com/dxa4481/truffleHog) - Searches for secrets accidentally committed
- [Hashicorp Vault](https://www.vaultproject.io/) - Secrets manager
- [Amazon KMS](https://aws.amazon.com/kms/) - Manage keys on AWS
- [AWS Secrets Manager](https://aws.amazon.com/secrets-manager) - Manage secrets on AWS
- [Azure Key Vault](https://azure.microsoft.com/en-us/products/key-vault) - Manage keys and secrets on Azure
- [Google Cloud KMS](https://cloud.google.com/security-key-management) - Manage keys on Google Cloud Platform
- [Google Secret Manager](https://cloud.google.com/secret-manager) - Manage secrets on Google Cloud Platform

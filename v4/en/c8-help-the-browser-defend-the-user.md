---

layout: col-document
tags: OWASP Top Ten Proactive Controls 2024, C8, Help the Browser defend its User
document: OWASP Top Ten Proactive Controls 2024
order: 412

---

# C8: Help the Browser defend its User

## Description

Browsers are the gateway to the web for most users. As such, it's critical to employ robust security measures to protect the user from various threats. This section outlines the techniques and policies that can be implemented to bolster browser security.

While we are currently focusing upon traditional web browsers, please note that there is a diverse world of other client programs out there, ranging from API clients to smart-tvs.

### Opportunistic Security and Browser-Support

Instructing the web browser to enforce security measures is always opportunistic: the web application cannot verify that the browser heeds the guidance given and thus these security measures should always be seen as additional (and optional) **Hardening Measures** that further complicate an attacker’s life.

In addition, web browsers must actually support the security guidance offered by web applications. The level of support differs between different browsers and their versions. Web sites such as <https://caniuse.com> can be used to check which web browser (versions) support which features. The supported security features can change over time, e.g., the X-XSS-Protection header has been removed from all major browsers; the browsers’ default behavior can change over time as seen with Referrer-Policy; and even the semantics of existing headers can change over time as seen with X-Content-Type-Options.

While the changing browser feature set can be problematic, typically newer browser provide more security features. They sometimes even enable them by default. Explicitly setting those security headers can unify the different browsers’ behaviors and thus reduces maintenance effort.

A fully compromised browser might not heed security guidance but if an adversary was able to take full control of a browser, they already have far more damaging attack paths than just ignoring security guidance.

## Implementation

Typically, there are two (Security Header specific) ways that web applications can use to instruct web browsers about security: HTTP headers and HTML tags.

The behavior taken if a security directive is given more than one time is security header specific. For example, a duplicate X-Frame-Options header will disable its protection while a duplicate Content-Security-Policy header will lead to a stricter policy thus tightening its security.
The following is a non-exhaustive list of potential Hardening mechanisms:

### Configure the Browser to prevent Information Disclosure

Information disclosure occurs if the browser transmits information over unencrypted channels (HTTP instead of HTTPS) or sends our too much information in the first place (e.g., through the Referer-Header). The following mechanisms reduce the possibility of information disclosure:
- **HTTP Strict Transport Security (HSTS)**: Ensures that browsers only connect to your website over HTTPS, preventing SSL stripping attacks.
- **Content Security Policy (CSP)**: CSP policies can instruct the browser to automatically upgrade HTTP connections to HTTPS. In addition directives such as the form-src directive can be used to prevent forms from transmitting data to external sites.
- **Referrer-Policy**: when navigating between pages, the browser’s HTTP request includes the current URL within the outgoing request. This URL can include sensitive information. Using Referrer-Policy, a web-site can unify the browser’s behavior and select which information should be transmitted between web sites.
- The cookie’s **secure** flag: while not a HTTP header, this security flag is related to information disclosure. If set, the web browser will not transmit a cookie over unencrypted HTTP transports.

### Reduce the potential Impact of XSS

Javascript based XSS attacks have been very common for decades. To reduce the potential impact of vulnerabilities, browsers offer rich defensive mechanisms that should reduce the potential impact of XSS attacks:
- **Content Security Policy (CSP)**: CSP is a powerful tool that helps prevent a wide range of attacks including Cross-Site Scripting (XSS) and data injection. Strict CSP policies can effectively disable inline JavaScript and style, making it much harder for attackers to inject malicious content.  
    Host Allowlist CSP: Blocking all third-party JavaScript can significantly reduce the attack surface and prevent the exploitation of vulnerabilities in third-party libraries.  
    **Trusted Types**: This is a browser API that helps prevent DOM-based cross-site scripting vulnerabilities by ensuring only secure data types can be inserted into the DOM.
- The cookie’s **httpOnly** flag: while not a HTTP header, setting this flag prevents Javascript from accessing this cookie and should be done esp. For Session cookies.

### Prevent Clickjacking

Clickjacking, also known as UI-redress attacks, try to confuse users by overlaying a malicious site on top of a benign one. The user believes to interact with the benign one while in reality they are interacting with the malicious one.
- **X-Frame-Options (XFO)**: Prevents clickjacking attacks by ensuring your content is not embedded into other sites. This header is finicky to use, e.g., when used twice it is disabled.
- **Content Security Policy (CSP)**: the different frame-\* directives allow for fine-grained control of which sites are allowed to include the current website as well as which other sites can be included within the current website.

### Control the Browser’s Advanced Capabilities

Modern browsers do not only display HTML code but are used to interface with multiple system components such as WebCams, Microphones, USB Devices, etc. While many websites do not utilize those features, attackers can abuse those.
- **Permission Policy**: through a permission policy a web-site can instruct the browser that the defined features will not be used by the web-site. For example, a web-site can state that it will never capture user audio. Even if an attacker is able to inject malicious code, they can thus not instruct the web-browser to capture audio.

### Prevent CSRF Attacks

CSRF attacks abuse an existing trust relationship between the web browser and web sites.
- Same-Origin Cookies: Marking cookies as SameSite can mitigate the risk of cross-origin information leakage, as well as provide some protection against cross-site request forgery attacks.

## Vulnerabilities Prevented

Implementing these browser defenses can help mitigate a range of vulnerabilities, including but not limited to:
- Cross-Site Scripting (XSS)
- Cross-Site Request Forgery (CSRF)
- Clickjacking
- Data Theft through insecure transmission
- Session Hijacking
- Abusing unintended browser hardware access (microphone, cameras, etc.)

## Tools
- [Web Check](https://github.com/Lissy93/web-check)
- [Security Headers](https://securityheaders.com/)
- [Mozilla Observatory](https://observatory.mozilla.org/)

## References

- [Content Security Policy (CSP)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP)
- [OWASP Secure Headers Project](https://owasp.org/www-project-secure-headers/)
- [Fetch Metadata Request Headers](https://www.w3.org/TR/fetch-metadata/)
- <https://caniuse.com/>

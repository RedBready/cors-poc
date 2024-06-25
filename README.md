# cors-poc
Companion code for TrustedSec's "CORS Findings: Another Way to Comprehend"
  blog post. See https://www.trustedsec.com/2018/04/cors-findings/ to understand situations where this could be useful.

## Automated Setup with cors.sh
This will update the html files to point to the correct target site and malicious webserver. The attacker controlled server is malicious IP variable and the target variable is the system vulnerable to CORS.

- Clone Repo
```
git clone git@github.com:RedBready/cors-poc.git
```
- Run Script
```
./cors.sh 100.10.10.10 https://example.com/admin/users
```

## Manual Usage
```
git clone git@github.com:RedBready/cors-poc.git
```
* `cd cors-poc`
* Edit **corstest.html** to update [target-site/target-page] and [our-server].
* `python3 -m http.server --cgi` **Caution:** all files in the current directory and sub-directories will be served on 
   HTTP port 8000.
* Browse to **corstest.html** from a "victim" browser.

If all goes well, cross-origin responses from the victim browser will be displayed and also stored in **captured-post-data.txt**.


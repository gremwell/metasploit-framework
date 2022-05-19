<!--
  Please fill out each section below, otherwise, your issue will be closed. This info allows Metasploit maintainers to diagnose (and fix!) your issue as quickly as possible.

  Useful Links:
  - Wiki: https://github.com/rapid7/metasploit-framework/wiki
  - Reporting a Bug: https://github.com/rapid7/metasploit-framework/wiki/Reporting-a-Bug

  Before opening a new issue, please search existing issues: https://github.com/rapid7/metasploit-framework/issues
-->
## Overview

ipv6_neighbor.rb scanner does the following:

* scans set of ipv4 host ranges via ARP requests
* uses identified MAC addresses to calculate link-local IPv6 addresses
* uses NDP to confirm the calculated link-local address is live
* mapping ipv4 to calculated link-local ipv6 addresses

## Problem

getadvertisement function (ipv6_neighbor.rb [line #213](https://github.com/rapid7/metasploit-framework/blob/master/modules/auxiliary/scanner/discovery/ipv6_neighbor.rb#L213)) returns nothing unless packet payload starts with "\x88\x00", probably referring to the payload of IPv6 packet which carries header of ICMPv6. but the actual value of p.payload at this point is  ```\x00\x00\x00\xFE\x80\x00\x00\x00\x00``` - the payload of ICMPv6 protocol. Thereby, getadvertisement function fails to detect NA responses.

## Steps to reproduce issue

- Run msfconsole

```bash
./msfconsole 
```

- Choose auxiliary scanner 
```bash
use ipv6_neighbor.rb
```

- Set ipv4 range
```bash
set rhosts 10.0.0.1-5
```

- Run module
```bash
run or exploit
```

## Current behavior
```
[*] Discovering IPv4 nodes via ARP...
[+]           10.0.0.2 ALIVE
[+]           10.0.0.3 ALIVE
[*] Discovering IPv6 addresses for IPv4 nodes...
[*] 
[*] Scanned 5 of 5 hosts (100% complete)
[*] Auxiliary module execution completed
```

## Expected behavior
```
[*] Discovering IPv4 nodes via ARP...
[+]           10.0.0.2 ALIVE
[+]           10.0.0.3 ALIVE
[*] Discovering IPv6 addresses for IPv4 nodes...
[*]           10.0.0.2 maps to fe80::d819:abff:fecc:4a35
[*]           10.0.0.3 maps to fe80::44bc:18ff:fe71:f5a2
[*] Scanned 5 of 5 hosts (100% complete)
[*] Auxiliary module execution completed
```

### Metasploit version

- Framework: 6.1.43-dev-

- Console  : 6.1.43-dev

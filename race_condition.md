<!--
  Please fill out each section below, otherwise, your issue will be closed. This info allows Metasploit maintainers to diagnose (and fix!) your issue as quickly as possible.

  Useful Links:
  - Wiki: https://github.com/rapid7/metasploit-framework/wiki
  - Reporting a Bug: https://github.com/rapid7/metasploit-framework/wiki/Reporting-a-Bug

  Before opening a new issue, please search existing issues: https://github.com/rapid7/metasploit-framework/issues
-->
## Overview

ipv6_neighbor.rb scanner used for scanning set of ipv4 host ranges via ARP requests, getting their mac addresses, comparing them with mac addresses which were obtained from NS and NA responses of NDP, for further ipv4 to ipv6 mappings.

## Problem

Due to time limitations [here](https://github.com/rapid7/metasploit-framework/blob/master/modules/auxiliary/scanner/discovery/ipv6_neighbor.rb#L77). Last arp response of last host, for example which is ```10.0.0.6``` wont be catched and outputted as **Alive host**.

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
set rhosts 10.0.0.1-6
```

- Run module
```bash
run or exploit
```

## Current behavior
```
[*] Discovering IPv4 nodes via ARP...
[+]           10.0.0.2 ALIVE
[*] Discovering IPv6 addresses for IPv4 nodes...
[*] 
[*] Scanned 6 of 6 hosts (100% complete)
[*] Auxiliary module execution completed
```

## Expected behavior
```
[*] Discovering IPv4 nodes via ARP...
[+]           10.0.0.2 ALIVE
[+]           10.0.0.6 ALIVE
[*] Discovering IPv6 addresses for IPv4 nodes...
[*]
[*] Scanned 5 of 5 hosts (100% complete)
[*] Auxiliary module execution completed
```

### Metasploit version

- Framework: 6.1.43-dev-

- Console  : 6.1.43-dev

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

Due to improper filtering in ipv6_neighbor.rb [line #213](https://github.com/rapid7/metasploit-framework/blob/master/modules/auxiliary/scanner/discovery/ipv6_neighbor.rb#L213), payload returns nothing unless it will be ``` p.payload[0,2] == "\x88\x00"```,  but the actual payload, that is coming from [function](https://github.com/rapid7/metasploit-framework/blob/master/modules/auxiliary/scanner/discovery/ipv6_neighbor.rb#L206) is ```\x00\x00\x00\xFE\x80\x00\x00\x00\x00```. Thereby, ```getadvertisement``` doesnt return anything, and ipv4 to ipv6 mappings wont work, because expected values will not be passed to [adv variable](https://github.com/rapid7/metasploit-framework/blob/master/modules/auxiliary/scanner/discovery/ipv6_neighbor.rb#L129) and next functionality will not have anything to compare and map.

## Steps to reproduce issue

- Run msfconsole

```bash
./msfconsole 
```

- Choose auxiliary scanner 
  ```use ipv6_neighbor.rb```

- Set ipv4 range
    ```set rhosts 10.0.0.1-5```

- Run module
   ```run or exploit```

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

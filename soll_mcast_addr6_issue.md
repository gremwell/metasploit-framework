<!--
  Please fill out each section below, otherwise, your issue will be closed. This info allows Metasploit maintainers to diagnose (and fix!) your issue as quickly as possible.

  Useful Links:
  - Wiki: https://github.com/rapid7/metasploit-framework/wiki
  - Reporting a Bug: https://github.com/rapid7/metasploit-framework/wiki/Reporting-a-Bug

  Before opening a new issue, please search existing issues: https://github.com/rapid7/metasploit-framework/issues
-->
## Overview

ipv6.rb module:

* This module provides common tools for IPv6
* [This Function](https://github.com/rapid7/metasploit-framework/blob/4ecee9755c9329087742296e91f90038f1c85b16/lib/msf/core/exploit/remote/ipv6.rb#L253) in ```ipv6``` module provides generation of solicited-multicast address from link-local address

## Problem

```ipv6_soll_mcast_addr6``` function provides improper solicited-multicast address when the last 16 bits of link-local address are leading zeros. 

## Steps to reproduce issue

- copy ```ipv6_soll_mcast_addr6``` function and save it as ruby file.  

- add ```puts``` to this [line](https://github.com/rapid7/metasploit-framework/blob/4ecee9755c9329087742296e91f90038f1c85b16/lib/msf/core/exploit/remote/ipv6.rb#L260) to get output in terminal

- add after [last end](https://github.com/rapid7/metasploit-framework/blob/4ecee9755c9329087742296e91f90038f1c85b16/lib/msf/core/exploit/remote/ipv6.rb#L261) - function caller ```ipv6_soll_mcast_addr6()```

- pass link-local address to function 
```bash
ipv6_soll_mcast_addr6("fe80::200:00ff:fe00:0002")
```

- the whole code looks like this:
```ruby
def ipv6_soll_mcast_addr6(addr)
  h = addr.split(':')[-2, 2]
  m = []
  m << 'ff'
  m << (h[0].to_i(16) & 0xff).to_s(16)
  m << ((h[1].to_i(16) & (0xff << 8)) >> 8).to_s(16)
  m << (h[1].to_i(16) & 0xff).to_s(16)
  puts 'ff02::1:' + [m[0,2].join, m[2,2].join].join(':')
end

ipv6_soll_mcast_addr6("fe80::200:00ff:fe00:0002")
```

- run ruby file
```bash
ruby file_name.rb
```

## Current behavior

- output from terminal

```bash
ff02::1:ff0:02
```

## Expected behavior

- output from terminal

```bash
ff02::1:ff00:2
```

### Ruby version

- ruby 2.6.3p62

# Manual how to test modules

Modules:
  * adv_original_payload.rb
  * adv_edited_payload.rb
 
Tests:
  *  original_payload.rc
  *  edited_payload.rc

## Test for adv_original_payload.rb
   1. Copy ```adv_original_payload.rb``` to preferrable location. Example location: ```/opt/metasploit-framework/embedded/framework/modules/auxiliary/scanner/discovery/advertisement/```
   
   3. Copy ```original_payload.rc``` to the same location as ```adv_original_payload.rb```
   4. Check, that [line](https://github.com/gremwell/metasploit-framework/blob/issues_template/tests/getadvertisement_issue/original_payload.rc#L1) have correct path to ```adv_original_payload.rb```
   5. Run ```reload_all``` after adding new modules/test
   6. Run test: ```resource original_payload.rc```

## Expected behavior of testing original_payload.rb
```
[*] Discovering IPv4 nodes via ARP...
[+]           10.0.0.2 ALIVE
[*] Discovering IPv6 addresses for IPv4 nodes...
[*] 
[*] Scanned 3 of 3 hosts (100% complete)
[*] Auxiliary module execution completed
```

## Test for time_edited_payload.rb
   1. Copy ```adv_edited_payload.rb``` to preferrable location. Example location: ```/opt/metasploit-framework/embedded/framework/modules/auxiliary/scanner/discovery/advertisement/```
   
   3. Copy ```edited_payload.rc``` to the same location as ```adv_edited_payload.rb```
   4. Check, that [line](https://github.com/gremwell/metasploit-framework/blob/issues_template/tests/getadvertisement_issue/edited_payload.rc#L1) have correct path to ```adv_edited_payload.rb```
   5. Run ```reload_all``` after adding new modules/test
   6. Run test: ```resource edited_payload.rc```
 
## Expected behavior of testing edited_payload.rb
```
[*] Discovering IPv4 nodes via ARP...
[+]           10.0.0.2 ALIVE
[+]           10.0.0.6 ALIVE
[*] Discovering IPv6 addresses for IPv4 nodes...
[*] 
[*]           10.0.0.2 maps to fe80::d819:abff:fecc:4a35
[*]           10.0.0.6 maps to fe80::f06e:f2ff:fe1b:65e6
[*] Scanned 6 of 6 hosts (100% complete)
[*] Auxiliary module execution completed
```

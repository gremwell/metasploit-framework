# Manual how to test modules

Modules:
  * time_original_payload.rb
  * time_edited_payload.rb
 
Tests:
  *  original_payload.rc
  *  edited_payload.rc

## Test for time_original_payload.rb
   1. Copy ```time_original_payload.rb``` to preferrable location. Example location: ```/opt/metasploit-framework/embedded/framework/modules/auxiliary/scanner/discovery/race_condition/```
   2. Copy ```original_payload.rc``` to the same location as ```time_original_payload.rb```
   3. Check, that [line](https://github.com/gremwell/metasploit-framework/blob/issues_template/tests/race_condition_issue/original_payload.rc#L1) have correct path to ```time_original_payload.rb```
   4. Run test: ```resource original_payload.rc```

## Expected behavior of testing time_original_payload.rb
```
[*] Discovering IPv4 nodes via ARP...
[+]           10.0.0.2 ALIVE
[*] Discovering IPv6 addresses for IPv4 nodes...
[*] 
[*] Scanned 6 of 6 hosts (100% complete)
[*] Auxiliary module execution completed
```

## Test for time_edited_payload.rb
   1. Copy ```time_edited_payload.rb``` to preferrable location. Example location: ```/opt/metasploit-framework/embedded/framework/modules/auxiliary/scanner/discovery/race_condition/```
   2. Copy ```edited_payload.rc``` to the same location as ```time_edited_payload.rb```
   3. Check, that [line](https://github.com/gremwell/metasploit-framework/blob/issues_template/tests/race_condition_issue/edited_payload.rc#L1) have correct path to ```time_edited_payload.rb```
   4. Run test: ```resource edited_payload.rc```
 
## Expected behavior of testing time_edited_payload.rb
```
[*] Discovering IPv4 nodes via ARP...
[+]           10.0.0.2 ALIVE
[+]           10.0.0.6 ALIVE
[*] Discovering IPv6 addresses for IPv4 nodes...
[*] 
[*] Scanned 6 of 6 hosts (100% complete)
[*] Auxiliary module execution completed
```

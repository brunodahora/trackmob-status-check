# Trackmob Status Check

Simple code for showing a status report from Trackmob systems in Slack.
Currently available systems:

- **guaracrm_prd:** GuaraCRM in Production
- **guaracrm_stg:** GuaraCRM in Staging
- **f2f_unicef:** F2F app for Unicef
- **f2f_irm:** F2F app for Instituto Ronald McDonald's
- **f2f_aldeias:** F2F app for Aldeias
- **f2f_posithivo:** F2F app for Instituto Posithivo
- **f2f_msf:** F2F app for MSF
- **f2f_habitat:** F2F app for Habitat

To get the status report, use in Slack _/wt status-check_

## Update

It is necessary to run the upate before getting the status-check to refresh the status.

Run _/wt status-check update_

## Check

For a full check use _/wt status-check_ or _/wt status-check all_


For specific checks use the tag as described above as parameters after *status-check*

For example: _/wt status-check guaracrm_prd f2f_unicef_

## Result

Example of full answer:

```
Status Check:
guaracrm_prd: OK in 796 ms
guaracrm_stg: ERROR in 1671 ms
f2f_unicef: OK in 780 ms
f2f_irm: OK in 773 ms
f2f_aldeias: OK in 782 ms
f2f_posithivo: OK in 793 ms
f2f_msf: OK in 772 ms
f2f_habitat: OK in 785 ms
```

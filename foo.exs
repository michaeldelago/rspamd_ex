{:ok,
 %RspamdEx.Client.ScanResults{
   action: "add header",
   filename: "/home/mike/prog/rspamd_ex/test/sample_emails/add_header.eml",
   is_skipped: false,
   "message-id": "undef",
   messages: %{},
   milter: %{remove_headers: %{"X-Spam": 0}},
   required_score: 11.0,
   scan_time: 0.003333,
   score: 10.4,
   symbols: %{
     ARC_NA: %{
       description: "ARC signature absent",
       metric_score: 0.0,
       name: "ARC_NA",
       score: 0.0
     },
     DMARC_NA: %{
       description: "No DMARC record",
       metric_score: 0.0,
       name: "DMARC_NA",
       options: ["No From header"],
       score: 0.0
     },
     HFILTER_HOSTNAME_UNKNOWN: %{
       description: "Unknown client hostname (PTR or FCrDNS verification failed)",
       metric_score: 2.5,
       name: "HFILTER_HOSTNAME_UNKNOWN",
       score: 2.5
     },
     MIME_GOOD: %{
       description: "Known content-type",
       metric_score: -0.1,
       name: "MIME_GOOD",
       options: ["text/plain"],
       score: -0.1
     },
     MIME_TRACE: %{
       metric_score: 0.0,
       name: "MIME_TRACE",
       options: ["0:+"],
       score: 0.0
     },
     MISSING_DATE: %{
       description: "Message date is missing",
       metric_score: 1.0,
       name: "MISSING_DATE",
       score: 1.0
     },
     MISSING_FROM: %{
       description: "Missing From: header",
       metric_score: 2.0,
       name: "MISSING_FROM",
       score: 2.0
     },
     MISSING_MID: %{
       description: "Message id is missing",
       metric_score: 2.5,
       name: "MISSING_MID",
       score: 2.5
     },
     MISSING_SUBJECT: %{
       description: "Subject header is missing",
       metric_score: 2.0,
       name: "MISSING_SUBJECT",
       score: 0.5
     },
     MISSING_TO: %{
       description: "To header is missing",
       metric_score: 2.0,
       name: "MISSING_TO",
       score: 2.0
     },
     RCVD_COUNT_ZERO: %{
       description: "Message has no Received headers",
       metric_score: 0.0,
       name: "RCVD_COUNT_ZERO",
       options: ["0"],
       score: 0.0
     },
     R_DKIM_NA: %{
       description: "Missing DKIM signature",
       metric_score: 0.0,
       name: "R_DKIM_NA",
       score: 0.0
     }
   },
   time_real: 0.001315
 }}

 {:ok,
 %RspamdEx.Client.ScanResults{
   action: "add header",
   filename: "/home/mike/prog/rspamd_ex/test/sample_emails/add_header.eml",
   is_skipped: false,
   "message-id": "undef",
   messages: %{},
   milter: %{remove_headers: %{"X-Spam": 0}},
   required_score: 11.0,
   scan_time: 0.003333,
   score: 10.4,
   symbols: %{
     ARC_NA: %{
       description: "ARC signature absent",
       metric_score: 0.0,
       name: "ARC_NA",
       score: 0.0
     },
     DMARC_NA: %{
       description: "No DMARC record",
       metric_score: 0.0,
       name: "DMARC_NA",
       options: ["No From header"],
       score: 0.0
     },
     HFILTER_HOSTNAME_UNKNOWN: %{
       description: "Unknown client hostname (PTR or FCrDNS verification failed)",
       metric_score: 2.5,
       name: "HFILTER_HOSTNAME_UNKNOWN",
       score: 2.5
     },
     MIME_GOOD: %{
       description: "Known content-type",
       metric_score: -0.1,
       name: "MIME_GOOD",
       options: ["text/plain"],
       score: -0.1
     },
     MIME_TRACE: %{
       metric_score: 0.0,
       name: "MIME_TRACE",
       options: ["0:+"],
       score: 0.0
     },
     MISSING_DATE: %{
       description: "Message date is missing",
       metric_score: 1.0,
       name: "MISSING_DATE",
       score: 1.0
     },
     MISSING_FROM: %{
       description: "Missing From: header",
       metric_score: 2.0,
       name: "MISSING_FROM",
       score: 2.0
     },
     MISSING_MID: %{
       description: "Message id is missing",
       metric_score: 2.5,
       name: "MISSING_MID",
       score: 2.5
     },
     MISSING_SUBJECT: %{
       description: "Subject header is missing",
       metric_score: 2.0,
       name: "MISSING_SUBJECT",
       score: 0.5
     },
     MISSING_TO: %{
       description: "To header is missing",
       metric_score: 2.0,
       name: "MISSING_TO",
       score: 2.0
     },
     RCVD_COUNT_ZERO: %{
       description: "Message has no Received headers",
       metric_score: 0.0,
       name: "RCVD_COUNT_ZERO",
       options: ["0"],
       score: 0.0
     },
     R_DKIM_NA: %{
       description: "Missing DKIM signature",
       metric_score: 0.0,
       name: "R_DKIM_NA",
       score: 0.0
     }
   },
   time_real: 0.002104
 }}

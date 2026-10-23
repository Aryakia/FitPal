# FitPal Privacy Note (Early Release)

FitPal supports a guest mode and an optional cloud account mode.

**Guest mode:** Profile data, training routines, workout history and body measurements are stored in your browser's local storage. No FitPal-managed backend receives those values. Other people using the same browser profile can access the records. Clearing site data may erase them; exported backup files may contain sensitive measurements.

**Cloud mode, if enabled by the operator:** After email verification and sign-in, FitPal sends profile and training records to the configured Supabase database. A Row Level Security policy limits access to the authenticated account owner. Records are not committed to the public GitHub repository. Browser session tokens may be stored locally by the authentication library to maintain sign-in.

**Third parties:** Exercise illustrations may be fetched from a CDN and Supabase authentication uses the operator's Supabase project. Those services may receive standard network information such as IP addresses. No advertising or analytics services are built into the supplied FitPal source.

**User controls:** Export workout data and measurements in-app. Guest records can be removed locally. A cloud account's fitness data can be removed through the database owner; permanent deletion of the authentication account requires an operator-managed deletion process (not yet self-service).

Before public signup, the operator must complete this notice with their contact details, data retention policies, legal basis, and contact procedure for account/data deletion. This document is a technical starter, not a final legal compliance assessment.

# Air Emissions Permit Operations

Translate reviewed permit conditions into monitoring tasks; reconcile emissions logs; manage deviations and reporting packets.

## Implemented records

- **Emission Facility**: name, permit Number, operator, jurisdiction, address, reporting Year, opened At, status.
- **Emission Unit**: name, unit Code, process, fuel Type, commissioned At, capacity, status.
- **Permit Condition**: title, pollutant, limit Value, unit, averaging Period, rule Version, status.
- **Activity Reading**: title, observed At, quantity, unit, source, status.
- **Emission Factor**: title, pollutant, factor, unit, source Version, status.
- **Stack Test**: title, tested At, pollutant, measured Value, unit, laboratory, status.
- **Control Device**: title, device Type, inspection At, observations, next Due At, status.
- **Deviation Event**: title, started At, ended At, cause, corrective Action, status.
- **Emission Report**: title, period Start, period End, preparer, calculation Reference, submission Receipt, status.
- **Operational Task**: title, owner, priority, start At, due At, done, notes, status.
- **Rule Version**: title, jurisdiction, version, effective At, expires At, source Url, requirement Text, status.
- **Document Requirement**: title, category, required By, source Reference, evidence Reference, review Notes, status.

## AI workflows

- Permit condition extraction: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Activity evidence reconciliation: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Stack test comparison: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Deviation narrative draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Control-device maintenance brief: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Annual report narrative: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Evidence completeness review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Operations handoff draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.

## Calculations

- Emission factor calculation: Compute uncontrolled and controlled kilograms from supplied factors and efficiency, then compare a matching-period limit.
- Emission Facility evidence checklist: Check source presence against an explicitly supplied document list; reviewer assesses adequacy.
- Operational deadline queue: Compute overdue items from entered dates and completed flags; no external notifications.

## Workspace features

Role-based login and account management; validated create/edit/delete; required parent and sibling relationships; search and pagination; atomic JSON imports; CSV/JSON exports; optimistic concurrency; two independent human reviews; immutable source-text uploads with independent review; dated task calendar; aggregate reports; searchable audit trail; model catalog and administrator AI settings; configured HTTPS connectors with approval, idempotency and receipt checks.

## Integration boundaries

A finite working scope, not every conceivable feature. No production regulator, insurer, carrier, court, university or clinical integration is preconfigured. Source uploads support text/CSV/JSON/Markdown, not OCR/PDF parsing. AI produces drafts and cannot authorize clinical handling, adjudicate rights, select recipients or jurors, establish eligibility, certify regulatory compliance or send submissions. Live external execution requires a configured adapter and independent human approval of the current record. Calculations use supplied rules and units; example rules are fictional.

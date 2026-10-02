export interface PageConfig {
  label: string;
  href: string;
  description: string;
  entities: string[];
  workflows: string[];
}

export interface EntityConfig {
  name: string;
  label: string;
  fields: Array<{ name: string; kind: "string" | "number" | "boolean" | "date" }>;
}

export interface WorkflowConfig {
  slug: string;
  title: string;
  description: string;
  prompt: string;
  fields: string[];
}

export const appConfig = {
  "slug": "ai-air-emissions-permit-operations",
  "title": "Air Emissions Permit Operations",
  "tagline": "Translate reviewed permit conditions into monitoring tasks; reconcile emissions logs; manage deviations and reporting packets.",
  "accent": "rose"
};
export const pages: PageConfig[] = [
  {
    "label": "Intake & registers",
    "href": "/registers",
    "description": "Translate reviewed permit conditions into monitoring tasks; reconcile emissions logs; manage deviations and reporting packets.",
    "entities": [
      "EmissionFacility",
      "EmissionUnit",
      "PermitCondition"
    ],
    "workflows": [
      "permit-condition-extraction",
      "activity-evidence-reconciliation"
    ]
  },
  {
    "label": "Operational records",
    "href": "/workflow",
    "description": "Translate reviewed permit conditions into monitoring tasks; reconcile emissions logs; manage deviations and reporting packets.",
    "entities": [
      "ActivityReading",
      "EmissionFactor",
      "StackTest"
    ],
    "workflows": [
      "stack-test-comparison",
      "deviation-narrative-draft"
    ]
  },
  {
    "label": "Review & delivery",
    "href": "/delivery",
    "description": "Translate reviewed permit conditions into monitoring tasks; reconcile emissions logs; manage deviations and reporting packets.",
    "entities": [
      "ControlDevice",
      "DeviationEvent",
      "EmissionReport"
    ],
    "workflows": [
      "control-device-maintenance-brief",
      "annual-report-narrative"
    ]
  },
  {
    "label": "Tasks & requirements",
    "href": "/operations",
    "description": "Assignments, versioned rules and document requirements.",
    "entities": [
      "OperationalTask",
      "RuleVersion",
      "DocumentRequirement"
    ],
    "workflows": [
      "evidence-completeness-review",
      "operations-handoff-draft"
    ]
  }
];
export const entities: Record<string, EntityConfig> = {
  "EmissionFacility": {
    "name": "EmissionFacility",
    "label": "Emission Facility",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "permitNumber",
        "kind": "string"
      },
      {
        "name": "operator",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "address",
        "kind": "string"
      },
      {
        "name": "reportingYear",
        "kind": "number"
      },
      {
        "name": "openedAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      }
    ]
  },
  "EmissionUnit": {
    "name": "EmissionUnit",
    "label": "Emission Unit",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "unitCode",
        "kind": "string"
      },
      {
        "name": "process",
        "kind": "string"
      },
      {
        "name": "fuelType",
        "kind": "string"
      },
      {
        "name": "commissionedAt",
        "kind": "date"
      },
      {
        "name": "capacity",
        "kind": "number"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "emissionFacilityId",
        "kind": "string"
      }
    ]
  },
  "PermitCondition": {
    "name": "PermitCondition",
    "label": "Permit Condition",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "pollutant",
        "kind": "string"
      },
      {
        "name": "limitValue",
        "kind": "number"
      },
      {
        "name": "unit",
        "kind": "string"
      },
      {
        "name": "averagingPeriod",
        "kind": "string"
      },
      {
        "name": "ruleVersion",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "emissionFacilityId",
        "kind": "string"
      }
    ]
  },
  "ActivityReading": {
    "name": "ActivityReading",
    "label": "Activity Reading",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "emissionUnitId",
        "kind": "string"
      },
      {
        "name": "observedAt",
        "kind": "date"
      },
      {
        "name": "quantity",
        "kind": "number"
      },
      {
        "name": "unit",
        "kind": "string"
      },
      {
        "name": "source",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "emissionFacilityId",
        "kind": "string"
      }
    ]
  },
  "EmissionFactor": {
    "name": "EmissionFactor",
    "label": "Emission Factor",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "emissionUnitId",
        "kind": "string"
      },
      {
        "name": "pollutant",
        "kind": "string"
      },
      {
        "name": "factor",
        "kind": "number"
      },
      {
        "name": "unit",
        "kind": "string"
      },
      {
        "name": "sourceVersion",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "emissionFacilityId",
        "kind": "string"
      }
    ]
  },
  "StackTest": {
    "name": "StackTest",
    "label": "Stack Test",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "emissionUnitId",
        "kind": "string"
      },
      {
        "name": "testedAt",
        "kind": "date"
      },
      {
        "name": "pollutant",
        "kind": "string"
      },
      {
        "name": "measuredValue",
        "kind": "number"
      },
      {
        "name": "unit",
        "kind": "string"
      },
      {
        "name": "laboratory",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "emissionFacilityId",
        "kind": "string"
      }
    ]
  },
  "ControlDevice": {
    "name": "ControlDevice",
    "label": "Control Device",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "emissionUnitId",
        "kind": "string"
      },
      {
        "name": "deviceType",
        "kind": "string"
      },
      {
        "name": "inspectionAt",
        "kind": "date"
      },
      {
        "name": "observations",
        "kind": "string"
      },
      {
        "name": "nextDueAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "emissionFacilityId",
        "kind": "string"
      }
    ]
  },
  "DeviationEvent": {
    "name": "DeviationEvent",
    "label": "Deviation Event",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "emissionUnitId",
        "kind": "string"
      },
      {
        "name": "startedAt",
        "kind": "date"
      },
      {
        "name": "endedAt",
        "kind": "date"
      },
      {
        "name": "cause",
        "kind": "string"
      },
      {
        "name": "correctiveAction",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "emissionFacilityId",
        "kind": "string"
      }
    ]
  },
  "EmissionReport": {
    "name": "EmissionReport",
    "label": "Emission Report",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "periodStart",
        "kind": "date"
      },
      {
        "name": "periodEnd",
        "kind": "date"
      },
      {
        "name": "preparer",
        "kind": "string"
      },
      {
        "name": "calculationReference",
        "kind": "string"
      },
      {
        "name": "submissionReceipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "emissionFacilityId",
        "kind": "string"
      }
    ]
  },
  "OperationalTask": {
    "name": "OperationalTask",
    "label": "Operational Task",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "priority",
        "kind": "string"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "done",
        "kind": "boolean"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "emissionFacilityId",
        "kind": "string"
      }
    ]
  },
  "RuleVersion": {
    "name": "RuleVersion",
    "label": "Rule Version",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "emissionFacilityId",
        "kind": "string"
      }
    ]
  },
  "DocumentRequirement": {
    "name": "DocumentRequirement",
    "label": "Document Requirement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "requiredBy",
        "kind": "date"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "evidenceReference",
        "kind": "string"
      },
      {
        "name": "reviewNotes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "emissionFacilityId",
        "kind": "string"
      }
    ]
  }
};
export const workflows: WorkflowConfig[] = [
  {
    "slug": "permit-condition-extraction",
    "title": "Permit condition extraction",
    "description": "Permit condition extraction using selected emission facility records and supplied evidence.",
    "prompt": "Permit condition extraction for Air Emissions Permit Operations. Operational scope: Translate reviewed permit conditions into monitoring tasks; reconcile emissions logs; manage deviations and reporting packets. Specific AI scope: Extract permit obligations and draft evidence-linked deviation narratives. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "activity-evidence-reconciliation",
    "title": "Activity evidence reconciliation",
    "description": "Activity evidence reconciliation using selected emission facility records and supplied evidence.",
    "prompt": "Activity evidence reconciliation for Air Emissions Permit Operations. Operational scope: Translate reviewed permit conditions into monitoring tasks; reconcile emissions logs; manage deviations and reporting packets. Specific AI scope: Extract permit obligations and draft evidence-linked deviation narratives. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "stack-test-comparison",
    "title": "Stack test comparison",
    "description": "Stack test comparison using selected emission facility records and supplied evidence.",
    "prompt": "Stack test comparison for Air Emissions Permit Operations. Operational scope: Translate reviewed permit conditions into monitoring tasks; reconcile emissions logs; manage deviations and reporting packets. Specific AI scope: Extract permit obligations and draft evidence-linked deviation narratives. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "deviation-narrative-draft",
    "title": "Deviation narrative draft",
    "description": "Deviation narrative draft using selected emission facility records and supplied evidence.",
    "prompt": "Deviation narrative draft for Air Emissions Permit Operations. Operational scope: Translate reviewed permit conditions into monitoring tasks; reconcile emissions logs; manage deviations and reporting packets. Specific AI scope: Extract permit obligations and draft evidence-linked deviation narratives. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "control-device-maintenance-brief",
    "title": "Control-device maintenance brief",
    "description": "Control-device maintenance brief using selected emission facility records and supplied evidence.",
    "prompt": "Control-device maintenance brief for Air Emissions Permit Operations. Operational scope: Translate reviewed permit conditions into monitoring tasks; reconcile emissions logs; manage deviations and reporting packets. Specific AI scope: Extract permit obligations and draft evidence-linked deviation narratives. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "annual-report-narrative",
    "title": "Annual report narrative",
    "description": "Annual report narrative using selected emission facility records and supplied evidence.",
    "prompt": "Annual report narrative for Air Emissions Permit Operations. Operational scope: Translate reviewed permit conditions into monitoring tasks; reconcile emissions logs; manage deviations and reporting packets. Specific AI scope: Extract permit obligations and draft evidence-linked deviation narratives. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "evidence-completeness-review",
    "title": "Evidence completeness review",
    "description": "Evidence completeness review using selected emission facility records and supplied evidence.",
    "prompt": "Evidence completeness review for Air Emissions Permit Operations. Operational scope: Translate reviewed permit conditions into monitoring tasks; reconcile emissions logs; manage deviations and reporting packets. Specific AI scope: Extract permit obligations and draft evidence-linked deviation narratives. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "operations-handoff-draft",
    "title": "Operations handoff draft",
    "description": "Operations handoff draft using selected emission facility records and supplied evidence.",
    "prompt": "Operations handoff draft for Air Emissions Permit Operations. Operational scope: Translate reviewed permit conditions into monitoring tasks; reconcile emissions logs; manage deviations and reporting packets. Specific AI scope: Extract permit obligations and draft evidence-linked deviation narratives. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  }
];
export function findPage(href:string){return pages.find(p=>p.href===href);}

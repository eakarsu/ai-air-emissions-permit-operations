// Deterministic fallback over supplied own records. No provider call is made.
export type FallbackRow = { entity: string; record: Record<string, unknown> };
export function buildFallbackAnalysis(workflowTitle: string, rows: FallbackRow[], input: Record<string, string>) {
  const citations = rows.map((r) => `${r.entity}:${String(r.record.id ?? "")}`);
  const statuses = new Map<string, number>();
  for (const r of rows) { const s = typeof r.record.status === "string" ? r.record.status : ""; statuses.set(s, (statuses.get(s) ?? 0) + 1); }
  const entered = Object.entries(input).filter(([, v]) => String(v).trim());
  const findings = rows.length
    ? [`${rows.length} saved record(s) supplied for ${workflowTitle}: ${[...statuses.entries()].map(([s, n]) => `${s || "(no status)"}: ${n}`).join(", ")}.`]
    : [`No saved records were supplied for ${workflowTitle}; only entered fields were reviewed.`];
  if (entered.length) findings.push(`Entered fields reviewed: ${entered.map(([k]) => k).join(", ")}.`);
  return {
    status: "draft" as const, aiGenerated: false, model: "deterministic-fallback",
    summary: `Deterministic fallback for ${workflowTitle} \u2014 computed locally from ${rows.length} supplied record(s) and ${entered.length} entered field(s); no provider call was made.`,
    findings,
    recommendations: ["Review the cited saved records before acting.", "Add missing permit or monitoring evidence, then re-run for a fuller draft."],
    citations, limitations: ["Deterministic fallback only: no provider model reviewed this evidence.", "A qualified reviewer must validate permit conditions and calculations before submission."],
    riskLevel: null, confidence: null,
    sections: [
      { label: "Records reviewed", value: rows.length },
      { label: "Entered fields", value: entered.length },
      { label: "Has saved records", value: rows.length > 0 },
      { label: "First record reference", value: rows[0] ? String(rows[0].record.name ?? rows[0].record.title ?? rows[0].record.id ?? "") : "" },
    ],
  };
}

import { test } from "node:test";
import assert from "node:assert/strict";
import { buildFallbackAnalysis } from "../src/lib/ai-fallback";

test("fallback is labelled deterministic and preserves false, zero and empty", () => {
  const empty = buildFallbackAnalysis("Permit condition extraction", [], {});
  assert.equal(empty.aiGenerated, false);
  assert.equal(empty.model, "deterministic-fallback");
  const flat = Object.fromEntries(empty.sections.map((s) => [s.label, s.value]));
  assert.equal(flat["Records reviewed"], 0);
  assert.equal(flat["Has saved records"], false);
  assert.equal(flat["First record reference"], "");
});

test("fallback summarises own records with citations", () => {
  const out = buildFallbackAnalysis("Deviation narrative draft", [{ entity: "DeviationEvent", record: { id: "d1", status: "Draft", title: "Exceedance" } }], { notes: "x" });
  assert.deepEqual(out.citations, ["DeviationEvent:d1"]);
  assert.ok(out.summary.includes("no provider call"));
  assert.equal(Object.fromEntries(out.sections.map((s) => [s.label, s.value]))["Records reviewed"], 1);
});

# Release Notes

## v4.8.0 — 2026-09-16

**Logic layer (dual-axis faceted classification)**

- Added 10 equivalence axioms (GO genus–differentia pattern): `X ≡ ClinicalFinding and (findingSite some Site)` for HeadNeck/Thorax/Abdominal/Back/Limb/Skin/Tongue/Pulse/Female/Excretion finding classes; LimbFinding uses a union filler (UpperLimb or LowerLimb). WholeBodyFinding and PsychiatricFinding remain primitive (shared filler; equivalence would collapse them).
- Added property chain `findingSite ∘ partOf ⊑ findingSite`.
- Removed the AllDisjointClasses group over the 12 system finding classes: the clinical-workflow category axis (asserted) and the anatomical finding-site axis (inferred) are orthogonal facets; 318 cross-axis symptoms now receive legitimate multiple inferred parents (audit: `documentation/findingSite_category_conflicts.csv`).
- Reasoner validation (HermiT 1.4.x, Protégé): classification in 10.6–11.7 s, **0 unsatisfiable classes**.

**Metadata (v4.6 line, carried forward)**

- Ontology header: `dc:title/description/creator`, `terms:license` (CC-BY 4.0), `oboInOwl:default-namespace`, `owl:versionInfo`, `IAO:0000700`.
- All 1,938 classes: `oboInOwl:id`, `hasOBONamespace`; 1,642 `IAO:0000115` English definitions; 438 `hasExactSynonym`.
- 18 object properties labelled; `hasPart ⊑ BFO:0000051`, `partOf ⊑ BFO:0000050`, `inheresIn ⊑ RO:0000052`.

**Mappings**

- 2,329 expert-confirmed cross-references (649 HPO / 707 SNOMED CT / 973 ICD-11) re-expressed as `skos:exactMatch` (426) / `skos:closeMatch` (930) plus `oboInOwl:hasDbXref` (2,329); legacy `tcm:mapType` removed.

## v4.5.0 — 2026-07-31

- First public release: 1,938 classes (1,758 symptoms in 31 categories), 15,199 subclass axioms, 12,928 existential restrictions, bilingual labels, 1,637 English definitions (93.1%), mapping tables. Archived on Zenodo: https://doi.org/10.5281/zenodo.21769826

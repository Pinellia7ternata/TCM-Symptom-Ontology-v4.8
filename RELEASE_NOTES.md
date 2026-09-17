# Release Notes

## v4.9.0 — 2026-09-17

**Etiology enrichment (dueTo)**

- Added 3 new etiology classes: `e#PhlegmEvil` (痰浊, pathogenic phlegm), `e#StasisEvil` (瘀血, static blood), `e#WormEvil` (虫积, worm accumulation), subclasses of `Etiology`, with bilingual labels.
- Rule-based enrichment of `dueTo` existential restrictions: each symptom's authoritative Chinese definition (the “见于 …证” segment listing associated patterns) was parsed and pattern names mapped to etiology classes via combination rules (e.g., 风寒 → WindEvil + ColdEvil; 湿热 → DampnessEvil + FireEvil; 痰火 → PhlegmEvil + FireEvil; 情志/郁怒 → EmotionE; 食滞 → ImproperDiet; 外伤 → Trauma; 虫 → WormEvil). Added restrictions were unioned with pre-existing ones (nothing removed).
- Result: **2,842 new dueTo restrictions** across 1,235 symptom classes (FireEvil 776, DampnessEvil 461, WindEvil 380, StasisEvil 323, PhlegmEvil 289, ColdEvil 197, EmotionE 182, DrynessEvil 66, ImproperDiet 57, Trauma 40, WormEvil 39, SummerHeat 30, Overstrain 2).
- Reasoner validation (HermiT, Protégé): 0 unsatisfiable classes.

## v4.8.0 — 2026-09-16

**Logic layer (dual-axis faceted classification)**

- 10 equivalence axioms (GO genus–differentia pattern): `X ≡ ClinicalFinding and (findingSite some Site)` for HeadNeck/Thorax/Abdominal/Back/Limb/Skin/Tongue/Pulse/Female/Excretion finding classes; LimbFinding uses a union filler (UpperLimb or LowerLimb). WholeBodyFinding and PsychiatricFinding remain primitive.
- Property chain `findingSite ∘ partOf ⊑ findingSite`.
- Removed the AllDisjointClasses group over the 12 system finding classes (orthogonal dual-axis design); 318 cross-axis symptoms now receive legitimate multiple inferred parents (audit: `documentation/findingSite_category_conflicts.csv`).
- Reasoner validation (HermiT, Protégé): classification in 10.6–11.7 s, 0 unsatisfiable classes.
- Zenodo archive: https://doi.org/10.5281/zenodo.22803650

## v4.5.0 — 2026-07-31

- First public release: 1,938 classes (1,758 symptoms in 31 categories), 15,199 subclass axioms, 12,928 existential restrictions, bilingual labels, 1,637 English definitions (93.1%), mapping tables. Archived on Zenodo: https://doi.org/10.5281/zenodo.21769826

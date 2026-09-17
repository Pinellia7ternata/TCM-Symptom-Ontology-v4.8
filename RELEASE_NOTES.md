# Release Notes

## v4.10.0 — 2026-09-17

**Logical definitions of composite symptoms (pilot)**

- New object properties `hasComponent` (ClinicalFinding → ClinicalFinding) and `predominantComponent` (⊑ hasComponent); `hasModifier` domain widened to Quality ⊔ ClinicalFinding.
- New modifier value classes: `q#EveningWorsening` (入暮尤剧), `q#FrequentAttack` (频作).
- Nine symptom-level equivalence axioms (GO genus–differentia): 恶寒发热 ≡ CF ∩ hasComponent some 恶寒 ∩ hasComponent some 发热; six frequency-modified forms (呃逆/呵欠/咳嗽/喷嚏/嗳气 频作 ≡ base ∩ hasModifier some FrequentAttack); 寒热往来_入暮尤剧 ≡ 寒热往来 ∩ hasModifier some EveningWorsening; 发热重_恶寒轻 / 恶寒重_发热轻 ≡ 恶寒发热 ∩ predominantComponent some (发热/恶寒).
- HermiT validation: zero unsatisfiable classes; each composite classifies under its base symptom (e.g., 咳嗽频作 under 咳嗽).

## v4.9.0 — 2026-09-17

**Etiology enrichment (dueTo)**

- 3 new etiology classes: `PhlegmEvil` 痰浊, `StasisEvil` 瘀血, `WormEvil` 虫积 (⊑ Etiology, bilingual labels).
- Rule-based enrichment of `dueTo` restrictions from authoritative Chinese definitions (“见于…证” segment → combination rules: 风寒→WindEvil+ColdEvil; 湿热→DampnessEvil+FireEvil; 痰火→PhlegmEvil+FireEvil; 情志→EmotionE; 食滞→ImproperDiet; 外伤→Trauma; 虫→WormEvil), unioned with pre-existing curated restrictions.
- 2,842 new restrictions across 1,235 symptom classes; total 3,877 dueTo restrictions.
- HermiT validation: 0 unsatisfiable classes.

## v4.8.0 — 2026-09-16

**Logic layer (dual-axis faceted classification)**

- 10 equivalence axioms (GO genus–differentia): `X ≡ ClinicalFinding and (findingSite some Site)`; LimbFinding uses a union filler. WholeBodyFinding and PsychiatricFinding remain primitive.
- Property chain `findingSite ∘ partOf ⊑ findingSite`.
- Removed the AllDisjointClasses group over the 12 system finding classes (orthogonal dual-axis design); 318 cross-axis symptoms receive legitimate multiple inferred parents (audit: `documentation/findingSite_category_conflicts.csv`).
- Reasoner validation (HermiT, Protégé): classification in 10.6–11.7 s, 0 unsatisfiable classes.
- Zenodo archive: https://doi.org/10.5281/zenodo.22803650

## v4.5.0 — 2026-07-31

- First public release: 1,938 classes (1,758 symptoms in 31 categories), 15,199 subclass axioms, 12,928 existential restrictions, bilingual labels, 1,637 English definitions (93.1%), mapping tables.
